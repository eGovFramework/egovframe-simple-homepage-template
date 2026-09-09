package egovframework.let.sym.cal.service;

import java.util.List;

/**
 *
 * 휴일에 관한 서비스 인터페이스 클래스를 정의한다
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
public interface EgovCalRestdeManageService {

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 * @param restde
	 * @return List(일반달력 팝업 날짜정보)
	 */
	List<?> selectNormalRestdePopup(Restde restde);

	/**
	 * 행정달력 팝업 정보를 조회한다.
	 * @param restde
	 * @return List(행정달력 팝업 날짜정보)
	 */
	List<?> selectAdministRestdePopup(Restde restde);

	/**
	 * 일반달력 일간 정보를 조회한다.
	 * @param restde
	 * @return List(일반달력 일간 날짜정보)
	 */
	List<?> selectNormalDayCal(Restde restde);

	/**
	 * 일반달력 일간 휴일을 조회한다.
	 * @param restde
	 * @return List(일반달력 일간 휴일정보)
	 */
	List<?> selectNormalDayRestde(Restde restde);

	/**
	 * 일반달력 월간 휴일을 조회한다.
	 * @param restde
	 * @return List(일반달력 월간 휴일정보)
	 */
	List<?> selectNormalMonthRestde(Restde restde);

	/**
	 * 행정달력 일간 정보를 조회한다.
	 * @param restde
	 * @return List(행정달력 일간 날짜정보)
	 */
	List<?> selectAdministDayCal(Restde restde);

	/**
	 * 행정달력 일간 휴일을 조회한다.
	 * @param restde
	 * @return List(행정달력 일간 휴일정보)
	 */
	List<?> selectAdministDayRestde(Restde restde);

	/**
	 * 행정달력 월간 휴일을 조회한다.
	 * @param restde
	 * @return List(행정달력 월간 휴일정보)
	 */
	List<?> selectAdministMonthRestde(Restde restde);

	/**
	 * 휴일을 삭제한다.
	 * @param restde
	 */
	void deleteRestde(Restde restde);

	/**
	 * 휴일을 등록한다.
	 * @param restde
	 */
	void insertRestde(Restde restde);

	/**
	 * 휴일 상세항목을 조회한다.
	 * @param restde
	 * @return Restde(휴일)
	 */
	Restde selectRestdeDetail(Restde restde);

	/**
	 * 휴일 목록을 조회한다.
	 * @param searchVO
	 * @return List(휴일 목록)
	 */
	List<?> selectRestdeList(RestdeVO searchVO);

    /**
     * 휴일 총 갯수를 조회한다.
     * @param searchVO
     * @return int(휴일 총 갯수)
     */
    int selectRestdeListTotCnt(RestdeVO searchVO);

	/**
	 * 휴일을 수정한다.
	 * @param restde
	 */
	void updateRestde(Restde restde);

}
