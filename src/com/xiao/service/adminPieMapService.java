package com.xiao.service;

import java.util.List;

import com.xiao.model.domain.DoRecord;

public interface adminPieMapService {
	List<DoRecord> selectGroupBytype(String startDate,String endDate);
}
