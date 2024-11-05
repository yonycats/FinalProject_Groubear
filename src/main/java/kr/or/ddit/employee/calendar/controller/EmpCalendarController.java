package kr.or.ddit.employee.calendar.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.comm.calendar.service.ICalendarService;
import kr.or.ddit.comm.calendar.vo.CalendarVO;
import kr.or.ddit.comm.project.service.IProjectService;
import kr.or.ddit.comm.project.vo.ProjectVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.serviceresult.ServiceResult;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.company.personnelInformation.vo.DepartmentVO;
import kr.or.ddit.company.personnelInformation.vo.TeamVO;
import kr.or.ddit.employee.elapr.service.IEmpMyElaprService;
import kr.or.ddit.employee.elapr.vo.EmpElaprVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasAnyRole('ROLE_EMPLOYEE')")
@RequestMapping("/employee")
public class EmpCalendarController {
	
	@Inject
	private ICalendarService calendarService;

	@Inject
	private ITIlesService tilesService;

	@Inject
	private IProjectService projectService;
	
	@Inject
	private IEmpMyElaprService myElaprService;
	
	SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
	
	/**
	 * 캘린더 메인 홈 
	 * @param model
	 * @return
	 */
	@GetMapping("/calendar.do")
	public String empCalendarHome(Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		
		TeamVO teamVO = tilesService.getTeam(empVO);
				
		
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);
		
		return "employee/calendar/calendarHome";
	}
	

	/**
	 * 캘린더 일정 리스트
	 * @return
	 */
	@GetMapping("/calendarList.do")
	@ResponseBody
	public List<Map<String, Object>> calendarList(Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		TeamVO teamVO = tilesService.getTeam(empVO);
		
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);

		List<Map<String, Object>> events = new ArrayList<Map<String,Object>>();
		
		// 캘린더 일정 출력
	    List<CalendarVO> calendarList = calendarService.calendarList(empVO.getEmpId());
	    
	    for (CalendarVO calendar : calendarList) {
	    	Map<String, Object> event = new HashMap<String, Object>();
	    	event.put("id", calendar.getCalendarNo());
	    	event.put("title", calendar.getCalendarNm());
	    	event.put("description", calendar.getCalendarCn());
	    	event.put("location", calendar.getCalendarDaddr());
	    	event.put("start", calendar.getCalendarDt());
	    	event.put("end", calendar.getCalendarEndDt());
	    	event.put("allDay", "Y".equals(calendar.getCalendarAlldayYn()));
	    	event.put("classNames", Arrays.asList("calendar-event"));
	    	events.add(event);
	    }

	    // 프로젝트 일정 출력
	    List<ProjectVO> proCardList = projectService.selectProCardList(empVO.getEmpId());

	    for (ProjectVO project : proCardList) {
	        Map<String, Object> projectEvent = new HashMap<String, Object>();
	        projectEvent.put("id", project.getProNo());
	        projectEvent.put("title", project.getProNm());
	        projectEvent.put("description", project.getProCn());
	        projectEvent.put("start", project.getProStartDt());
	        projectEvent.put("end", project.getProEndDt());
	        projectEvent.put("allDay", true);
	        projectEvent.put("classNames", Arrays.asList("project-event"));
	        events.add(projectEvent);
	    } 
	    
	    // 전자결재 일정 출력
	    List<EmpElaprVO> dataList = myElaprService.selectAllCalList(empVO.getEmpId());
	    
	    for (EmpElaprVO elapr : dataList) {
	    	Map<String, Object> elaprEvent = new HashMap<String, Object>();
	    	elaprEvent.put("id", elapr.getElaprNo());
	    	elaprEvent.put("title", elapr.getElaprNm());
	    	elaprEvent.put("start", elapr.getElaprBgngDt());
	    	elaprEvent.put("end", elapr.getElaprEndDt());
	    	elaprEvent.put("allDay", true);
	    	elaprEvent.put("classNames", Arrays.asList("elapr-event"));
	    	events.add(elaprEvent);
	    }
	    return events;
	}
	
	/**
	 * 캘린더 일정 추가 폼
	 * @param model
	 * @return
	 */
	@GetMapping("/calForm.do")
	public String calForm(Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		
		TeamVO teamVO = tilesService.getTeam(empVO);
				
		
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);
		
		return "employee/calendar/calendarHome";
	}
	
	
	/**
	 * 캘린더 일정 추가
	 * @param req
	 * @param ra
	 * @param calendarVO
	 * @param model
	 * @return
	 */
	@PostMapping("/calInsert.do")
	public String calInsert(
			HttpServletRequest req, RedirectAttributes ra,
			CalendarVO calendarVO, Model model) {
		
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		TeamVO teamVO = tilesService.getTeam(empVO);
		
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);
		
		String goPage = "";
		

		Map<String, String> errors = new HashMap<String, String>();
		if (StringUtils.isBlank(calendarVO.getCalendarNm())) {
			errors.put("calendarNm", "제목을 입력해주세요");
		}
