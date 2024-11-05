package kr.or.ddit.company.elapr.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ComElaprVO {
	private int elaprNo;
	private int docFormNo;
	private String empId;
	private String coCd;
	private String atchFileCode;
	private String elaprNm;
	private String elaprCn;
	private String elaprBgngDt;
	private String elaprMdfcnDt;
	private String elaprEndDt;
	private String elaprSttsCd;
	private String elaprDelYn;
	private String elaprEmrgYn;
	private String elaprOpnnCn;
	

	private String deptCd;
	private String jbgdCd;
	private String empPw;
	private String empEmlAddr;
	private String empNm;
	private int empNo;
	private int empZip;
	private String empAddr;
	private String empDaddr;
	private String empTelno;
	private String empBrdt;
	private String empGndr;
	private String empNtn;
	private String empJncmpYmd;
	private String empRsgntnYmd;
	private String empCrtYmd;
	private String empMdfcnYmd;
	private String empDelYn;
	private String empAprvYn;
	private int enabled;
	private String empDlnYn;
	private String imgFileUrl;
	private String teamCd;
	

	private String teamNm;
	private LocalDate teamCrtDt;
	private String teamActvtnYn;
	
	private String coNm;
	private LocalDate coRegDt;
	private int coCnt;
	private String coBrno;
	private String ceoNm;
	private int coZip;
	private String coAddr;
	private String coDaddr;
	private String coTel; 
	
	private String currentDt; 
	
}
