package com.xiao.service;

import java.util.List;

import com.xiao.model.Admin;
import com.xiao.model.AdminMenu;
import com.xiao.model.AdminMenuChild;
import com.xiao.model.Permission;

public interface adminLoginService {
	List<Admin> adminLogin(Admin admin);
	List<AdminMenu> selectAllAdminMenu();
	List<AdminMenuChild> selectAllAdminMenuChild();
	List<Permission> selectAllPermission();
	List<Permission> selectRolePermission(int roleId);
}
