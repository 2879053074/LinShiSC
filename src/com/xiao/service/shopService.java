package com.xiao.service;

import java.util.List;
import java.util.Map;

import com.xiao.model.Snackinfo;
import com.xiao.model.Userinfo;
import com.xiao.model.domain.DoSnack;
import com.xiao.utils.PageHelp;

public interface shopService {
	public List<Snackinfo> getHotSnack();
    public List<Snackinfo> getNewSnack();
    public Userinfo userLogin(Userinfo userinfo);
    public Snackinfo selectById(Snackinfo snackinfo);
    PageHelp<DoSnack> selectOrderSnack(Map<Object,Object> map);
    List<Snackinfo> selectPuffing(int type,String snackName);
}
