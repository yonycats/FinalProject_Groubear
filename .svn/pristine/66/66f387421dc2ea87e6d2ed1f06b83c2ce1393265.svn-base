package kr.or.ddit.employee.facilities.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.websocket.server.PathParam;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.comm.file.vo.AtchFileDetailVO;
import kr.or.ddit.comm.security.vo.CompanyVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.company.facilities.service.IFacilititesService;
import kr.or.ddit.company.facilities.vo.EquipmentVO;
import kr.or.ddit.company.facilities.vo.FacilityCategoryVO;
import kr.or.ddit.company.facilities.vo.FacilityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/employee")
@PreAuthorize("hasRole('ROLE_EMPLOYEE')")
public class empFacilitiesStatusController {
	@Inject
	private ITIlesService tilesService;
	
	@Inject
	private IFacilititesService fcltService;
	
	@GetMapping("/facilities/status.do")
	public String facilitiesStatus( Locale locale, Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		CompanyVO companyVO = tilesService.getCompany(empVO);
		
		//시설 카테고리 가져오기
		List<FacilityCategoryVO> fcltCtgrList = fcltService.getfcltCtgrList(empVO);
		
		model.addAttribute("fcltCtgrList", fcltCtgrList);
		model.addAttribute("employeeVO",empVO);
		model.addAttribute("companyVO",companyVO);
		return "employee/facilities/empFacilitesStatus";
	}
	
	@ResponseBody
	@PostMapping("/facilties/getfcltList.do")
	public ResponseEntity<FacilityCategoryVO> getFcltList(@RequestBody FacilityCategoryVO fcltctgrVO){
		fcltctgrVO = fcltService.getfcltCtgrInfo(fcltctgrVO);
		List<FacilityVO> fcltList = fcltService.getFcltList(fcltctgrVO);
		fcltctgrVO.setFcltList(fcltList);
		 
		if(fcltctgrVO == null) {
			return new ResponseEntity<FacilityCategoryVO>(fcltctgrVO, HttpStatus.BAD_REQUEST);
		}
		return new ResponseEntity<FacilityCategoryVO>(fcltctgrVO, HttpStatus.OK);
	}
	
	@GetMapping("/facilities/detail.do")
	public String fcltDetail(@PathParam(value = "fcltCd") String fcltCd, Model model) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		CompanyVO companyVO = tilesService.getCompany(empVO);
		log.info("fcltCd" + fcltCd);
		
		//시설 정보
		FacilityVO fcltVO = new FacilityVO();
		fcltVO.setFcltCd(fcltCd);
		fcltVO = fcltService.getFcltInfo(fcltVO);
		
		//시설 이미지 정보
		List<AtchFileDetailVO> imgList = fcltService.getFcltImg(fcltVO);
		
		
		//카테고리 정보
		FacilityCategoryVO fcltCtgrVO = new FacilityCategoryVO();
		fcltCtgrVO.setFcltCtgrCd(fcltVO.getFcltCtgrCd());
		fcltCtgrVO = fcltService.getfcltCtgrInfo(fcltCtgrVO);
		
		//비품 정보
		List<EquipmentVO> eqList = fcltService.getEqList(fcltVO);
					
		//예약 정보
		
		
		log.info("fcltVO"+fcltVO);
		log.info("fcltVO"+fcltCtgrVO);
		log.info("empVO"+empVO);
		log.info("eqList"+eqList);
		log.info("imgList"+imgList);
		
		model.addAttribute("empVO",empVO);
		model.addAttribute("fcltVO",fcltVO);
		model.addAttribute("fcltCtgrVO",fcltCtgrVO);
		model.addAttribute("eqList",eqList);
		model.addAttribute("imgList",imgList);
		return "employee/facilities/empFacilitesDetail";
	}
	
}
