package egovframework.com.cmm.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * 관리자(ROLE_ADMIN) 권한이 필요한 컨트롤러 메소드에 사용하는 애노테이션.
 * egov-com-loginaop.xml에 설정된 AOP(adminAuthorizationAspect)가
 * 이 애노테이션이 붙은 메소드 실행 전에 로그인 여부와 ROLE_ADMIN 권한 여부를 검증한다.
 *
 * @see egovframework.com.cmm.util.EgovAdminAuthorizationAspect
 */
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
public @interface RequireAdmin {
}
