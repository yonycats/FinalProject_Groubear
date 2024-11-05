package kr.or.ddit.employee.cmnty.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
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

import kr.or.ddit.comm.cmnty.service.ICmntyService;
import kr.or.ddit.comm.cmnty.vo.CmntyVO;
import kr.or.ddit.comm.commcode.service.ICommCodeService;
import kr.or.ddit.comm.commcode.vo.CommCodeVO;
import kr.or.ddit.comm.empallinfo.service.IEmpAllInfoService;
import kr.or.ddit.comm.empallinfo.vo.EmployeeAllVO;
import kr.or.ddit.comm.file.vo.AtchFileDetailVO;
import kr.or.ddit.comm.paging.vo.PaginationInfoVO;
import kr.or.ddit.comm.security.vo.CompanyVO;
import kr.or.ddit.comm.security.vo.CustomUser;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.comm.serviceresult.ServiceResult;
import kr.or.ddit.comm.tiles.service.ITIlesService;
import kr.or.ddit.groubear.cmnty.service.IGroCmntyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@PreAuthorize("hasAnyRole('ROLE_EMPLOYEE')")
@RequestMapping("/employee")
public class EmpCmntyController {
	
	@Inject
	private ICmntyService cmntyService;
	
	@Inject
	private IEmpAllInfoService empAllInfoService;
	
	@Inject
	private ITIlesService tilesService;
	
	@Inject
	private ICommCodeService commCodeService;
	
	@Inject
	private IGroCmntyService groCmntyService;
	
	@GetMapping("/cmntyNoticeList.do")
	public String cmntyNoticeList (
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(required = false, defaultValue = "title") String searchType,
			@RequestParam(required = false) String searchWord, Model model,
			HttpServletRequest request) {
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		CompanyVO companyVO = tilesService.getCompany(empVO);
		
		model.addAttribute("employeeVO",empVO);
		model.addAttribute("companyVO",companyVO);
		
		// 리스트 페이징 처리하기
		PaginationInfoVO<CmntyVO> pagingVO = new PaginationInfoVO<CmntyVO>(10,5);
		pagingVO.setCoCd(empVO.getCoCd());
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			pagingVO.setSearchType(searchType);
			model.addAttribute("searchWord", searchWord);
			model.addAttribute("searchType", searchType);
		}
		
