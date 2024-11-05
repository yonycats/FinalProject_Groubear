package kr.or.ddit.employee.elapr.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUpload;
import org.springframework.stereotype.Service;

import kr.or.ddit.comm.empallinfo.vo.EmployeeAllVO;
import kr.or.ddit.comm.file.vo.AtchFileDetailVO;
import kr.or.ddit.comm.form.vo.FormVO;
import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.serviceresult.ServiceResult;
import kr.or.ddit.employee.elapr.mapper.IEmpElaprMapper;
import kr.or.ddit.employee.elapr.service.IEmpElaprService;
import kr.or.ddit.employee.elapr.vo.EmpAplnVO;
import kr.or.ddit.employee.elapr.vo.EmpElaprPrslVO;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;
import kr.or.ddit.employee.elapr.vo.EmpRerncVO;

@Service
public class EmpElaprServiceImpl implements IEmpElaprService {
	
	@Resource(name = "localPath")
	private String localPath;
	
	@Inject 
	private IEmpElaprMapper elaprMapper;
	
	/**
	 *  메인 홈 카드 상단 3개
	 */
	@Override
	public List<EmpElaprVO> selectElaprCardList(String empId) {
		return elaprMapper.selectElaprCardList(empId);
	}

	/**
	 *  메인 홈 테이블
	 */
	@Override
	public List<EmpElaprVO> selectElaprTableList(String empId) {
		return elaprMapper.selectElaprTableList(empId);
	}

	/**
	 *  전자결재 양식 목록 출력 (Jstree)
	 */
	@Override
	public List<FormVO> selectFormListJstree(String coCd) {
		return elaprMapper.selectFormListJstree(coCd);
	}

	/**
	 *  전자결재 상세보기
	 */
	@Override
	public EmpElaprVO elaprDetail(EmpElaprVO elaprVO) {
		return elaprMapper.elaprDetail(elaprVO);
	}
	
	
	
	/**
	 * 프로젝트 수정폼
	 */
	@Override
	public EmpElaprVO selectElapr(int elaprNo) {
		return elaprMapper.selectElapr(elaprNo);
	}


