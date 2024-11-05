package kr.or.ddit.company.facilities.mapper;

import java.util.List;

import kr.or.ddit.comm.file.vo.AtchFileDetailVO;
import kr.or.ddit.comm.security.vo.EmployeeVO;
import kr.or.ddit.company.facilities.vo.EquipmentVO;
import kr.or.ddit.company.facilities.vo.FacilityCategoryVO;
import kr.or.ddit.company.facilities.vo.FacilityVO;
import kr.or.ddit.company.facilities.vo.FaciltyEquipmentVO;

public interface IFacilititesMapper {

	public int insertFclt(FacilityVO fcltVO);

	public String setfcltCd();

	public void setequipment(FaciltyEquipmentVO fcltEmVO);

	public List<FacilityVO> getFcltList(FacilityCategoryVO fcltCtgrVO);

	public FacilityVO getFcltInfo(FacilityVO fcltVO);

	public List<FaciltyEquipmentVO> getFcltEq(FacilityVO fcltVO);

	public int deleteFclt(FacilityVO fcltVO);

	public List<FacilityCategoryVO> getfcltCtgrList(EmployeeVO empVO);

	public FacilityCategoryVO getfcltCtgrInfo(FacilityCategoryVO fcltctgrVO);

	public List<EquipmentVO> getEqList(FacilityVO fcltVO);

	public List<AtchFileDetailVO> getFcltImg(FacilityVO fcltVO);

}
