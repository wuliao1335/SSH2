package com.test.dao.impl;

import java.sql.SQLException;
import org.hibernate.Session;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.test.bean.Admin;
import com.test.dao.AdminDao;
import com.test.exception.ModelException;
import com.test.util.PageList;

public class AdminDaoImpl extends HibernateDaoSupport implements AdminDao  {

	@SuppressWarnings("unchecked")
	public PageList<Admin> list(final Admin admin, final int skip,final int size)
	       throws ModelException {
           try{  
		    PageList<Admin> list = (PageList<Admin>) this.getHibernateTemplate().execute(new HibernateCallback(){

			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				Criteria query = session.createCriteria(Admin.class);
				//组合条件
				if(admin.getAdminname()!=null){
					query.add(Restrictions.like("adminname", admin.getAdminname(),MatchMode.ANYWHERE));
				}
				//统计行数
				query.setProjection(Projections.rowCount());
				Long count = (Long) query.uniqueResult();
				//查询结果
				query.setProjection(null);
				query.addOrder(Order.asc("id"));
				query.setFirstResult(skip);
				query.setMaxResults(size);
				PageList<Admin> list = new PageList(count.intValue());
				list.addAll(query.list());
				return list;
			}});   
             return list;
        }catch(Exception e){
        	e.printStackTrace();
        	throw new ModelException(1,e.getMessage());  
        }
    }

	//添加管理员方法实现
    public Admin saveAdmin(Admin admin) throws ModelException {
    	this.getHibernateTemplate().save(admin);
        return null;		
	}

	public Admin load(int id) throws ModelException {
		
		try{
			return (Admin) this.getHibernateTemplate().get(Admin.class, id);
		}catch(Exception e){
        	e.printStackTrace();
        	throw new ModelException(1,e.getMessage());  
        }
		
	}

	public void modify(Admin admin) throws ModelException {
		Admin adm = (Admin) this.getHibernateTemplate().get(Admin.class, admin.getId());
        try{
        	adm.setAdminname(admin.getAdminname());
        	adm.setPassword(admin.getPassword());
        	
         
		 this.getHibernateTemplate().saveOrUpdate(adm);
        }catch(Exception e){
        	e.printStackTrace();
        	throw new ModelException(1,e.getMessage());  
        }
	}

	

}