		// startRow, endRow, startpage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage); 
		
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = cmntyService.noticeSelectListCount(pagingVO);
		
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord); 
		
		// 총 게시글 수 및 총 페이지수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<CmntyVO> noticeList = cmntyService.noticeSelectList(pagingVO);
		pagingVO.setDataList(noticeList);
		
		HttpSession session = request.getSession();
		model.addAttribute("message", session.getAttribute("message"));
		session.removeAttribute("message");
		
		model.addAttribute("pagingVO", pagingVO);
		
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n totalRecord : " + totalRecord);
		
		return "employee/cmnty/cmntyNoticeList";
	}
	
	@GetMapping("/cmntyNoticeDetail.do")
	public String cmntyNoticeDetail (@RequestParam("cmntyNo") int cmntyNo, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			CompanyVO companyVO = tilesService.getCompany(empVO);
			EmployeeAllVO employeeAllVO = empAllInfoService.selectEmpImpl(empVO);

			model.addAttribute("employeeVO", empVO);
			model.addAttribute("companyVO", companyVO);
			model.addAttribute("employeeAllVO", employeeAllVO);
		
			CmntyVO cmntyVO = cmntyService.noticeSelectOne(cmntyNo);
			model.addAttribute("cmntyVO", cmntyVO);
			
			goPage = "employee/cmnty/cmntyNoticeDetail";
					
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		
		return goPage;
	}

	/**
	 * 단일 파일 다운로드 받기
	 * @param atchFileDetailVO
	 * @return
	 */
	@ResponseBody
	@GetMapping("/cmntyDownOne.do")
	public void cmntyDownOne(@RequestParam("atchFileDetailCd") String atchFileDetailCd,
							HttpServletRequest request, HttpServletResponse response) {
		// 파일 정보 불러오기
		AtchFileDetailVO atchFileDetailVO = cmntyService.atchFileDetailOneSelect(atchFileDetailCd);
		String filePath = atchFileDetailVO.getAtchFileDetailPathNm();
		
		File saveFile = new File(filePath);
		String filename = atchFileDetailVO.getAtchFileDetailOrgnlNm();
		String filesize = String.valueOf(atchFileDetailVO.getAtchFileDetailSize());
		
		// 파일명이 한글로 되어있을 때
		// 요청 Header 정보들 중, User-Agent 영역 안에 여러 키워드 정보들을 가지고
		// 특정 키워드가 포함되어 있는지를 체크해서 파일며으이 출력 인코딩 부분을 설정합니다.
		// 사용 브라우저 또는 어떠한 현상에 따라 발생하는 알고리즘이므로, 내가 사용하는 브라우저의 버전이나 
		// 얻어온 header 정보들의 값에 따라 차이가 발생할 수 있습니다.
		String agent = request.getHeader("User-Agent");
		try {
			// (agent, "trident") 이 두가지를 포함한다면 IE, Chrome일 것임
			if (StringUtils.containsIgnoreCase(agent, "msie") || 
					StringUtils.containsIgnoreCase(agent, "trident")) {	// IE, Chrome
				filename = URLEncoder.encode(filename, "UTF-8");
			} else {	// firefox, chrome (소문자 대문자에 따라서 크롬이 다름)
				filename = new String(filename.getBytes(), "ISO-8859-1");
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		response.setHeader("content-Disposition", "attachment; filename=\"" + filename + "\"");
		response.setHeader("Content-Length", filesize);
		
		
		// 아래와 같이 사용하면 try() 내부에서 사용한 객체에 대해서 {} 안의 로직이 끝나고 나면 자동으로 () 내부의 객체가 닫힘
		// try(){} ::: try with resource
		// () 안에서 명시한 객체는 finally로 최종 열린 객체에 대한 close()를 처리하지 않아도 자동으로 close()가 이루어진다.
		// try/catch의 확장판
		try(OutputStream os = response.getOutputStream()) {
			FileUtils.copyFile(saveFile, os);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 파일 리스트 알집으로 다운로드 받기
	 * @param cmntyVO
	 * @return
	 */
	@PostMapping("/cmntyDownList.do")
	public ResponseEntity<String> cloudDownList(@RequestBody CmntyVO cmntyVO) {
		// 사용자의 기본 경로과 운영체제별로 다운로드 경로 세팅하기
	    String userHome = System.getProperty("user.home");
	    String os = System.getProperty("os.name").toLowerCase();
	    String downloadDir;

	    if (os.contains("win")) {
	        downloadDir = userHome + "\\Downloads\\"; // 윈도우
	    } else if (os.contains("mac")) {
	        downloadDir = userHome + "/Downloads/"; // 맥
	    } else if (os.contains("nix") || os.contains("nux") || os.contains("aix")) {
	        downloadDir = userHome + "/Downloads/"; // 리눅스
	    } else {
	        downloadDir = userHome + "/Downloads/"; // 기타 (예비용)
	    }
		
		// 파일을 다운받을 기본 경로
	    LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy.MM.dd HHmmss");
        String formattedDate = now.format(formatter);
        String downZipName = formattedDate + "_groubear.zip";
	    
        // 다운받을 경로 및 압축 파일의 이름 세팅하기
		String dowmloadPath = downloadDir + downZipName;
		
	    // 파일 디테일 리스트 불러오기
		List<AtchFileDetailVO> atchFileDetailList = cmntyService.atchFileDetailListSelect(cmntyVO.getAtchFileCd());
		
		try (ZipOutputStream zos = new ZipOutputStream(Files.newOutputStream(Paths.get(dowmloadPath)))) {
			for (AtchFileDetailVO fileVO : atchFileDetailList) {
				String filePath = fileVO.getAtchFileDetailPathNm();
				File fileToZip = new File(filePath);
				
				// 파일 압축 메서드
				if (fileToZip.exists()) {
					zipFile(fileToZip, zos, fileVO.getAtchFileDetailOrgnlNm());
				} else {
					log.info("파일 없음 : " + filePath);
				}
			}
		} catch (IOException e) {
            log.error("ZIP 파일 생성 중 오류 발생: " + e.getMessage(), e);
            return new ResponseEntity<String>("FAIL", HttpStatus.OK);
        }
		
		return new ResponseEntity<String>("OK", HttpStatus.OK);
	}

	/**
	 * 파일을 알집으로 압축하는 메소드
	 * @param fileToZip
	 * @param zos
	 * @param fileName
	 * @throws IOException
	 */
    private void zipFile(File fileToZip, ZipOutputStream zos, String fileName) throws IOException {
    	// try-with-resources 구문으로, 해당 구문이 끝나면 자동으로 InputStream이 종료됨
        try (InputStream fis = Files.newInputStream(fileToZip.toPath())) {
        	// ZipEntry 객체를 생성하여 ZIP 파일 내에 추가할 항목을 정의 
        	// 파일의 이름을 가져와서 ZIP 아카이브 내에서 이 이름으로 저장 
            ZipEntry zipEntry = new ZipEntry(fileName);
            // ZipOutputStream(zos)에 새로 생성한 zipEntry를 추가, ZIP 아카이브에서 다음 항목을 추가할 준비
            zos.putNextEntry(zipEntry);
            // 실제 파일 데이터를 ZIP 아카이브에 저장
            Files.copy(fileToZip.toPath(), zos);
            zos.closeEntry();
        }
    }
    
    /**
     * 파일 미리보기
     * @param cloudFileCd
     * @return
     */
	@ResponseBody
	@GetMapping("/cmnty/imgPreview.do")
	public ResponseEntity<byte[]> imgPreview(@RequestParam("atchFileDetailCd") String atchFileDetailCd) {
		
		// InputStream -> Byte단위의 자바 입력에 사용되는 최상위 클래스로서, 데이터를 입력받기 위한 입력 스트림 클래스(추상 클래스)
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		HttpHeaders headers = new HttpHeaders();
		
		// 파일 정보 가져오기
		AtchFileDetailVO atchFileDetailVO = cmntyService.atchFileDetailOneSelect(atchFileDetailCd);
		
	    try {
	        in = new FileInputStream(atchFileDetailVO.getAtchFileDetailPathNm());

	        // 파일 확장자에 따라 Content-Type 설정
	        String extension = atchFileDetailVO.getAtchFileDetailExtnNm().toLowerCase(); // 대소문자 구분 없이 비교
	        switch (extension) {
            case "png":
                headers.setContentType(MediaType.IMAGE_PNG);
                break;
            case "jpg":
            case "jpeg":
                headers.setContentType(MediaType.IMAGE_JPEG);
                break;
            case "gif":
                headers.setContentType(MediaType.IMAGE_GIF);
                break;
            default:
                headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // 기본 처리 (다운로드 하도록 처리)
                break;
        }
	        // InputStream의 내용을 byte[]로 변환하여 반환
	        entity = new ResponseEntity<>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
	    } catch (Exception e) {
	        e.printStackTrace();
	        entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
	    } finally {
	        try {
	        	in.close();
	        } catch (IOException e) {
	            e.printStackTrace();
	        }
	    }
	    return entity;
	}
	
	@GetMapping("/cmntyQstnList.do")
	public String cmntyQstnList (
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage,
			@RequestParam(name="cmntyType", required = false) String cmntyType,
			@RequestParam(name="empId", required = false) String empId,
			@RequestParam(required = false) String searchWord, Model model,
			HttpServletRequest request) {
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		CompanyVO companyVO = tilesService.getCompany(empVO);
		
		model.addAttribute("employeeVO",empVO);
		model.addAttribute("companyVO",companyVO);
		
		// 리스트 페이징 처리하기
		PaginationInfoVO<CmntyVO> pagingVO = new PaginationInfoVO<CmntyVO>(10,5);
		pagingVO.setCoCd(empVO.getCoCd());
		
		// 검색 기능 추가
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchWord", searchWord);
		}
		model.addAttribute("empId", empId);
		model.addAttribute("cmntyType", cmntyType);
		
		// startRow, endRow, startpage, endPage를 결정한다.
		pagingVO.setCurrentPage(currentPage); 
		pagingVO.setCmntyType(cmntyType); 
		pagingVO.setEmpId(empId); 
		
		// 총 게시글 수를 이용하여 총 페이지수를 결정하기 위해 총 게시글 수인 totalRecord를 얻어온다.
		int totalRecord = cmntyService.qstnSelectListCount(pagingVO);
		
		// totalPage를 결정한다.
		pagingVO.setTotalRecord(totalRecord); 
		
		// 총 게시글 수 및 총 페이지수, startRow, endRow의 값들을 이용하여 초기 1페이지에 들어있는 총 screenSize 개수만큼의 리스트 데이터를 가져온다.
		List<CmntyVO> noticeList = cmntyService.qstnSelectList(pagingVO);
		pagingVO.setDataList(noticeList);
		
		// Q&A 카테고리별 전체 게시물과 Q&A 미답변 게시물 카운트하기
		List<CmntyVO> qstnCountList = groCmntyService.qstnSttsAndListCount();
		model.addAttribute("qstnListCount", qstnCountList);
		
		HttpSession session = request.getSession();
		model.addAttribute("message", session.getAttribute("message"));
		session.removeAttribute("message");
		
		model.addAttribute("pagingVO", pagingVO);
		
		log.info(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>\n totalRecord : " + totalRecord);
		
		return "employee/cmnty/cmntyQstnList";
	}
	
	@GetMapping("/cmntyQstnDetail.do")
	public String cmntyQstnDetail (@RequestParam("cmntyNo") int cmntyNo, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			CompanyVO companyVO = tilesService.getCompany(empVO);
			EmployeeAllVO employeeAllVO = empAllInfoService.selectEmpImpl(empVO);

			model.addAttribute("employeeVO", empVO);
			model.addAttribute("companyVO", companyVO);
			model.addAttribute("employeeAllVO", employeeAllVO);
			
			CmntyVO cmntyVO = cmntyService.qstnSelectOne(cmntyNo);
			cmntyVO.setCmntyCn(cmntyVO.getCmntyCn().replace("\n","<br>"));
			
			if (cmntyVO.getCmntCn() != null && cmntyVO.getCmntCn().contains("\n")) {
				cmntyVO.setCmntCn(cmntyVO.getCmntCn().replace("\n","<br>"));
			}
			
			model.addAttribute("cmntyVO", cmntyVO);
			
			goPage = "employee/cmnty/cmntyQstnDetail";
					
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		
		return goPage;
	}
	
	@GetMapping("/cmntyQstnInsert.do")
	public String cmntyQstnInsert (Model model, RedirectAttributes ra) {
		String goPage = "";
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			CompanyVO companyVO = tilesService.getCompany(empVO);
			
			// Q&A 카테고리 종류 불러오기
			List<CommCodeVO> commCodeList = commCodeService.commCodeDetailSelectList();
			
			model.addAttribute("employeeVO", empVO);
			model.addAttribute("companyVO", companyVO);
			model.addAttribute("commCodeList", commCodeList);

			
			// 발표를 위한 데이터 세팅
			CmntyVO cmntyVO = new CmntyVO();
			cmntyVO.setComDtlCd("QSTNKND001");
			cmntyVO.setCmntyTtl("상품에 관해서 궁금한게 있어 문의드립니다.");
			cmntyVO.setCmntyCn("혹시 베이직과 프리미엄이 어떤 차이가 있는 건가요?");
			model.addAttribute("cmntyVO", cmntyVO);
			
			
			
			goPage = "employee/cmnty/cmntyQstnForm";
			
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		
		return goPage;
	}
	
	@PostMapping("/cmntyQstnInsert.do")
	public String cmntyQstnInsert (CmntyVO cmntyVO, Model model, RedirectAttributes ra) {
		String goPage = "";
		Map<String, String> error = new HashMap<String, String>();
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			cmntyVO.setQstnEmpId(empVO.getEmpId());
			cmntyVO.setCoCd(empVO.getCoCd());
			
			if (StringUtils.isBlank(cmntyVO.getComDtlCd())) {
				error.put("comDtlCd", "카테고리를 선택해주세요.");
			}
			if (StringUtils.isBlank(cmntyVO.getCmntyTtl())) {
				error.put("cmntyTtl", "제목을 입력해주세요.");
			}
			if (StringUtils.isBlank(cmntyVO.getCmntyCn())) {
				error.put("cmntyCn", "내용을 입력해주세요.");
			}
			
			// 필수입력  빈칸이 있다면
			if (error.size() > 0) {
				model.addAttribute("error", error);
				model.addAttribute("cmntyVO", cmntyVO);
				goPage = "employee/cmnty/cmntyQstnForm";
				
			} else {	// 필수 입력 빈칸이 없다면
				// 비밀글을 체크하지 않았다면 N로 기본 세팅하기
				if(cmntyVO.getCmntyPrvtPstYn() == null || cmntyVO.getCmntyPrvtPstYn() == "") {
					cmntyVO.setCmntyPrvtPstYn("N");
				}
				
				// Q&A 등록하기
				ServiceResult result = cmntyService.cmntyQstnInsert(cmntyVO);
				if (result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "문의가 등록되었습니다.");
					goPage = "redirect:/employee/cmntyQstnDetail.do?cmntyNo=" + cmntyVO.getCmntyNo();
				} else {
					model.addAttribute("message", "서버에 오류가 발생했습니다.");
					model.addAttribute("cmntyVO", cmntyVO);
					goPage = "employee/cmnty/cmntyQstnForm";
				}
			}
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		return goPage;
	}
	
	@GetMapping("/cmntyQstnModify.do")
	public String cmntyQstnModify (@RequestParam("cmntyNo") int cmntyNo, Model model, RedirectAttributes ra) {
		String goPage = "";
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			CompanyVO companyVO = tilesService.getCompany(empVO);
			
			CmntyVO cmntyVO = cmntyService.qstnSelectOne(cmntyNo);

			// Q&A 카테고리 종류 불러오기
			List<CommCodeVO> commCodeList = commCodeService.commCodeDetailSelectList();
			model.addAttribute("commCodeList", commCodeList);
			
			model.addAttribute("employeeVO", empVO);
			model.addAttribute("companyVO", companyVO);
			model.addAttribute("cmntyVO", cmntyVO);
			model.addAttribute("status", "u");
			
			goPage = "employee/cmnty/cmntyQstnForm";
			
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		
		return goPage;
	}

	@PostMapping("/cmntyQstnModify.do")
	public String cmntyQstnModify (CmntyVO cmntyVO, Model model, RedirectAttributes ra) {
		String goPage = "";
		Map<String, String> error = new HashMap<String, String>();
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			cmntyVO.setQstnEmpId(empVO.getEmpId());
			cmntyVO.setCoCd(empVO.getCoCd());
			
			if (StringUtils.isBlank(cmntyVO.getComDtlCd())) {
				error.put("comDtlCd", "카테고리를 선택해주세요.");
			}
			if (StringUtils.isBlank(cmntyVO.getCmntyTtl())) {
				error.put("cmntyTtl", "제목을 입력해주세요.");
			}
			if (StringUtils.isBlank(cmntyVO.getCmntyCn())) {
				error.put("cmntyCn", "내용을 입력해주세요.");
			}
			
			// 필수입력  빈칸이 있다면
			if (error.size() > 0) {
				model.addAttribute("error", error);
				model.addAttribute("cmntyVO", cmntyVO);
				goPage = "employee/cmnty/cmntyQstnForm";
				
			} else {	// 필수 입력 빈칸이 없다면
				// 비밀글을 체크하지 않았다면 N로 기본 세팅하기
				if(cmntyVO.getCmntyPrvtPstYn() == null || cmntyVO.getCmntyPrvtPstYn() == "") {
					cmntyVO.setCmntyPrvtPstYn("N");
				}
				
				// Q&A 등록하기
				ServiceResult result = cmntyService.cmntyQstnModify(cmntyVO);
				if (result.equals(ServiceResult.OK)) {
					ra.addFlashAttribute("message", "수정이 완료되었습니다.");
					goPage = "redirect:/employee/cmntyQstnDetail.do?cmntyNo=" + cmntyVO.getCmntyNo();
				} else {
					model.addAttribute("message", "서버에 오류가 발생했습니다.");
					model.addAttribute("cmntyVO", cmntyVO);
					model.addAttribute("status", "u");
					goPage = "employee/cmnty/cmntyQstnForm";
				}
			}
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		return goPage;
	}
	
	@PostMapping("/cmntyQstnDelete.do")
	public String cmntyQstnDelete (CmntyVO cmntyVO, Model model, RedirectAttributes ra, HttpServletRequest request) {
		String goPage = "";
		
		// 회원정보 가져오기
		CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		EmployeeVO empVO = user.getMember();
		
		// 로그인인 된 상태일 때만 진입가능
		if (empVO != null) {
			cmntyVO.setQstnEmpId(empVO.getEmpId());
			cmntyVO.setCoCd(empVO.getCoCd());
			
			// Q&A 삭제하기
			ServiceResult result = cmntyService.cmntyQstnDelete(cmntyVO.getCmntyNo());
			if (result.equals(ServiceResult.OK)) {
				HttpSession session = request.getSession();
				session.setAttribute("message", "게시물이 삭제되었습니다.");
				goPage = "redirect:/employee/cmntyQstnList.do";
			} else {
				model.addAttribute("message", "서버에 오류가 발생했습니다.");
				goPage = "employee/cmnty/cmntyQstnDetail.do?cmntyNo=" + cmntyVO.getCmntyNo();
			}
		} else {
			ra.addFlashAttribute("message", "로그인 후 사용 가능합니다.");
			goPage = "redirect:/login.do";
		}
		return goPage;
	}

}
