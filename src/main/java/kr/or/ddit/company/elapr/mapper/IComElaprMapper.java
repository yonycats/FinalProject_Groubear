package kr.or.ddit.company.elapr.mapper;

import java.util.List;

import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;

public interface IComElaprMapper {

	// 전자결재 요청수 조회
	public int comSelectElaprCount(PaginationInfoVO<EmpElaprVO> pagingVO);

	// 전자결재 요청 리스트 출력
	public List<EmpElaprVO> comSelectElaprList(PaginationInfoVO<EmpElaprVO> pagingVO);

}
