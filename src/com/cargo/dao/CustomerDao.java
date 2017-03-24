package com.cargo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Component;

import com.cargo.model.Customer;
@Component
public class CustomerDao extends BaseDao {
	public void save(Customer transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Customer persistentInstance) {
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
			String hql ="delete from Customer where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(Customer customer){
		try {
			getSession().update(customer);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Customer findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			Customer instance = (Customer) getSession().get("com.cargo.model.Customer", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from Customer";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List isCustomerExist(String name){
		
		try {
			String queryString = "from Customer c where c.custName =:custName";
			return getSession().createQuery(queryString)  
			.setString("custName",name)		
			.list();
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public Customer findByName(String name){
		try {
			String queryString = "from Customer c where c.name =:name";
			List<Customer> list =getSession().createQuery(queryString)  
			.setString("custName",name)		
			.list();
			if(list.size()>0){
				return list.get(0);
			}else return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public Customer findByCustId(String custId){
		try {
			String queryString = "from Customer c where c.custId =:custId";
			List<Customer> list =getSession().createQuery(queryString)  
			.setString("custId",custId)		
			.list();
			if(list.size()>0){
				return list.get(0);
			}else return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	public Map find(String custId,String name,String telphone){
		
		Map<String,Object> pageMap = new HashMap<String,Object>();		
		Criteria crit = getSession().createCriteria(Customer.class);
		
		if(custId !=null){
			crit.add(Restrictions.like("custId", "%"+custId+"%"));
		}
		if(name != null){
			crit.add(Restrictions.like("custName", "%"+name+"%"));
		}
		if(telphone !=null ){
			crit.add(Restrictions.like("telphone", "%"+telphone+"%"));
		}
		
		crit.addOrder(Order.desc("id"));
		
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);		
		
		List<Customer> comps = (List<Customer>)crit.list();
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	

		return pageMap;
	}
		
		

}
