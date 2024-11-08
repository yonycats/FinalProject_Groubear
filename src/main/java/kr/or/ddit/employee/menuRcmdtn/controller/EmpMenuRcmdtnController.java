package kr.or.ddit.employee.menuRcmdtn.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.comm.menuRcmdtn.service.IMenuRcmdtnService;
import kr.or.ddit.comm.menuRcmdtn.vo.FoodVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasAnyRole('ROLE_EMPLOYEE')")
@RequestMapping("/employee")
public class EmpMenuRcmdtnController {
	
	@Inject
	private IMenuRcmdtnService menuRcmdtnService;
	
	@GetMapping("/menuRecommend.do")
	public String menuRecommend (Model model, HttpServletRequest request) {
		return "employee/menuRcmdtn/menuRcmdtn";
	}
	
	@GetMapping("/foodSelectList.do")
	public ResponseEntity<List<FoodVO>> foodSelectList () {
		
		// 음식 전체 리스트 가져오기
		List<FoodVO> foodList = menuRcmdtnService.foodSelectList();
		
		return new ResponseEntity<List<FoodVO>>(foodList, HttpStatus.OK);
	}
	
}
