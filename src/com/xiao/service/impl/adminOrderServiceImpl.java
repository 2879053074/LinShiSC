package com.xiao.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiao.mapper.OrderMapper;
import com.xiao.mapper.OrderdetailMapper;
import com.xiao.mapper.ReceiptinfoMapper;
import com.xiao.model.Orderdetail;
import com.xiao.model.Receiptinfo;
import com.xiao.model.domain.DoAdminOrder;
import com.xiao.model.domain.DoExcelOrder;
import com.xiao.model.domain.DoSnack;
import com.xiao.service.adminOrderService;
import com.xiao.utils.PageHelp;

@Service
public class adminOrderServiceImpl implements adminOrderService{
	@Autowired
	private OrderMapper orderDao;

	@Autowired
	private OrderdetailMapper orderdetailDao;

	@Autowired
	private ReceiptinfoMapper receiptinfoDao;

	@Override
	public PageHelp<DoAdminOrder> selectAdminOrderLimit(Map<Object, Object> map) {
		PageHelp<DoAdminOrder> pageUtil=new PageHelp<DoAdminOrder>();
		List<DoAdminOrder> selectAdminOrderLimit = orderDao.selectAdminOrderLimit(map);
		int countAdminOrder = orderDao.countAdminOrder(map);
		pageUtil.setList(selectAdminOrderLimit);
		pageUtil.setRecord(countAdminOrder);
		return pageUtil;
	}

	@Override
	public int deleteAdminOrder(String oId) {
		return orderDao.deleteAdminOrder(oId);
	}

	@Override
	public Receiptinfo updateSelectAdminOrder(int rId) {
		return receiptinfoDao.selectByPrimaryKey(rId);
	}

	@Override
	public int updateAdminOrder(Receiptinfo receiptinfo) {
		return receiptinfoDao.updateByPrimaryKeySelective(receiptinfo);
	}

	@Override
	public DoSnack updateSelectAdminOrderDetial(int dId) {
		return orderdetailDao.selectOrderdetail(dId);
	}

	@Override
	public int updateOrderdetail(Orderdetail orderdetail) {
		return orderdetailDao.updateByPrimaryKeySelective(orderdetail);
	}

	@Override
	public List<Orderdetail> selectOrderdetailByoId(String oId) {
		return orderdetailDao.selectOrderdetailByoId(oId);
	}

	@Override
	public int deleteOrderdetailBydId(int dId) {
		return orderdetailDao.deleteByPrimaryKey(dId);
	}

	@Override
	public List<DoExcelOrder> outExcelOrderDetail(String oId) {
		return orderdetailDao.outExcelOrderDetail(oId);
	}

}