//		if (StringUtils.isBlank(calendarVO.getCalendarBtgngDt())) {
//			errors.put("calendarBtgngDt", "시작일을 입력해주세요");
//		}
//		if (StringUtils.isBlank(calendarVO.getCalendarEndDt())) {
//			errors.put("calendarEndDt", "마감일을 입력해주세요");
//		}
		
		if (errors.size() > 0) {
			model.addAttribute("errors", errors);
			model.addAttribute("calendarVO", calendarVO);
			return "employee/calendar/calendarHome";
		} else {
			
			if(empVO != null) {
				calendarVO.setEmpId(empVO.getEmpId());
				ServiceResult result = calendarService.calendarInsert(req, calendarVO);
				if (result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "일정 등록 완료!");
					goPage = "redirect:/employee/calendar.do";
				} else {
					model.addAttribute("message", "서버에러, 다시 시도해주세요!");
					goPage = "employee/calendarForm.do";
				}
			} else {
				ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
				goPage = "redirect:/login.do";
			}
		}
		return goPage;
	}
	
	/*
	 * 프젝트 일정 수정 폼
	 * @param calendarNo
	 * @param model
	 * @return
	 */
	/*
	@ResponseBody
	@GetMapping("/calendarUpdate.do")
	public String calendarUpdateForm(@RequestParam int calendarNo, Model model) {
		System.out.println("calendarNo : "+ calendarNo);
		
		CalendarVO calendarVO = calendarService.selectCalendar(calendarNo);
		model.addAttribute("calendarVO", calendarVO);
		model.addAttribute("status", "u");
		return "employee/calendar/calendarHome";
	}
	*/
	
	@ResponseBody
	@GetMapping("/calendarUpdate.do")
	public CalendarVO calendarUpdate(@RequestParam int calendarNo) {
		return calendarService.selectCalendar(calendarNo);
	}
	/**
	 * 프로젝트 일정 수정
	 * @param ra
	 * @param req
	 * @param calendarVO
	 * @param model
	 * @return
	 */
	@PostMapping("/calendarUpdate.do")
	public String calendarUpdate(
			RedirectAttributes ra, HttpServletRequest req, 
			CalendarVO calendarVO, Model model) {
		String goPage = "";
		ServiceResult result = calendarService.calendarUpdate(req, calendarVO);
		if(result.equals(ServiceResult.OK)) {	// 수정 성공
			ra.addFlashAttribute("message", "수정이 완료되었습니다!");
//			goPage = "redirect:/notice/detail.do?boNo="+noticeVO.getBoNo();
			goPage = "employee/calendar/calendarHome";
		}else {									// 수정 실패
			model.addAttribute("message", "수정에 실패하였습니다!");
			model.addAttribute("calendarVO", calendarVO);
			model.addAttribute("status", "u");
			goPage = "employee/calendar/calendarHome";
		}
		
		return goPage;
	}
	
	
	/**
	 * 캘린더 일정 삭제
	 * @param ra
	 * @param req
	 * @param calendarNo
	 * @param model
	 * @return
	 */
	@ResponseBody
	@PostMapping("/calendarDelete.do")
	public String projectDelete(
			RedirectAttributes ra, HttpServletRequest req,
			int calendarNo, Model model) {

		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		DepartmentVO epmtVO = tilesService.getEpmt(empVO);
		
		TeamVO teamVO = tilesService.getTeam(empVO);
				
		
		model.addAttribute("employeeVO", empVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);
		
		ServiceResult result = calendarService.calendarDelete(req, calendarNo);
		if (result.equals(ServiceResult.OK)) {
			return "OK";
		} else {
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요");
			return "FAIL";
		}
	}

	/**
	 * 일정 드래그 시 날짜 업데이트
	 * @param updateEvent
	 * @param ra
	 * @return
	 */
	@ResponseBody
	@PostMapping("/updateCalendarDate.do")
	public String updateCalendarDate(@RequestBody CalendarVO updateEvent, RedirectAttributes ra) {
		ServiceResult result = calendarService.updateCalendarDate(updateEvent);
		if (result.equals(ServiceResult.OK)) {
			return "OK";
		} else {
			ra.addFlashAttribute("message", "서버에러, 다시 시도해주세요");
			return "FAIL";
		}
	}
}
