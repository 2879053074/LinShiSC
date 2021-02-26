package com.xiao.service;

import java.util.List;
import java.util.Map;

import com.xiao.model.Orderdetail;
import com.xiao.model.Receiptinfo;
import com.xiao.model.domain.DoAdminOrder;
import com.xiao.model.domain.DoExcelOrder;
import com.xiao.model.domain.DoSnack;
import com.xiao.utils.PageHelp;

public interface adminOrderService {
	PageHelp<DoAdminOrder> selectAdminOrderLimit(Map<Object,Object> map);
	int deleteAdminOrder(String oId);
	Receiptinfo updateSelectAdminOrder(int rId);
	int updateAdminOrder(Receiptinfo receiptinfo);
	DoSnack updateSelectAdminOrderDetial(int dId);
	int updateOrderdetail(Orderdetail orderdetail);
	List<Orderdetail> selectOrderdetailByoId(String oId);
	int deleteOrderdetailBydId(int dId);
	List<DoExcelOrder> outExcelOrderDetail(String oId);
}
