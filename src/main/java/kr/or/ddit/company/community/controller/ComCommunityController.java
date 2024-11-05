package kr.or.ddit.company.community.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.comm.file.vo.AtchFileDetailVO;
import kr.or.ddit.comm.file.vo.AtchFileVO;
import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.company.community.service.IComCommunityService;
import kr.or.ddit.company.community.vo.ComCommunityVO;
import kr.or.ddit.company.personnelInformation.vo.DepartmentVO;
import kr.or.ddit.company.personnelInformation.vo.TeamVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/company")
@PreAuthorize("hasRole('ROLE_COMPANY')")
public class ComCommunityController {

	@Resource(name = "localPath")
	private String localPath;

	@Inject
	private ITIlesService tilesService;

	@Inject
	private IComCommunityService service;

	// 회사 공지
	@GetMapping("/communitySystem.do")
	public String communitySystem(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model, HttpServletRequest request) {

		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		List<ComCommunityVO> freeList = service.communitySystem(employeeVO);
		model.addAttribute("freeList", freeList);
		return "employee/community/list";
	}

	// 회사 공지
	@GetMapping("/communityCompany.do")
	public String communityCompany(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model, HttpServletRequest request) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		List<ComCommunityVO> freeList = service.communityCompany(employeeVO);
		model.addAttribute("freeList", freeList);
		return "employee/community/list";
	}

	// 정보공유
	@GetMapping("/communityInfo.do")
	public String communityInfo(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model, HttpServletRequest request) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		List<ComCommunityVO> freeList = service.communityInfo(employeeVO);
		model.addAttribute("freeList", freeList);
		return "employee/community/list";
	}

	// 자유
	@GetMapping("/communityFree.do")
	public String communityFree(@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model, HttpServletRequest request) {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		List<ComCommunityVO> freeList = service.communityFree(employeeVO);
		model.addAttribute("freeList", freeList);
		return "employee/community/list";
	}

	@PostMapping("/insert/{type}")
	@ResponseBody
	public ResponseEntity<String> communityInsert(@ModelAttribute ComCommunityVO communityVO, Model model)
			throws Exception {
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();

		String userId = employeeVO.getEmpId();
		communityVO.setEmpId(userId);
		communityVO.setCoCd(employeeVO.getCoCd());

		// 첨부파일
		AtchFileVO afVO = new AtchFileVO();
		afVO.setEmpId(userId);

		// 첨부파일 디테일
		List<MultipartFile> pictures = communityVO.getAtchFiles();

		List<AtchFileDetailVO> savedAtchFileDetail = new ArrayList<AtchFileDetailVO>();

		for (MultipartFile file : pictures) {
			log.info("# fileName : " + file.getOriginalFilename());

			// UUID_원본파일명
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes()); // 파일 업로드

			long bytes = file.getSize();
			String fancysize; // fancysize를 String 타입으로 선언합니다.

			if (bytes > 1024 * 1024) { // 1MB 이상
				fancysize = (bytes / (1024 * 1024)) + " MB"; // MB 단위
				log.info(bytes + "MB");
			} else if (bytes > 1024) { // 1KB 이상 1MB 미만
				fancysize = (bytes / 1024) + " KB"; // KB 단위
				log.info(bytes + "KB");
			} else { // 1KB 미만
				fancysize = bytes + " Byte"; // Byte 단위
				log.info(bytes + "Byte");
			}

			AtchFileDetailVO afdVO = new AtchFileDetailVO();
			afdVO.setAtchFileCd(savedName);
			afdVO.setAtchFileDetailPathNm(localPath + savedName);
			afdVO.setAtchFileDetailExtnNm(savedName.substring(savedName.lastIndexOf(".") + 1));
			afdVO.setAtchFileDetailSize((int) bytes);
			afdVO.setAtchFileDetailFancysize(fancysize); // fancysize 설정
			afdVO.setAtchFileDetailOrgnlNm(file.getOriginalFilename());
			afdVO.setAtchFileDetailStrgNm(savedName);
			afdVO.setEmpId(userId);

			log.info("fileInfo ::: " + file);
			log.info("afdVO ::: " + afdVO);
			savedAtchFileDetail.add(afdVO);
		}
		afVO.setAtchFileDetailList(savedAtchFileDetail);
		log.info("list:::" + afVO);

		String atchFileCd = service.atchFileInsert(afVO);
		communityVO.setAtchFileCd(atchFileCd);

		log.info("aaaa");

		service.insertCommunity(communityVO);
		return new ResponseEntity<String>("SUCCESS :: ", HttpStatus.OK);
	}

	private String uploadFile(String originalFilename, byte[] bytes) throws Exception {
		log.info("uploadFile in..!");
		UUID uuid = UUID.randomUUID(); // UUID로 파일명 생성
		// UUID 원본 파일명
		String createdFileName = uuid.toString() + "_" + originalFilename;

		// localPath 활용
		File file = new File(localPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		File target = new File(localPath, createdFileName); // 파일 업로드 준비
		FileCopyUtils.copy(bytes, target); // 파일 복사

		return createdFileName;
	}

	@GetMapping("/communityDetail.do")
	public String communityDetail(int cmntyNo, Model model) throws Exception {
		log.info("read 실행");
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		AtchFileVO atchFileVO = new AtchFileVO();
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		ComCommunityVO communityVO = service.communityDetail(cmntyNo);

		DepartmentVO epmtVO = tilesService.getEpmt(employeeVO);

		TeamVO teamVO = tilesService.getTeam(employeeVO);

		model.addAttribute("employeeVO", employeeVO);
		model.addAttribute("departmentVO", epmtVO);
		model.addAttribute("teamVO", teamVO);

		model.addAttribute("atchFileVO", atchFileVO);
		model.addAttribute("atchFileDetailVO", atchFileDetailVO);
		model.addAttribute("communityVO", communityVO);
		model.addAttribute("employeeVO", employeeVO);
		return "company/community/detail";
	}

	@PostMapping("/communityModify/{type}")
	@ResponseBody
	public ResponseEntity<String> communityModify(@ModelAttribute ComCommunityVO communityVO, String arr, Model model)
			throws IOException, Exception {
		log.info("ModiFy 실행 !~!");
		log.info("communityVO ::: " + communityVO);

		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO employeeVO = user.getMember();
		String userId = employeeVO.getEmpId();
		communityVO.setEmpId(userId);
		communityVO.setCoCd(employeeVO.getCoCd());

		// 일단 있던 첨부파일 수정
		int delYResult = service.deleteYAtchFile(communityVO.getAtchFileCd());

		arr = arr.substring(0, arr.length() - 1);
		String[] cdArr = arr.split(",");

		for (int i = 0; i < cdArr.length; i++) {
			int delNResult = service.deleteNAtchFile(cdArr[i]);

		}

		// 첨부파일 추가 시작
		AtchFileVO afVO = new AtchFileVO();
		afVO.setEmpId(userId);
		afVO.setAtchFileCd(communityVO.getAtchFileCd());
		List<MultipartFile> pictures = communityVO.getAtchFiles();

		List<AtchFileDetailVO> savedAtchFileDetail = new ArrayList<AtchFileDetailVO>();
		for (MultipartFile file : pictures) {
			log.info("# fileName : " + file.getOriginalFilename());

			// UUID_원본파일명
			String savedName = uploadFile(file.getOriginalFilename(), file.getBytes()); // 파일 업로드

			long bytes = file.getSize();
			String fancysize; // fancysize를 String 타입으로 선언합니다.

			if (bytes > 1024 * 1024) { // 1MB 이상
				fancysize = (bytes / (1024 * 1024)) + " MB"; // MB 단위
				log.info(bytes + "MB");
			} else if (bytes > 1024) { // 1KB 이상 1MB 미만
				fancysize = (bytes / 1024) + " KB"; // KB 단위
				log.info(bytes + "KB");
			} else { // 1KB 미만
				fancysize = bytes + " Byte"; // Byte 단위
				log.info(bytes + "Byte");
			}

			AtchFileDetailVO afdVO = new AtchFileDetailVO();
			afdVO.setAtchFileCd(communityVO.getAtchFileCd());

			afdVO.setAtchFileDetailPathNm(localPath + savedName);
			afdVO.setAtchFileDetailExtnNm(savedName.substring(savedName.lastIndexOf(".") + 1));
			afdVO.setAtchFileDetailSize((int) bytes);
			afdVO.setAtchFileDetailFancysize(fancysize); // fancysize 설정
			afdVO.setAtchFileDetailOrgnlNm(file.getOriginalFilename());
			afdVO.setAtchFileDetailStrgNm(savedName);
			afdVO.setEmpId(userId);

			log.info("fileInfo ::: " + file);
			log.info("afdVO ::: " + afdVO);
			savedAtchFileDetail.add(afdVO);
		}
		afVO.setAtchFileDetailList(savedAtchFileDetail);
		log.info("list:::" + afVO);
		// 파일 추가 끝

		for (AtchFileDetailVO i : savedAtchFileDetail) {
			service.addAtchFile(i);
		}

		// 제목 내용 수정
		service.communityModify(communityVO);
		model.addAttribute("communityVO", communityVO);

		return new ResponseEntity<String>("SUCCESS ::: ", HttpStatus.OK);
	}

	@GetMapping("/communityRemove.do")
	public ResponseEntity<Void> removeCommunity(@RequestParam int cmntyNo) {
		int result = service.removeCommunity(cmntyNo);
		if (result > 0) {
			return ResponseEntity.ok().build(); // 삭제 성공
		} else {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build(); // 삭제 실패
		}
	}

	@PostMapping("/downloadAtchFile")
	public String downloadAtchFile(AtchFileVO atchFileVO, Model model) {
		AtchFileDetailVO atchFileDetailVO = new AtchFileDetailVO();
		atchFileDetailVO.setAtchFileCd(atchFileVO.getAtchFileCd());
		List<AtchFileDetailVO> atchFileDetailList = atchFileVO.getAtchFileDetailList();
		
		service.downloadFile(atchFileVO);
		model.addAttribute("atchFileDetailList", atchFileDetailList);
		return "company/community/detail";
	}

}
