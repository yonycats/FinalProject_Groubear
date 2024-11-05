package kr.or.ddit.employee.menuRcmdtn.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.employee.provedoc.controller.EmpProvedocController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasAnyRole('ROLE_EMPLOYEE')")
@RequestMapping("/employee")
public class EmpMenuRcmdtnController {
	
	@GetMapping("/menuRecommend.do")
	public String menuRecommend (Model model, HttpServletRequest request) {
		
		return "employee/menuRcmdtn/menuRcmdtn";
	}
	
}
