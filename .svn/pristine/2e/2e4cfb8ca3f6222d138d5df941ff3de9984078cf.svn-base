package kr.or.ddit.comm.alarm.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.comm.alarm.service.IAlarmService;
import kr.or.ddit.comm.alarm.vo.AlarmVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AlarmController {

	@Inject
	private IAlarmService alarmService;
	
	@ResponseBody
	@GetMapping("/alarmList")
	public List<AlarmVO> alarmList() {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		log.debug("다빈 체킁 {}",user);
		
		EmployeeVO employeeVO = user.getMember();
		String empId = employeeVO.getEmpId();

		AlarmVO alarmVO = new AlarmVO();  // 아무것도 없는 빈 걸 만들음!
		alarmVO.setAlarmTarget(user.getUsername());
		
		List<AlarmVO> alarmList = alarmService.selectList(alarmVO);
		
		log.info("alarmList ::: " + alarmList);
		return alarmList;
	}
	
	@PostMapping("/insertAlarm")
	@ResponseBody
	public ResponseEntity<String> insertAlarm(@RequestBody AlarmVO alarmVO) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		String empId = employeeVO.getEmpId();
		
		String type = alarmVO.getAlarmCategory();
		
		if(type.equals("community")) {
			alarmVO.setAlarmCn( empId + "님이 회원님의 게시물에 "+ alarmVO.getAlarmCn() + " 댓글을 작성하였습니다.");
		}
			alarmService.insertAlarm(alarmVO);
			log.info("alarmVO :::" + alarmVO);
			
		
//		int count = alarmVO.getAlarmCnt();
//		alarmService.countList(count);
//		= alarmService.countList(alarmVO);
		
		return new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
	}

}
