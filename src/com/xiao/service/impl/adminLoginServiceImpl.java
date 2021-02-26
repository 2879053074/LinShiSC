package com.xiao.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xiao.mapper.AdminMapper;
import com.xiao.mapper.AdminMenuChildMapper;
import com.xiao.mapper.AdminMenuMapper;
import com.xiao.mapper.PermissionMapper;
import com.xiao.model.Admin;
import com.xiao.model.AdminExample;
import com.xiao.model.AdminExample.Criteria;
import com.xiao.model.AdminMenu;
import com.xiao.model.AdminMenuChild;
import com.xiao.model.Permission;
import com.xiao.service.adminLoginService;

@Service
public class adminLoginServiceImpl implements adminLoginService{

	@Autowired
	private AdminMapper adminDao;

	@Autowired
	private AdminMenuMapper AdminMenuDao;

	@Autowired
	private AdminMenuChildMapper AdminMenuChildDao;

	@Autowired
	private PermissionMapper permissionDao;

	@Override
	public List<Admin> adminLogin(Admin admin) {
		AdminExample ae=new AdminExample();
		Criteria cr = ae.createCriteria();
		cr.andAdUsernameEqualTo(admin.getAdUsername());
		cr.andAdPasswordEqualTo(admin.getAdPassword());
		return adminDao.selectByExample(ae);
	}

	@Override
	public List<AdminMenu> selectAllAdminMenu() {
		return AdminMenuDao.selectByExample(null);
	}

	@Override
	public List<AdminMenuChild> selectAllAdminMenuChild() {
		return AdminMenuChildDao.selectByExample(null);
	}

	@Override
	public List<Permission> selectAllPermission() {
		return permissionDao.selectByExample(null);
	}

	@Override
	public List<Permission> selectRolePermission(int roleId) {
		return permissionDao.selectRolePermission(roleId);
	}

}
