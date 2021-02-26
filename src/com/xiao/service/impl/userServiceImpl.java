package com.xiao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiao.mapper.AccountMapper;
import com.xiao.mapper.AdminMapper;
import com.xiao.mapper.IntegralMapper;
import com.xiao.mapper.OrderMapper;
import com.xiao.mapper.RecordMapper;
import com.xiao.mapper.SnackinfoMapper;
import com.xiao.mapper.UserinfoMapper;
import com.xiao.model.Account;
import com.xiao.model.AccountExample;
import com.xiao.model.Admin;
import com.xiao.model.Integral;
import com.xiao.model.IntegralExample;
import com.xiao.model.IntegralExample.Criteria;
import com.xiao.model.Order;
import com.xiao.model.OrderExample;
import com.xiao.model.Orderdetail;
import com.xiao.model.Record;
import com.xiao.model.Snackinfo;
import com.xiao.model.Userinfo;
import com.xiao.model.domain.DoAdminInfo;
import com.xiao.model.domain.DoMyOrder;
import com.xiao.service.userService;
import com.xiao.utils.DateUtil;
import com.xiao.utils.PageHelp;

@Service
public class userServiceImpl implements userService{
	@Autowired
	private UserinfoMapper userinfoDao;

	@Autowired
	private IntegralMapper IntegralDao;

	@Autowired
	private AccountMapper accountDao;

	@Autowired
	private OrderMapper orderDao;

	@Autowired
	private SnackinfoMapper snackinfoDao;

	@Autowired
	private RecordMapper recordDao;

	@Autowired
	private AdminMapper adminDao;

	@Override
	public Userinfo selectUserOne(Userinfo userinfo) {
			return userinfoDao.selectUserOne(userinfo);
	}

	//注册
	@Override
	public int addUserOne(Userinfo userinfo) {
		userinfo.setuResgistdate(DateUtil.getCurrentDateStr());
		return userinfoDao.insert(userinfo);
	}

	//主键查用户
	@Override
	public Userinfo selectUserinfoById(Userinfo userinfo) {
		return userinfoDao.selectByPrimaryKey(userinfo.getuId());
	}


	//修改个人信息
	@Override
	public int updateUserinfoById(Userinfo userinfo) {
		return userinfoDao.updateByPrimaryKeySelective(userinfo);
	}

	@Override
	public PageHelp<Integral> selectIntegralLimit(Map<Object,Object> map) {
		PageHelp<Integral> pageUtil=new PageHelp<Integral>();
		List<Integral> selectIntegralLimit = IntegralDao.selectIntegralLimit(map);
		IntegralExample ie=new IntegralExample();
		Criteria cr = ie.createCriteria();
		cr.andUIdEqualTo((Integer)map.get("uId"));
		int countByExample = IntegralDao.countByExample(ie);
		pageUtil.setList(selectIntegralLimit);
		pageUtil.setRecord(countByExample);
		return pageUtil;
	}

	@Override
	public PageHelp<Account> selectAccountLimit(Map<Object, Object> map) {
		PageHelp<Account> pageUtil=new PageHelp<Account>();
		List<Account> selectAccountLimit = accountDao.selectAccountLimit(map);
		AccountExample ae=new AccountExample();
		AccountExample.Criteria cr = ae.createCriteria();
		cr.andUIdEqualTo((Integer)map.get("uId"));
		int countByExample = accountDao.countByExample(ae);
		pageUtil.setList(selectAccountLimit);
		pageUtil.setRecord(countByExample);
		return pageUtil;
	}

	@Override
	public PageHelp<DoMyOrder> selectOrderLimit(Map<Object, Object> map) {
		PageHelp<DoMyOrder> pageUtil=new PageHelp<DoMyOrder>();
		List<DoMyOrder> selectMyOrderLimit = orderDao.selectMyOrderLimit(map);
        OrderExample oe=new OrderExample();
        OrderExample.Criteria cr = oe.createCriteria();
        cr.andUIdEqualTo((Integer)map.get("uId"));
        cr.andOTypeNotEqualTo(1);
        int countByExample = orderDao.countByExample(oe);
        pageUtil.setList(selectMyOrderLimit);
        pageUtil.setRecord(countByExample);
		return pageUtil;
	}

	@Override
	public PageHelp<DoMyOrder> selectMySuccessOrderLimit(Map<Object, Object> map) {
		PageHelp<DoMyOrder> pageUtil=new PageHelp<DoMyOrder>();
		List<DoMyOrder> selectMyOrderLimit = orderDao.selectMySuccessOrderLimit(map);
        OrderExample oe=new OrderExample();
        OrderExample.Criteria cr = oe.createCriteria();
        cr.andUIdEqualTo((Integer)map.get("uId"));
        cr.andOTypeEqualTo(1);
        int countByExample = orderDao.countByExample(oe);
        pageUtil.setList(selectMyOrderLimit);
        pageUtil.setRecord(countByExample);
		return pageUtil;
	}

	@Override
	public int upDateByorderConfirm(int id,int typeNum,int eId) {
		int updateByPrimaryKeySelective=-5;
		Order order=new Order();
		order.setId(id);
		order.setoType(typeNum);
		if(typeNum==0){
			List<Orderdetail> selectAllSnackNum = selectAllSnackNum(id);
			for (Orderdetail orderdetail : selectAllSnackNum) {
				Snackinfo sk = snackinfoDao.selectByPrimaryKey(orderdetail.getsId());
				if(sk.getsNumber()-orderdetail.getoNum()<0){
					return updateByPrimaryKeySelective;
				}
			}
			for (Orderdetail orderdetail : selectAllSnackNum) {
				Snackinfo sk = snackinfoDao.selectByPrimaryKey(orderdetail.getsId());
				Record re=new Record();
				re.setRecorddate(DateUtil.getCurrentDate());
				re.setRecordnumber(orderdetail.getoNum());
				re.setsId(orderdetail.getsId());
				recordDao.insertSelective(re);
				sk.setsNumber(sk.getsNumber()-orderdetail.getoNum());
				updateByPrimaryKeySelective = snackinfoDao.updateByPrimaryKeySelective(sk);

			}
			order.seteId(eId);
		}
		orderDao.updateByPrimaryKeySelective(order);
		return updateByPrimaryKeySelective;
	}

	@Override
	public Userinfo selectUserinfoMoney(int uId) {
		return userinfoDao.selectByPrimaryKey(uId);
	}

	@Override
	public int updateUserinfoBypay(int uId, float uMoney) {
		Userinfo u=new Userinfo();
		u.setuId(uId);
		u.setuMoney(String.valueOf(uMoney));
		return userinfoDao.updateByPrimaryKeySelective(u);
	}

	public List<Orderdetail> selectAllSnackNum(int id) {
		return orderDao.selectPushSnakcNum(id);
	}

	@Override
	public int updateAdminInfo(DoAdminInfo doadminInfo) {
		return adminDao.updateAdminInfo(doadminInfo);
	}

	@Override
	public Admin selectAdminInfo(int adId) {
		return adminDao.selectByPrimaryKey(adId);
	}

}
