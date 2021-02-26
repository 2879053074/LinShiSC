package com.xiao.service;

import java.util.Map;

import com.xiao.model.Snackinfo;
import com.xiao.utils.PageHelp;

public interface adminSnackInfoService {
	PageHelp<Snackinfo> selectAdminSnackinfoLimit(Map<Object,Object> map);
	int addAdminSnackinfo(Snackinfo snackinfo);
	int delAdminSnackinfo(int sId);
	Snackinfo selectAdminUserinfoBysId(int sId);
	int updateAdminSnackinfo(Snackinfo snackinfo);
}
