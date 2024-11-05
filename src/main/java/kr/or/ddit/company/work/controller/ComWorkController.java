package kr.or.ddit.company.work.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.comm.form.vo.FormVO;
import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.comm.security.vo.CompanyVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.company.personnelInformation.service.IInformationService;
import kr.or.ddit.company.personnelInformation.vo.DepartmentVO;
import kr.or.ddit.company.personnelInformation.vo.JobGradeVO;
import kr.or.ddit.company.personnelInformation.vo.TeamVO;
import kr.or.ddit.company.work.service.IComWorkService;
import kr.or.ddit.company.work.vo.weekWorkStatusVO;
import kr.or.ddit.company.workform.vo.WorkFormVO;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;
import kr.or.ddit.company.work.vo.searchWeekWorkStatusVO;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/company")
@PreAuthorize("hasRole('ROLE_COMPANY')")
public class ComWorkController {

	@Inject
	private ITIlesService tilesService;
	
	@Inject
	private IComWorkService workSerivce;
	
	@Inject
	private IInformationService infoService;
	
	@GetMapping("/workstatus.do")
	public String departmentWork(Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		DepartmentVO epmtVO = tilesService.getEpmt(employeeVO);
		TeamVO teamVO = tilesService.getTeam(employeeVO);
		
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);

		CompanyVO companyVO = tilesService.getCompany(employeeVO);
		model.addAttribute("companyVO", companyVO);
		List<EmployeeVO> empAllList = infoService.comAllEmpList(employeeVO);
		List<DepartmentVO> deptList = infoService.selectDeptList(employeeVO);
		List<JobGradeVO> jbgdList = infoService.selectJBGDList(employeeVO);
		List<TeamVO> teamList = infoService.selectTeamList(employeeVO);
		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("empAllList", empAllList);
		model.addAttribute("deptList", deptList);
		model.addAttribute("jbgdList", jbgdList);
		model.addAttribute("teamList", teamList); 
		
		return "company/departmentWork/departmentWork";
	}
	
}
