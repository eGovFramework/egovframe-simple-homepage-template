package egovframework.com.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.EgovUserDetailsService;

/**
 *
 * @author 공통서비스 개발팀 서준식
 * @since 2011. 6. 25.
 * @version 1.0
 * @see
 *
 * <pre>
 * 개정이력(Modification Information)
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2011.08.12    서준식        최초생성
 *
 *  </pre>
 */

public class EgovUserDetailsSessionServiceImpl extends EgovAbstractServiceImpl implements EgovUserDetailsService {

	@Override
	public Object getAuthenticatedUser() {
		return RequestContextHolder.getRequestAttributes().getAttribute("LoginVO", RequestAttributes.SCOPE_SESSION);
	}

	@Override
	public List<String> getAuthorities() {

		// 권한 설정을 리턴한다.
		List<String> listAuth = new ArrayList<String>();

		Object authenticatedUser = getAuthenticatedUser();
		if (!(authenticatedUser instanceof LoginVO)) {
			return listAuth;
		}

		LoginVO loginVO = (LoginVO) authenticatedUser;
		if (loginVO.getId() == null) {
			return listAuth;
		}

		listAuth.add("ROLE_USER");
		if (isAdmin(loginVO.getId())) {
			listAuth.add("ROLE_ADMIN");
		}

		return listAuth;
	}

	/**
	 * globals.properties의 Globals.Admin.Ids(콤마로 구분된 관리자 계정 ID 목록)에
	 * 등록된 계정만 ROLE_ADMIN을 부여한다.
	 */
	private boolean isAdmin(String id) {
		String adminIds = EgovProperties.getProperty("Globals.Admin.Ids");
		if (adminIds == null || EgovProperties.ERR_CODE.equals(adminIds) || adminIds.trim().isEmpty()) {
			return false;
		}
		for (String adminId : adminIds.split(",")) {
			if (adminId.trim().equals(id)) {
				return true;
			}
		}
		return false;
	}

	@Override
	public Boolean isAuthenticated() {
		// 인증된 유저인지 확인한다.
		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute("LoginVO", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}

	}

}
