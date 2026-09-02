package egovframework.let.cop.bbs.web;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.io.InputStream;
import java.util.Properties;

import org.egovframe.rte.fdl.property.EgovPropertyService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;

import egovframework.test.EgovTestAbstractSpring;

/**
 * 게시판마스터 등록·수정이 조회하는 첨부 가능 파일 크기 프로퍼티 키 테스트
 *
 * @author 최완택
 * @since 2026-09-02
 */
@ContextConfiguration(classes = { EgovBBSAttributeManageControllerPosblAtchFileSizeTest.class, EgovTestAbstractSpring.class })

@Configuration

class EgovBBSAttributeManageControllerPosblAtchFileSizeTest extends EgovTestAbstractSpring {

	/** EgovBBSAttributeManageController 가 첨부 가능 파일 크기를 조회할 때 쓰는 키 */
	private static final String KEY = "Globals.posblAtchFileSize";

	/** globals.properties 경로 */
	private static final String GLOBALS = "/egovframework/egovProps/globals.properties";

	/** EgovPropertyService */
	@Autowired
	private EgovPropertyService propertyService;

	@Test
	@DisplayName("게시판마스터 등록·수정이 조회하는 키가 globals.properties 에 선언된 값을 돌려준다")
	void testPosblAtchFileSizeIsResolvable() throws Exception {
		final Properties globals = new Properties();
		try (InputStream inputStream = getClass().getResourceAsStream(GLOBALS)) {
			globals.load(inputStream);
		}

		assertNotNull(globals.getProperty(KEY), GLOBALS + " 에 " + KEY + " 선언이 없다");

		assertEquals(globals.getProperty(KEY), propertyService.getString(KEY),
				KEY + " 가 propertiesService 로 조회되지 않는다");
	}

}
