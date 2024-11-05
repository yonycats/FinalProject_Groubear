package kr.or.ddit.comm.tiles.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.comm.project.service.IProjectService;
import kr.or.ddit.comm.project.vo.ProjectVO;
import kr.or.ddit.comm.security.vo.CompanyVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.company.personnelInformation.service.IInformationService;
import kr.or.ddit.company.personnelInformation.vo.DepartmentMenuVO;
import kr.or.ddit.company.personnelInformation.vo.DepartmentVO;
import kr.or.ddit.company.personnelInformation.vo.JobGradeVO;
import kr.or.ddit.company.personnelInformation.vo.TeamVO;
import kr.or.ddit.employee.elapr.service.IEmpMyElaprService;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;
import kr.or.ddit.employee.workStatus.service.IEmpWorkStatusService;
import kr.or.ddit.employee.workStatus.vo.EmpWorkStatusVO;
import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
@RequestMapping("/employee")
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class EmployeeMainController {
	
	@Inject
	private ITIlesService tilesService;
	
	@Inject
	private IEmpWorkStatusService workStatusService;
	
	@Inject
	private IInformationService infoService;
	
	@Inject
	private IProjectService projectService;
	
	@Inject
	private IEmpMyElaprService myElaprService;

	
	@GetMapping("/main.do")
	public String home(Locale locale, Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		EmployeeVO employeeVO = user.getMember();
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		TeamVO teamVO = tilesService.getTeam(empVO);
				
		// 출 퇴근 정보 가져오기
		EmpWorkStatusVO EmpWorkStatusVO = workStatusService.getTodayWorkStatus(empVO);
		
		CompanyVO companyVO = tilesService.getCompany(employeeVO);
		log.info("넣은 deptCd값 : " + employeeVO.getDeptCd());
		model.addAttribute("companyVO", companyVO);
		List<DepartmentMenuVO> departmentMenuList = infoService.getSidebar(employeeVO.getDeptCd());
		log.info("가져온 메뉴번호 : " + departmentMenuList);
		List<EmployeeVO> empAllList = infoService.comAllEmpList(employeeVO);
		List<DepartmentVO> deptList = infoService.selectDeptList(employeeVO);
		List<JobGradeVO> jbgdList = infoService.selectJBGDList(employeeVO);
		List<TeamVO> teamList = infoService.selectTeamList(employeeVO);
		model.addAttribute("departmentMenuList", departmentMenuList);
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("empAllList", empAllList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("jbgdList", jbgdList);
		model.addAttribute("teamList", teamList);
		
		
		model.addAttribute("workStatusVO",EmpWorkStatusVO);
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);
		
		
		String empId = empVO.getEmpId();
		// 프로젝트 리스트 출력
		List<ProjectVO> proCardList = projectService.selectProCardList(empId);
		for (ProjectVO project : proCardList) {
			
			if (project.getParticipantEmpNames() != null) {
				String[] name = project.getParticipantEmpNames().split(", ");
				project.setParticipantEmpNamesList(Arrays.asList(name));
			}
			if (project.getParticipantImgFileUrls() != null) {
				String[] imgFileUrl = project.getParticipantImgFileUrls().split(", ");
				project.setParticipantImgFileUrlsList(Arrays.asList(imgFileUrl));
			}
		}
		model.addAttribute("proCardList", proCardList);
		
		/**
		 * 전자결재
		 */
		// 전자결재 긴급 문서 리스트 출력
		List<EmpElaprVO> emrgList = myElaprService.selectEmrgHomeList(empId);
		model.addAttribute("emrgList", emrgList);
		
		// 전자결재 전체 문서 리스트 출력
		List<EmpElaprVO> allList = myElaprService.selectAllHomeList(empId);
		model.addAttribute("allList", allList);
		
		// 전자결재 참조 문서 리스트 출력
		List<EmpElaprVO> rerncList = myElaprService.selectRerncHomeList(empId);
		model.addAttribute("rerncList", rerncList);
		
		// 전자결재 열람 문서 리스트 출력
		List<EmpElaprVO> prslList = myElaprService.selectPrslHomeList(empId);
		model.addAttribute("prslList", prslList);
		
		
		return "employee/mainPage/home";
	}
	
}
