package egovframework.let.cop.smt.sim.service;

import java.io.Serializable;

import org.egovframe.rte.ptl.reactive.validation.EgovNullCheck;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

/**
 * 일정관리 VO Class 구현
 * @since 2009.04.10
 * @see
 * <pre>
 * << 개정이력(Modification Information) >>  수정일      수정자           수정내용 -------    ---
 * -----    --------------------------- 2009.04.10  장동한          최초 생성 2011.05.31
 * JJY           경량환경 커스터마이징버전 생성
 * </pre>
 * @author 조재영
 * @version 1.0
 * @created 09-6-2011 오전 10:08:07
 */
@Getter
@Setter
public class IndvdlSchdulManageVO implements Serializable {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	/** 일정ID */
	private String schdulId;

	/** 일정구분(회의/교육/세미나/강의 기타) */
	@EgovNullCheck(message="일정구분은 필수입력 항목입니다.")
	private String schdulSe;

	/** 일정부서ID */
	private String schdulDeptId;

	/** 일정종류(부서일정/개인일정) */
	private String schdulKindCode;

	/** 일정시작일자 */
	private String schdulBgnde;

	/** 일정종료일자 */
	private String schdulEndde;

	/** 일정명 */
	@EgovNullCheck(message="일정명은 필수입력 항목입니다.")
	@Size(max=255, message="일정명은 255자를 초과할 수 없습니다.")
	private String schdulNm;

	/** 일정내용 */
	@EgovNullCheck(message="일정내용은 필수입력 항목입니다.")
	@Size(max=2500, message="일정내용은 2500자를 초과할 수 없습니다.")
	private String schdulCn;

	/** 일정장소 */
	private String schdulPlace;

	/** 일정중요도코드 */
	@EgovNullCheck(message="중요도는 필수입력 항목입니다.")
	private String schdulIpcrCode;

	/** 일정담담자ID */
	private String schdulChargerId;

	/** 첨부파일ID */
	private String atchFileId;

	/** 반복구분(반복, 연속, 요일반복) */
	private String reptitSeCode;

	/** 최초등록시점 */
	private String frstRegisterPnttm = "";

	/** 최초등록자ID */
	private String frstRegisterId = "";

	/** 최종수정시점 */
	private String lastUpdusrPnttm = "";

	/** 최종수정ID */
	private String lastUpdusrId = "";

	/** 일정시작일자(시간) */
	@EgovNullCheck(message="일정시작(시)는 필수입력 항목입니다.")
	private String schdulBgndeHH = "";

	/** 일정시작일자(분) */
	@EgovNullCheck(message="일정시작(분)은 필수입력 항목입니다.")
	private String schdulBgndeMM = "";

	/** 일정종료일자(시간) */
	@EgovNullCheck(message="일정종료(시)는 필수입력 항목입니다.")
	private String schdulEnddeHH = "";

	/** 일정종료일자(분) */
	@EgovNullCheck(message="일정종료(분)은 필수입력 항목입니다.")
	private String schdulEnddeMM = "";

	/** 일정시작일자(Year/Month/Day) */
	@EgovNullCheck(message="일정시작일자는 필수입력 항목입니다.")
	private String schdulBgndeYYYMMDD = "";

	/** 일정종료일자(Year/Month/Day) */
	@EgovNullCheck(message="일정종료일자는 필수입력 항목입니다.")
	private String schdulEnddeYYYMMDD = "";

	/** 담당부서 */
	@EgovNullCheck(message="부서는 필수입력 항목입니다.")
	private String schdulDeptName = "";

	/** 담당자명 */
	@EgovNullCheck(message="담당자는 필수입력 항목입니다.")
	private String schdulChargerName = "";

}
