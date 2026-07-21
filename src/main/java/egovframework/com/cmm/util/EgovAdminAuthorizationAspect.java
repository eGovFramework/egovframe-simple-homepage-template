package egovframework.com.cmm.util;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import egovframework.com.cmm.EgovMessageSource;
import jakarta.annotation.Resource;

/**
 * {@code @RequireAdmin}이 붙은 컨트롤러 메소드 실행 전에 로그인 여부와
 * 관리자 권한(ROLE_ADMIN) 여부를 검증하는 Aspect.
 *
 * @see egovframework.com.cmm.annotation.RequireAdmin
 */
public class EgovAdminAuthorizationAspect {

	@Resource(name = "egovMessageSource")
	private EgovMessageSource egovMessageSource;

	public void assertAdmin() throws ModelAndViewDefiningException {
		if (!EgovUserDetailsHelper.isAuthenticated()) {
			ModelAndView modelAndView = new ModelAndView("cmm/uat/uia/EgovLoginUsr");
			modelAndView.addObject("message", egovMessageSource.getMessage("fail.common.login"));
			throw new ModelAndViewDefiningException(modelAndView);
		}

		List<String> authorities = EgovUserDetailsHelper.getAuthorities();
		if (authorities == null || !authorities.contains("ROLE_ADMIN")) {
			ModelAndView modelAndView = new ModelAndView("cmm/error/accessDenied");
			modelAndView.addObject("message", egovMessageSource.getMessage("fail.common.authority"));
			throw new ModelAndViewDefiningException(modelAndView);
		}
	}
}
