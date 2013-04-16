package com.test.service.impl;

import com.test.bean.Admin;
import com.test.dao.AdminDao;
import com.test.exception.ModelException;
import com.test.service.AdminService;
import com.test.util.PageList;

public class AdminServiceImpl implements AdminService {
	  private AdminDao adminDao ;//该模块对应的DAO

	public void setAdminDao(AdminDao adminDao) {
		this.adminDao = adminDao;
	}
    //添加管理员方法实现
	public Admin saveAdmin(Admin admin) throws ModelException {
		 adminDao.saveAdmin(admin);
		 return null;
	}
    //浏览信息
	public PageList<Admin> list(Admin admin, int skip, int size)
			throws ModelException {
		
		return adminDao.list(admin, skip, size);
	}
    //加载信息
	public Admin load(int id) throws ModelException {
		
		return adminDao.load(id);
	}
    //修改信息
	public void modify(Admin admin) throws ModelException {
		
		adminDao.modify(admin);
		
	}

}

