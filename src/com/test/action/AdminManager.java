package com.test.action;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionSupport;
import com.test.bean.Admin;
import com.test.exception.ModelException;
import com.test.service.AdminService;
import com.test.util.JsonUtil;
import com.test.util.PageList;

@SuppressWarnings("serial")
public class AdminManager extends ActionSupport {
	
   private AdminService adminService;
   private Admin admin = new Admin();
   private Integer id;
   private String password;
   
   public Admin getAdmin() {
		return admin;
   }
   public void setAdmin(Admin admin) {
		this.admin = admin;
   }

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
    public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
/**
    *  显示员工主界面
    * @return  success
    */
	public String main(){
		return "success";
	}
	//过滤查询功能
	private int rows = 10;
	private int page = 1;
	private Admin like = new Admin();
	public Admin getLike() {
		return like;
	}
    
	public void setLike(Admin like) {
		this.like = like;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public void list() {
		try {
			JSONObject root = new JSONObject();
			PageList<Admin> list = adminService.list(like, (page - 1) * rows,
					rows);
			int count = list.getRows();
			root.put("page", page);
			root.put("total", count / rows + ((count % rows) > 0 ? 1 : 0));
			root.put("records", count);
			JSONArray rows = new JSONArray();
			for (Admin s : list) {
				rows.add(s, JsonUtil.config());
			}
			root.put("rows", rows);
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			root.write(ServletActionContext.getResponse().getWriter());
		} catch (Throwable e) {
			e.printStackTrace();
		}

	}
	
	public String saveAdmin() throws ModelException {
		this.adminService.saveAdmin(this.admin);
		return "success";
	}
	
	
	public String modify() {
		try {
			adminService.modify(admin);
			return "success";
		} catch (ModelException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "error";

	}
	
	//加载
	public void load() {
		try {
			JSONObject root = new JSONObject();
			Admin adm = adminService.load(id);
			root.element("admin", adm, JsonUtil.config());
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			root.write(ServletActionContext.getResponse().getWriter());
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}	
}
