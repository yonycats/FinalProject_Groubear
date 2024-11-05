package kr.or.ddit.company.elapr.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.company.elapr.mapper.IComElaprMapper;
import kr.or.ddit.company.elapr.service.IComElaprService;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;

@Service
public class ComElaprServiceImpl implements IComElaprService {

	@Inject
	private IComElaprMapper comElaprMapper;
	
	// 전자결재 요청수 조회
	@Override
	public int comSelectElaprCount(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return comElaprMapper.comSelectElaprCount(pagingVO);
	}
	
	
	// 전자결재 요청 리스트 출력
	@Override
	public List<EmpElaprVO> comSelectElaprList(PaginationInfoVO<EmpElaprVO> pagingVO) {
		return comElaprMapper.comSelectElaprList(pagingVO);
	}

}