	/**
	 * 전자결재 수정
	 */
	@Override
	public ServiceResult empElaprUpdate(HttpServletRequest request, EmpElaprVO elaprVO) {
		ServiceResult result = null;
		int status = elaprMapper.empElaprUpdate(elaprVO);
		
		if (status > 0) {
			List<EmpAplnVO> aplnList = elaprVO.getAplnList();
			
			try {
				eplnUpdate(aplnList, elaprVO.getElaprNo(), request);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	private void eplnUpdate(List<EmpAplnVO> aplnList, int elaprNo, HttpServletRequest request) {
		
		if (aplnList != null && aplnList.size() > 0) {
			
			for (EmpAplnVO aplnVO : aplnList) {
				aplnVO.setElaprNo(elaprNo);
				elaprMapper.insertApln(aplnVO);
				
			}
		}
	}
	
	
	/**
	 * 전자결재 삭제
	 */
	@Override
	public ServiceResult empElaprDelete(HttpServletRequest request, int elaprNo) {
		ServiceResult result = null;
		
		EmpElaprVO elaprVO = elaprMapper.selectElapr(elaprNo);
		elaprMapper.deleteAlaprByElaprNo(elaprNo);		// 결재자 삭제
		elaprMapper.deleteRerncByElaprNo(elaprNo);		// 참조자 삭제
		elaprMapper.deletePrslByElaprNo(elaprNo);		// 열람자 삭제
		
		int status = elaprMapper.deleteElapr(elaprNo);
		if (status > 0) {
			List<EmpAplnVO> aplnList = elaprVO.getAplnList();
			List<EmpRerncVO> rerncList = elaprVO.getRerncList();
			List<EmpElaprPrslVO> prslList = elaprVO.getPrslList();
			
			try {
				if (aplnList != null || rerncList != null || prslList != null) {
						result = ServiceResult.OK;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			result= ServiceResult.FAILED;
		}
		return result;
	}


	/**
	 * 전자결재 신청
	 */
	/*
	@Override
	public ServiceResult empElaprInsert(HttpServletRequest req, EmpElaprVO elaprVO) {
		ServiceResult result;
		
		int status = elaprMapper.empElaprInsert(elaprVO);

		if (status > 0) {
			List<EmpAplnVO> aplnList = elaprVO.getAplnList();			// 결재선
			List<EmpRerncVO> rerncList = elaprVO.getRerncList();		// 참조
			List<EmpElaprPrslVO> prslList = elaprVO.getPrslList();		// 열람
			
			
			aplnInsert(aplnList, elaprVO.getElaprNo(), req);			// 결재선
			rerncInsert(rerncList, elaprVO.getElaprNo(), req);			// 참조
			prslInsert(prslList, elaprVO.getElaprNo(), req);			// 열람
			
			
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAILED;
		}
		return result;
	}
	*/
	
	@Override
	public ServiceResult empElaprInsert(HttpServletRequest req, EmpElaprVO elaprVO) {
		ServiceResult result;
		
//		int status = elaprMapper.empElaprInsert(elaprVO);
		int status = 0;

		if (elaprVO.getAtchFileDetailList() != null && elaprVO.getAtchFileDetailList().size() > 0) {
			status += elaprMapper.atchFileInsert(elaprVO);
			status += elaprMapper.empElaprInsert(elaprVO);
			
			
//			if (status > 0) {
			if (status > 1) {
				List<EmpAplnVO> aplnList = elaprVO.getAplnList();			// 결재선
				List<EmpRerncVO> rerncList = elaprVO.getRerncList();		// 참조
				List<EmpElaprPrslVO> prslList = elaprVO.getPrslList();		// 열람
				
				
				aplnInsert(aplnList, elaprVO.getElaprNo(), req);			// 결재선
				rerncInsert(rerncList, elaprVO.getElaprNo(), req);			// 참조
				prslInsert(prslList, elaprVO.getElaprNo(), req);			// 열람
				
				List<AtchFileDetailVO>  elaprFileList = elaprVO.getAtchFileDetailList();
				fileUpload(elaprFileList, elaprVO.getElaprNo(), elaprVO.getAtchFileCd(), elaprVO.getEmpId());
				
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAILED;
			}
		} else {
			status += elaprMapper.empElaprInsert(elaprVO);
			
			if (status > 0) {
				List<EmpAplnVO> aplnList = elaprVO.getAplnList();			// 결재선
				List<EmpRerncVO> rerncList = elaprVO.getRerncList();		// 참조
				List<EmpElaprPrslVO> prslList = elaprVO.getPrslList();		// 열람
				
				
				aplnInsert(aplnList, elaprVO.getElaprNo(), req);			// 결재선
				rerncInsert(rerncList, elaprVO.getElaprNo(), req);			// 참조
				prslInsert(prslList, elaprVO.getElaprNo(), req);			// 열람
				
				result = ServiceResult.OK;
			} else {
				result = ServiceResult.FAILED;
			}
		}
		return result;
		
	}
	
	private void fileUpload(List<AtchFileDetailVO> elaprFileList, int elaprNo, String atchFileCd, String empId) {
		String savePath = localPath + File.separator + "EmpElapr" + File.separator + elaprNo;
		
		if (elaprFileList != null && elaprFileList.size() > 0) {
			for (AtchFileDetailVO atchFileDetailVO : elaprFileList) {
				String strgNm = UUID.randomUUID().toString()  + "_" + atchFileDetailVO.getAtchFileDetailOrgnlNm();
				atchFileDetailVO.setAtchFileDetailStrgNm(strgNm);
				
				String pathNm = savePath + File.separator + strgNm;
				atchFileDetailVO.setAtchFileDetailPathNm(pathNm);
				
				File file = new File(savePath);
				if (!file.exists()) {
					file.mkdirs();
				}
				
				atchFileDetailVO.setAtchFileCd(atchFileCd);
				atchFileDetailVO.setEmpId(empId);
				elaprMapper.fileDetailInsert(atchFileDetailVO);
				
				File saveFile = new File(pathNm);
				try {
					atchFileDetailVO.getMultiFile().transferTo(saveFile);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 결재선 등록
	 * @param aplnList
	 * @param elaprNo
	 * @param req
	 */
	private void aplnInsert(List<EmpAplnVO> aplnList, int elaprNo, HttpServletRequest req) {
		if (aplnList != null && aplnList.size() > 0) {
			for (EmpAplnVO aplnVO : aplnList) {
				aplnVO.setElaprNo(elaprNo);
				// aplnVO.setAplnNo(aplnNo);
				elaprMapper.insertApln(aplnVO);
			}
		}
 	}
	
	
	/**
	 * 참조자 등록
	 * @param rerncList
	 * @param elaprNo
	 * @param req
	 */
	private void rerncInsert(List<EmpRerncVO> rerncList, int elaprNo, HttpServletRequest req) {
		if (rerncList != null && rerncList.size() > 0) {
			for (EmpRerncVO rerncVO : rerncList) {
				rerncVO.setElaprNo(elaprNo);
				elaprMapper.insertRernc(rerncVO);
			}
		}
	}

	/**
	 * 열람자 등록
	 * @param prslList
	 * @param elaprNo
	 * @param req
	 */
	private void prslInsert(List<EmpElaprPrslVO> prslList, int elaprNo, HttpServletRequest req) {
		if (prslList != null && prslList.size() > 0) {
			for (EmpElaprPrslVO prslVO : prslList) {
				prslVO.setElaprNo(elaprNo);
				elaprMapper.insertPrsl(prslVO);
			}
		}
	}
	

	/**
	 *  전자결재 데이터 가져오기
	 */
	@Override
	public EmployeeAllVO empElaprSelectImpl(EmployeeVO empVO) {
		return elaprMapper.empElaprSelectImpl(empVO);
	}

	@Override
	public EmpElaprVO getElaprByNo(int elaprNo) {
		return elaprMapper.getElaprByNo(elaprNo);
	}

	/**
	 * 결재자 리스트
	 */
	@Override
	public List<EmpAplnVO> selectAplnList(EmpElaprVO param) {
		return elaprMapper.selectAplnList(param);
	}

	/**
	 * 참조자 리스트
	 */
	@Override
	public List<EmpRerncVO> selectRerncList(EmpElaprVO param) {
		return elaprMapper.selectRerncList(param);
	}

	/**
	 * 열람자 리스트
	 */
	@Override
	public List<EmpElaprPrslVO> selectPrslList(EmpElaprVO param) {
 		return elaprMapper.selectPrslList(param);
	}

	
	/////////////////////////////////////////////////////////////
	
	/**
	 * 결재대기문서 페이징
	 */
	@Override
	public int selectWatingCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return elaprMapper.selectWatingCount(pagingVO);
	}

	/**
	 * 결재대기문서 리스트
	 */
	@Override
	public List<EmpElaprVO> selectWatingList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return elaprMapper.selectWatingList(pagingVO);
	}

	/**
	 * 결재대기문서 결재진행
	 */
	@Override
	public ServiceResult empElaprWatingUpdate(HttpServletRequest request, EmpAplnVO aplnVO) {
	    ServiceResult result = null;
	    int status = elaprMapper.empElaprWatingUpdate(aplnVO);

	    if (status > 0) {
	        result = ServiceResult.OK;
	    } else {
	        result = ServiceResult.FAILED;
	    }
	    return result;
	}
	
	@Override
	public int updateElaprEndDt(int elaprNo) {
		return elaprMapper.updateElaprEndDt(elaprNo);
	}

	/**
	 * 결재 상태가 모두 완료되었는지 확인
	 */
	@Override
	public int countPendingApprovals(int elaprNo) {
		return elaprMapper.countPendingApprovals(elaprNo);
	}

	/**
	 * 모든 결재가 완료된 경우 전자결재 상태를 업데이트
	 */
	@Override
	public void updateApprovalStatus(int elaprNo, String status) {
		elaprMapper.updateApprovalStatus(elaprNo, status);
	}

	/**
	 * 결재대기문서 반려진행
	 */
	@Override
	public ServiceResult empElaprRjctUpdate(HttpServletRequest request, EmpAplnVO aplnVO) {
		ServiceResult result = null;
	    int status = elaprMapper.empElaprRjctUpdate(aplnVO);

	    if (status > 0) {
	        result = ServiceResult.OK;
	    } else {
	        result = ServiceResult.FAILED;
	    }
	    return result;
	}

	/**
	 * 결재대기문서 반려 상태코드 업데이트
	 */
	@Override
	public int rjctElaprUpdate(int elaprNo) {
		return elaprMapper.rjctElaprUpdate(elaprNo);
	}

	/**
	 * 상신취소 유무
	 */
	@Override
	public int getApprovalCount(int elaprNo) {
		return elaprMapper.getApprovalCount(elaprNo);
	}

	@Override
	public AtchFileDetailVO atchFileDetailOneSelect(String atchFileDetailCd) {
		return elaprMapper.atchFileDetailOneSelect(atchFileDetailCd);
	}

	@Override
	public List<AtchFileDetailVO> atchFileDetailListSelect(String atchFileCd) {
		return elaprMapper.atchFileDetailListSelect(atchFileCd);
	}

}
