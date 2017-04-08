package com.cargo.dao;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.cargo.model.Orders;
@Component
public class OrdersDao extends BaseDao {
	public void save(Orders transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Orders persistentInstance) {
		//log.debug("deleting Rebate instance");
		try {
			getSession().delete(persistentInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public void deleteByIds(String ids) {
		//log.debug("deleting Rebate instance");
		try {
			String hql ="delete from Orders where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public void update(Orders line){
		try {
			getSession().update(line);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Orders findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			Orders instance = (Orders) getSession().get("com.cargo.model.Orders", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from Orders order by id desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public Map find(String comId,String orderId,String custId,Date stdate,Date enddate){
		Map<String,Object> pageMap = new HashMap<String,Object>();	
		Criteria crit = getSession().createCriteria(Orders.class);				
			
		if(comId!=null){
			crit.add(Restrictions.like("comId",  "%"+comId+"%"));
		}
		if(orderId!=null){
			crit.add(Restrictions.like("orderId", "%"+orderId+"%"));
		}
		if(custId!=null){
			crit.add(Restrictions.like("custId", "%"+custId+"%"));
		}
		
		if(stdate!=null)                        //ge查询制定时间之后的记录  
			crit.add(Restrictions.ge("orderDate",stdate));  
		if(enddate!=null)                          //le查询指定时间之前的记录  
			  crit.add(Restrictions.le("orderDate",enddate));  
	
		if(stdate!=null)                        //ge查询制定时间之后的记录  
			crit.add(Restrictions.ge("receiptDate",stdate));  
		if(enddate!=null)                          //le查询指定时间之前的记录  
			  crit.add(Restrictions.le("receiptDate",enddate));  
		
		crit.addOrder(Order.desc("id"));
				
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);
		
		
		List<Orders> comps = (List<Orders>)crit.list();
		
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	
				
		return pageMap;		
	}
	
	//按单号查找 记录是否存在
	public Boolean isexsitByOrdersId(String orderId){
		boolean isExsit = false;
		List list = null;
			
			try {
				String queryString = "from Orders t where t.orderId =:orderId";
				list = getSession().createQuery(queryString)  
				.setString("orderId",orderId)		
				.list();
				
				if(list.size()>0){
					return true;
				}
			} catch (RuntimeException re) {
				throw re;
			}
			
		
		
		return isExsit;
	}

}
