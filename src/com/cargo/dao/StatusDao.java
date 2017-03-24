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

import com.cargo.model.Batch;
import com.cargo.model.Status;
@Component
public class StatusDao extends BaseDao {
	public void save(Status transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Status persistentInstance) {
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
			String hql ="delete from Status where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(Status status){
		try {
			getSession().update(status);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Status findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			Status instance = (Status) getSession().get("com.cargo.model.Status", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from Status";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public Map find(){
		
		Map<String,Object> pageMap = new HashMap<String,Object>();		
		Criteria crit = getSession().createCriteria(Status.class);
		
		crit.addOrder(Order.desc("id"));
		
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);		
		
		List<Status> comps = (List<Status>)crit.list();
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	

		return pageMap;
	}
	
	
	
	
		
		

}
