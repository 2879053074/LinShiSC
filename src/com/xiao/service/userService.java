package com.xiao.service;

import java.util.Map;

import com.xiao.model.Account;
import com.xiao.model.Admin;
import com.xiao.model.Integral;
import com.xiao.model.Userinfo;
import com.xiao.model.domain.DoAdminInfo;
import com.xiao.model.domain.DoMyOrder;
import com.xiao.utils.PageHelp;

public interface userService {
	public Userinfo selectUserOne(Userinfo userinfo);
	public int addUserOne(Userinfo userinfo);
	public Userinfo selectUserinfoById(Userinfo userinfo);
	public int updateUserinfoById(Userinfo userinfo);
	public PageHelp<Integral> selectIntegralLimit(Map<Object,Object> map);
	public PageHelp<Account>  selectAccountLimit(Map<Object,Object> map);
	public PageHelp<DoMyOrder>  selectOrderLimit(Map<Object,Object> map);
	public PageHelp<DoMyOrder> selectMySuccessOrderLimit(Map<Object,Object> map);
	public int upDateByorderConfirm(int id,int typeNum,int eId);
	Userinfo selectUserinfoMoney(int uId);
	int updateUserinfoBypay(int uId,float uMoney);
	int updateAdminInfo(DoAdminInfo doadminInfo);
	Admin selectAdminInfo(int adId);
}
