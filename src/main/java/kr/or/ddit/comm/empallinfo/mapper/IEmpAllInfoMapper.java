package kr.or.ddit.comm.empallinfo.mapper;

import kr.or.ddit.comm.empallinfo.vo.EmployeeAllVO;
import kr.or.ddit.comm.security.vo.EmployeeVO;

public interface IEmpAllInfoMapper {

	// 사원 정보 가져오기 (회사정보, 사원정보, 부서정보, 팀정보)
	public EmployeeAllVO selectEmpImpl(EmployeeVO employeeVO);
	
}
