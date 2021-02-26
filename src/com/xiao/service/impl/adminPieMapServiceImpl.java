package com.xiao.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiao.mapper.RecordMapper;
import com.xiao.model.domain.DoRecord;
import com.xiao.service.adminPieMapService;

@Service
public class adminPieMapServiceImpl implements adminPieMapService{

	@Autowired
	private RecordMapper recordDao;

	@Override
	public List<DoRecord> selectGroupBytype(String startDate, String endDate) {
		Map<String,String> map=new HashMap<String, String>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		return recordDao.selectGroupBytype(map);
	}

}
