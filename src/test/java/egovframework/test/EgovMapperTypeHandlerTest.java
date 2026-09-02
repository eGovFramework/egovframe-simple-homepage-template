package egovframework.test;

import static org.junit.jupiter.api.Assertions.assertDoesNotThrow;
import static org.junit.jupiter.api.Assertions.assertFalse;

import java.io.IOException;
import java.util.Set;
import java.util.TreeSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.ibatis.datasource.unpooled.UnpooledDataSource;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

/**
 * 매퍼는 DB 타입과 무관하게 SqlSessionFactory 생성 단계를 통과한다.
 *
 * MyBatis는 매퍼를 파싱하면서 {@code typeHandler}로 지정된 클래스를 그 자리에서
 * 인스턴스화한다. iBATIS 2 계약을 따르는 핸들러를 지정하면 그 초기화가 실패해
 * 해당 DB 타입으로는 기동하지 못한다.
 *
 * {@code egovframework/spring/com/context-mapper.xml}의 sqlSession 빈과 같은
 * configLocation·mapperLocations로 만든다.
 *
 * @author 최완택
 * @since 2026-09-02
 */
@DisplayName("매퍼 타입핸들러")
class EgovMapperTypeHandlerTest {

	private static final String MAPPER_PATTERN = "classpath:/egovframework/mapper/let/**/*.xml";

	private static final Pattern DB_TYPE = Pattern.compile("_([a-z]+)\\.xml$");

	@Test
	@DisplayName("모든 DB 타입에서 SqlSessionFactory 가 만들어진다")
	void everyDbTypeBuildsSqlSessionFactory() throws IOException {
		Set<String> dbTypes = dbTypes();
		assertFalse(dbTypes.isEmpty(), "매퍼에서 DB 타입을 찾지 못했다: " + MAPPER_PATTERN);

		for (String dbType : dbTypes) {
			assertDoesNotThrow(() -> buildSqlSessionFactory(dbType), "Globals.DbType=" + dbType);
		}
	}

	private Set<String> dbTypes() throws IOException {
		Set<String> dbTypes = new TreeSet<>();
		for (Resource resource : new PathMatchingResourcePatternResolver().getResources(MAPPER_PATTERN)) {
			Matcher matcher = DB_TYPE.matcher(String.valueOf(resource.getFilename()));
			if (matcher.find()) {
				dbTypes.add(matcher.group(1));
			}
		}
		return dbTypes;
	}

	private void buildSqlSessionFactory(String dbType) throws Exception {
		PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();

		SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
		sqlSessionFactoryBean.setDataSource(new UnpooledDataSource());
		sqlSessionFactoryBean.setConfigLocation(
			resolver.getResource("classpath:/egovframework/mapper/config/mapper-config.xml"));
		sqlSessionFactoryBean.setMapperLocations(
			resolver.getResources("classpath:/egovframework/mapper/let/**/*_" + dbType + ".xml"));

		sqlSessionFactoryBean.afterPropertiesSet();
	}

}
