package egovframework.let.cop.bbs.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.EgovMapper;

import egovframework.let.cop.bbs.service.BoardMaster;
import egovframework.let.cop.bbs.service.BoardMasterVO;

/**
 * 게시판 속성정보 관리를 처리하는 MyBatis 매퍼 인터페이스
 *
 * @author 공통 서비스 개발팀 이삼섭
 * @since 2009.03.12
 * @version 1.0
 * @see
 *
 *      <pre>
 * << 개정이력(Modification Information) >>
 *
 *   수정일      수정자          수정내용
 *  -------    --------    ---------------------------
 *  2009.03.12  이삼섭          최초 생성
 *  2011.08.31  JJY            경량환경 템플릿 커스터마이징버전 생성
 *
 *      </pre>
 */
@EgovMapper("BBSAttributeManageDAO")
public interface BBSAttributeManageMapper {

	/**
	 * 등록된 게시판 속성정보를 삭제한다.
	 *
	 * @param boardMaster 삭제할 게시판 정보
	 * @throws Exception
	 */
	void deleteBBSMasterInf(BoardMaster boardMaster) throws Exception;

	/**
	 * 신규 게시판 속성정보를 등록한다.
	 *
	 * @param boardMaster 등록할 게시판 정보
	 * @return 등록된 행 수
	 * @throws Exception
	 */
	int insertBBSMasterInf(BoardMaster boardMaster) throws Exception;

	/**
	 * 게시판 속성정보 한 건을 상세조회 한다.
	 *
	 * @param vo 조회할 게시판 정보
	 * @return 게시판 속성 상세 VO
	 * @throws Exception
	 */
	BoardMasterVO selectBBSMasterInf(BoardMaster vo) throws Exception;

	/**
	 * 게시판 속성정보 목록을 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 게시판 속성 목록
	 * @throws Exception
	 */
	List<BoardMasterVO> selectBBSMasterInfs(BoardMasterVO vo) throws Exception;

	/**
	 * 게시판 속성정보 목록 건수를 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 목록 건수
	 * @throws Exception
	 */
	int selectBBSMasterInfsCnt(BoardMasterVO vo) throws Exception;

	/**
	 * 게시판 속성정보를 수정한다.
	 *
	 * @param boardMaster 수정할 게시판 정보
	 * @throws Exception
	 */
	void updateBBSMasterInf(BoardMaster boardMaster) throws Exception;

	/**
	 * 유효한 게시판 목록을 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 게시판 속성 목록
	 * @throws Exception
	 */
	List<BoardMasterVO> selectAllBBSMaster(BoardMasterVO vo) throws Exception;

	/**
	 * 사용중인 게시판 속성정보 목록을 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 게시판 속성 목록
	 * @throws Exception
	 */
	List<BoardMasterVO> selectBdMstrListByTrget(BoardMasterVO vo) throws Exception;

	/**
	 * 사용중인 게시판 속성정보 목록 건수를 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 목록 건수
	 * @throws Exception
	 */
	int selectBdMstrListCntByTrget(BoardMasterVO vo) throws Exception;

	/**
	 * 커뮤니티, 동호회등 게시판 사용등록이 된 게시판 목록 전체를 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 게시판 속성 목록
	 * @throws Exception
	 */
	List<BoardMasterVO> selectAllBdMstrByTrget(BoardMasterVO vo) throws Exception;

	/**
	 * 사용 중이지 않은 게시판 속성정보 목록을 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 게시판 속성 목록
	 * @throws Exception
	 */
	List<BoardMasterVO> selectNotUsedBdMstrList(BoardMasterVO vo) throws Exception;

	/**
	 * 사용 중이지 않은 게시판 속성정보 목록 건수를 조회한다.
	 *
	 * @param vo 조회 조건 VO
	 * @return 목록 건수
	 * @throws Exception
	 */
	int selectNotUsedBdMstrListCnt(BoardMasterVO vo) throws Exception;
}
