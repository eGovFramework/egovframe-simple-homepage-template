package egovframework.let.sym.cal.service.impl;

import java.util.List;

import org.egovframe.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import egovframework.let.sym.cal.service.EgovCalRestdeManageService;
import egovframework.let.sym.cal.service.Restde;
import egovframework.let.sym.cal.service.RestdeVO;
import jakarta.annotation.Resource;

/**
 *
 * 휴일에 대한 서비스 구현클래스를 정의한다
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
@Service("RestdeManageService")
public class EgovCalRestdeManageServiceImpl extends EgovAbstractServiceImpl implements EgovCalRestdeManageService {

    @Resource(name="RestdeManageDAO")
    private RestdeManageDAO restdeManageDAO;

	/**
	 * 일반달력 팝업 정보를 조회한다.
	 */
    @Override
	public List<?> selectNormalRestdePopup(Restde restde) {
		return restdeManageDAO.selectNormalRestdePopup(restde);
	}

	/**
	 * 행정달력 팝업 정보를 조회한다.
	 */
    @Override
	public List<?> selectAdministRestdePopup(Restde restde) {
		return restdeManageDAO.selectAdministRestdePopup(restde);
	}

	/**
	 * 일반달력 일간 정보를 조회한다.
	 */
    @Override
	public List<?> selectNormalDayCal(Restde restde) {
		return restdeManageDAO.selectNormalDayCal(restde);
	}

	/**
	 * 일반달력 일간 휴일을 조회한다.
	 */
    @Override
	public List<?> selectNormalDayRestde(Restde restde) {
		return restdeManageDAO.selectNormalDayRestde(restde);
	}

	/**
	 * 일반달력 월간 휴일을 조회한다.
	 */
    @Override
	public List<?> selectNormalMonthRestde(Restde restde) {
		return restdeManageDAO.selectNormalMonthRestde(restde);
	}

	/**
	 * 행정달력 일간 정보를 조회한다.
	 */
    @Override
	public List<?> selectAdministDayCal(Restde restde) {
		return restdeManageDAO.selectAdministDayCal(restde);
	}

	/**
	 * 행정달력 일간 휴일을 조회한다.
	 */
    @Override
	public List<?> selectAdministDayRestde(Restde restde) {
		return restdeManageDAO.selectAdministDayRestde(restde);
	}

    /**
	 * 행정달력 월간 휴일을 조회한다.
	 */
    @Override
	public List<?> selectAdministMonthRestde(Restde restde) {
		return restdeManageDAO.selectAdministMonthRestde(restde);
	}

    /**
	 * 휴일을 삭제한다.
	 */
	@Override
	public void deleteRestde(Restde restde) {
		restdeManageDAO.deleteRestde(restde);
	}

	/**
	 * 휴일을 등록한다.
	 */
	@Override
	public void insertRestde(Restde restde) {
    	restdeManageDAO.insertRestde(restde);
	}

	/**
	 * 휴일 상세항목을 조회한다.
	 */
	@Override
	public Restde selectRestdeDetail(Restde restde) {
    	Restde ret = restdeManageDAO.selectRestdeDetail(restde);
    	return ret;
	}

	/**
	 * 휴일 목록을 조회한다.
	 */
	@Override
	public List<?> selectRestdeList(RestdeVO searchVO) {
        return restdeManageDAO.selectRestdeList(searchVO);
	}

	/**
	 * 휴일 총 갯수를 조회한다.
	 */
	@Override
	public int selectRestdeListTotCnt(RestdeVO searchVO) {
        return restdeManageDAO.selectRestdeListTotCnt(searchVO);
	}

	/**
	 * 휴일을 수정한다.
	 */
	@Override
	public void updateRestde(Restde restde) {
		restdeManageDAO.updateRestde(restde);
	}

}
