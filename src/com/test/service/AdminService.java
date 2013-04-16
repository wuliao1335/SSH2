package com.test.service;

import com.test.bean.Admin;
import com.test.exception.ModelException;
import com.test.util.PageList;

public interface AdminService {
	/**
	   * 加载管理员信息列表(按admin参数进行模糊匹配)
	   * @param admin 模糊匹配对象
	   * @return 管理员列表
	   * @throws ModelException 任何可能的业务逻辑异常,异常包含异常消息和错误代码
	   */
	  public PageList<Admin> list(Admin admin,int skip,int size) throws ModelException; 
	  //添加管理员方法
	  public Admin saveAdmin(Admin admin) throws ModelException;
	  public Admin load(int id) throws ModelException;
	  public void modify(Admin admin) throws ModelException;
}
