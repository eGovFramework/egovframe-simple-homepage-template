package egovframework.let.sym.cal.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import egovframework.let.sym.cal.service.Restde;
import egovframework.let.sym.cal.service.RestdeVO;

/**
 * 휴일 관리를 처리하는 MyBatis 매퍼 인터페이스
 * @author 공통서비스 개발팀 이중호
 * @since 2009.04.01
 * @version 1.0
 * @see
 *
 * <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자           수정내용
 *  -------    --------    ---------------------------
 *   2009.04.01  이중호          최초 생성
 *   2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 * </pre>
 */
@EgovMapper("restdeManageDao")
public interface RestdeManageMapper {

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 * @param restde
	 * @return List(일반달력 팝업 날짜정보)
	 * @throws Exception
	 */
	List<?> selectNormalRestdePopup(Restde restde) throws Exception;

	/**
	 * 행정달력 팝업 정보를 조회한다.
	 * @param restde
	 * @return List(행정달력 팝업 날짜정보)
	 * @throws Exception
	 */
	List<?> selectAdministRestdePopup(Restde restde) throws Exception;

	/**
	 * 일반달력 일간 정보를 조회한다.
	 * @param restde
	 * @return List(일반달력 일간 날짜정보)
	 * @throws Exception
	 */
	List<?> selectNormalDayCal(Restde restde) throws Exception;

	/**
	 * 일반달력 일간 휴일을 조회한다.
	 * @param restde
	 * @return List(일반달력 일간 휴일정보)
	 * @throws Exception
	 */
	List<?> selectNormalDayRestde(Restde restde) throws Exception;

	/**
	 * 일반달력 월간 휴일을 조회한다.
	 * @param restde
	 * @return List(일반달력 월간 휴일정보)
	 * @throws Exception
	 */
	List<?> selectNormalMonthRestde(Restde restde) throws Exception;

	/**
	 * 행정달력 일간 정보를 조회한다.
	 * @param restde
	 * @return List(행정달력 일간 날짜정보)
	 * @throws Exception
	 */
	List<?> selectAdministDayCal(Restde restde) throws Exception;

	/**
	 * 행정달력 일간 휴일을 조회한다.
	 * @param restde
	 * @return List(행정달력 일간 휴일정보)
	 * @throws Exception
	 */
	List<?> selectAdministDayRestde(Restde restde) throws Exception;

	/**
	 * 행정달력 월간 휴일을 조회한다.
	 * @param restde
	 * @return List(행정달력 월간 휴일정보)
	 * @throws Exception
	 */
	List<?> selectAdministMonthRestde(Restde restde) throws Exception;

	/**
	 * 휴일을 삭제한다.
	 * @param restde
	 * @throws Exception
	 */
	void deleteRestde(Restde restde) throws Exception;

	/**
	 * 휴일을 등록한다.
	 * @param restde
	 * @throws Exception
	 */
	void insertRestde(Restde restde) throws Exception;

	/**
	 * 휴일 상세항목을 조회한다.
	 * @param restde
	 * @return Restde(휴일)
	 * @throws Exception
	 */
	Restde selectRestdeDetail(Restde restde) throws Exception;

	/**
	 * 휴일 목록을 조회한다.
	 * @param searchVO
	 * @return List(휴일 목록)
	 * @throws Exception
	 */
	List<?> selectRestdeList(RestdeVO searchVO) throws Exception;

	/**
	 * 휴일 총 갯수를 조회한다.
	 * @param searchVO
	 * @return int(휴일 총 갯수)
	 * @throws Exception
	 */
	int selectRestdeListTotCnt(RestdeVO searchVO) throws Exception;

	/**
	 * 휴일을 수정한다.
	 * @param restde
	 * @throws Exception
	 */
	void updateRestde(Restde restde) throws Exception;

}
