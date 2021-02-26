package com.xiao.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiao.mapper.SnackinfoMapper;
import com.xiao.mapper.UserinfoMapper;
import com.xiao.model.Snackinfo;
import com.xiao.model.Userinfo;
import com.xiao.model.domain.DoSnack;
import com.xiao.service.shopService;
import com.xiao.utils.DateUtil;
import com.xiao.utils.PageHelp;
import com.xiao.utils.TypeUtil;


@Service
public class shopServiceImpl implements shopService{

	@Autowired
    private	SnackinfoMapper snackinfoDao;

	@Autowired
	private UserinfoMapper userinfoDao;

	//查询热销商品
	@Override
	public List<Snackinfo> getHotSnack() {
		Map<String,String> map=new HashMap<String,String>();
		 Calendar cal = Calendar.getInstance();
		 Date firstDayOfMonth = DateUtil.getFirstDayOfMonth(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH));
		 Date lastDayOfMonth = DateUtil.getLastDayOfMonth(cal.get(Calendar.YEAR),cal.get(Calendar.MONTH));
		 map.put("dateone", DateUtil.getDateString(firstDayOfMonth));
		 map.put("datetwo", DateUtil.getDateString(lastDayOfMonth));
		 List<Snackinfo> hotList = snackinfoDao.selectHot(map);
		 return hotList;
	}

	//查询最新商品
	@Override
	public List<Snackinfo> getNewSnack() {
		List<Snackinfo> newlist = snackinfoDao.selectNew();
		return newlist;
	}

	@Override
	public Userinfo userLogin(Userinfo userinfo) {
			return userinfoDao.selectUserLogin(userinfo);
	}

	@Override
	public Snackinfo selectById(Snackinfo snackinfo) {
		return snackinfoDao.selectByPrimaryKey(snackinfo.getsId());
	}

	@Override
	public PageHelp<DoSnack> selectOrderSnack(Map<Object,Object> map) {
		PageHelp<DoSnack> pageUtil=new PageHelp<DoSnack>();
		List<DoSnack> selectOrderSnack = snackinfoDao.selectOrderSnack(map);
		pageUtil.setList(selectOrderSnack);
		pageUtil.setRecord(selectOrderSnack.size());
		return pageUtil;
	}

	@Override
	public List<Snackinfo> selectPuffing(int type,String snackName) {
		Map<String,String> map=new HashMap<String,String>();
		Map<Integer, String> allType = TypeUtil.getAllType();
		String typeString = allType.get(type);
		if(typeString == null || "".equals(typeString)){
			typeString = null;
		}
		map.put("typeName", typeString);
		if(type==666){
			map.put("sImported", "1");
		}
		map.put("snackName",snackName);
		return snackinfoDao.selectPuffing(map);
	}

}
