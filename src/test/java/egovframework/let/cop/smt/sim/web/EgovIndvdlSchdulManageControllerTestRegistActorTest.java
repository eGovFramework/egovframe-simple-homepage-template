package egovframework.let.cop.smt.sim.web;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

import org.junit.jupiter.api.Test;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;

import egovframework.com.cmm.LoginVO;
import egovframework.test.EgovTestAbstractSpringMvc;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * [일정관리][EgovIndvdlSchdulManageController.IndvdlSchdulManageRegistActor] Controller 단위 테스트
 *
 * @author 최완택
 * @since 2026-09-02
 *
 */

@RequiredArgsConstructor
@Slf4j
class EgovIndvdlSchdulManageControllerTestRegistActorTest extends EgovTestAbstractSpringMvc {

	/**
	 * 서버 검증에 걸려 등록 폼으로 되돌아갈 때 폼이 필요로 하는 목록이 모델에 남아 있어야 한다.
	 *
	 * @throws Exception
	 */
	@Test
	void test() throws Exception {
		// given
		final LoginVO loginVO = new LoginVO();
		loginVO.setId("TEST1");
		loginVO.setUniqId("USRCNFRM_00000000000");

		final MockHttpSession session = new MockHttpSession();
		session.setAttribute("LoginVO", loginVO);

		// when 일정명을 비운 채 저장한다
		final MvcResult mvcResult = mockMvc
				.perform(multipart("/cop/smt/sim/EgovIndvdlSchdulManageRegistActor.do")

						.session(session)

						.param("cmd", "save")

						.param("schdulSe", "1")
						.param("schdulIpcrCode", "1")
						.param("reptitSeCode", "1")
						.param("schdulCn", "일정내용")
						.param("schdulBgndeYYYMMDD", "2026-09-02")
						.param("schdulEnddeYYYMMDD", "2026-09-02")
						.param("schdulBgndeHH", "09")
						.param("schdulBgndeMM", "00")
						.param("schdulEnddeHH", "18")
						.param("schdulEnddeMM", "00")
						.param("schdulBgnde", "20260902090000")
						.param("schdulEndde", "20260902180000")
						.param("schdulDeptName", "관리자부서")
						.param("schdulDeptId", "ORGNZT_0000000000000")
						.param("schdulChargerName", "관리자")
						.param("schdulChargerId", "USRCNFRM_00000000000"))

				.andReturn();

		// then 등록 폼으로 되돌아가되 셀렉트 박스를 채울 목록이 함께 담겨야 한다
		final ModelMap modelMap = mvcResult.getModelAndView().getModelMap();

		assertEquals("/cop/smt/sim/EgovIndvdlSchdulManageRegist", mvcResult.getModelAndView().getViewName(),
				"검증에 걸리면 등록 폼으로 되돌아간다.");

		final BindingResult bindingResult = (BindingResult) modelMap
				.get(BindingResult.MODEL_KEY_PREFIX + "indvdlSchdulManageVO");
		assertNotNull(bindingResult, "일정명이 비었으므로 검증 오류가 있어야 한다.");
		assertTrue(bindingResult.hasFieldErrors("schdulNm"), "일정명이 비었으므로 검증 오류가 있어야 한다.");

		for (final String attributeName : new String[] { "schdulSe", "schdulIpcrCode", "reptitSeCode", "schdulBgndeHH",
				"schdulBgndeMM", "schdulEnddeHH", "schdulEnddeMM" }) {
			assertNotNull(modelMap.get(attributeName), attributeName + " 목록이 없으면 폼의 선택 항목이 비어 다시 고를 수 없다.");
		}

		if (log.isDebugEnabled()) {
			log.debug("test");
		}
	}

}
