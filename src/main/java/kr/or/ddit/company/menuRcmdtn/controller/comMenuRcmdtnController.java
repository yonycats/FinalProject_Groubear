package kr.or.ddit.company.menuRcmdtn.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.company.form.controller.ComFormController;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasAnyRole('ROLE_COMPANY')")
@RequestMapping("/company")
public class comMenuRcmdtnController {
	
	@GetMapping("/menuRecommend.do")
	public String menuRecommend (Model model, HttpServletRequest request) {
		
		return "company/menuRcmdtn/menuRcmdtn";
	}
	
}
