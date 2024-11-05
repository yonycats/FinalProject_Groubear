package kr.or.ddit.employee.elapr.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.employee.elapr.mapper.IEmpMyElaprMapper;
import kr.or.ddit.employee.elapr.service.IEmpMyElaprService;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;

@Service
public class EmpMyElaprServiceImpl implements IEmpMyElaprService {

	@Inject
	private IEmpMyElaprMapper myElaprMapper;
	
	// //////////////////// 기안 문서함 //////////////////// 
	/**
	 *  기안 문서함 페이지수
	 */
	@Override
	public int selectDraftCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectDraftCount(pagingVO);
	}
	
	/**
	 *  개인 - 기안 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyElaprDraftList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyElaprDraftList(pagingVO);
	}

	
	// //////////////////// 전체 문서함 //////////////////// 
	/**
	 * 전체 문서함 페이징
	 */
	@Override
	public int selectAllCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectAllCount(pagingVO);
	}

	/**
	 * 전체 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectAllList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectAllList(pagingVO);
	}
	
	/**
	 * 결재 긴급 문서함 페이징
	 */
	@Override
	public int selectEmrgCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectEmrgCount(pagingVO);
	}

	/**
	 * 결재 긴급 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectEmrgList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectEmrgList(pagingVO);
	}

	
	/**
	 * 진행 문서함 페이징
	 */
	@Override
	public int selectProgressCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectProgressCount(pagingVO);
	}

	/**
	 * 진행 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectProgressList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectProgressList(pagingVO);
	}

	/**
	 * 결재 완료 문서함 페이징
	 */
	@Override
	public int selectCompleteCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectCompleteCount(pagingVO);
	}

	/**
	 * 결재 완료 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectCompleteList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectCompleteList(pagingVO);
	}

	/**
	 * 결재 반려 문서함 페이징
	 */
	@Override
	public int selectRjctCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectRjctCount(pagingVO);
	}

	/**
	 * 결재 반려 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectRjctList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectRjctList(pagingVO);
	}


	// //////////////////// 참조/열람 완료문서함 ////////////////////
	/**
	 * 참조 문서함 페이징
	 */
	@Override
	public int selectRerncCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectRerncCount(pagingVO);
	}

	/**
	 * 참조 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectRerncList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectRerncList(pagingVO);
	}
	
	/**
	 * 열람 문서함 페이징
	 */
	@Override
	public int selectPrslCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectPrslCount(pagingVO);
	}

	/**
	 * 열람 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectPrslList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectPrslList(pagingVO);
	}
	
	
	// //////////////////// 개인 결재 문서함 ////////////////////
	
	/**
	 * 개인 전체 문서함 페이징
	 */
	@Override
	public int selectMyAllCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyAllCount(pagingVO);
	}

	/**
	 * 개인 전체 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyAllList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyAllList(pagingVO);
	}

	/**
	 * 개인 긴급 문서함 페이징
	 */
	@Override
	public int selectMyEmrgCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyEmrgCount(pagingVO);
	}

	/**
	 * 개인 긴급 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyEmrgList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyEmrgList(pagingVO);
	}

	
	/**
	 * 개인 진행 문서함 페이징
	 */
	@Override
	public int selectMyProgressCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyProgressCount(pagingVO);
	}

	/**
	 * 개인 진행 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyProgressList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyProgressList(pagingVO);
	}
	
	/**
	 * 개인 완료 문서함 페이징
	 */
	@Override
	public int selectMyCompleteCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyCompleteCount(pagingVO);
	}

	/**
	 * 개인 완료 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyCompleteList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyCompleteList(pagingVO);
	}

	/**
	 * 개인 반려 문서함 페이징
	 */
	@Override
	public int selectMyRjctCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyRjctCount(pagingVO);
	}

	/**
	 * 개인 반려 문서함 리스트
	 */
	@Override
	public List<EmpElaprVO> selectMyRjctList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return myElaprMapper.selectMyRjctList(pagingVO);
	}

	/**
	 * 전자결재 캘린더 연동
	 */
	@Override
	public List<EmpElaprVO> selectAllCalList(String empId) {
		return myElaprMapper.selectAllCalList(empId);
	}

	
	// 메인페이지용 리스트 출력
	/**
	 * 메인페이지용 긴급문서함 리스트 출력
	 */
	@Override
	public List<EmpElaprVO> selectEmrgHomeList(String empId) {
		return myElaprMapper.selectEmrgHomeList(empId);
	}
	
	/**
	 * 메인페이지용 전체문서함 리스트 출력
	 */
	@Override
	public List<EmpElaprVO> selectAllHomeList(String empId) {
		return myElaprMapper.selectAllHomeList(empId);
	}

	/**
	 * 메인페이지용 참조 문서함 리스트 출력
	 */
	@Override
	public List<EmpElaprVO> selectRerncHomeList(String empId) {
		return myElaprMapper.selectRerncHomeList(empId);
	}
	
	/**
	 * 메인페이지용 열람 문서함 리스트 출력
	 */
	@Override
	public List<EmpElaprVO> selectPrslHomeList(String empId) {
		return myElaprMapper.selectPrslHomeList(empId);
	}


}
