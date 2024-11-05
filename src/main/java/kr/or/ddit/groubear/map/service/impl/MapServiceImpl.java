package kr.or.ddit.groubear.map.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.comm.security.vo.CompanyVO;
import kr.or.ddit.groubear.map.mapper.IMapMapper;
import kr.or.ddit.groubear.map.service.IMapService;

@Service
public class MapServiceImpl implements IMapService {
	
	@Inject
	private IMapMapper mapMapper;

	@Override
	public List<CompanyVO> mapList(CompanyVO companyVO) {
		return mapMapper.mapList(companyVO);
	}

}
