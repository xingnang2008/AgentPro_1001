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

import com.cargo.model.ExpressCom;
@Component
public class ExpressComDao extends BaseDao {
	public void save(ExpressCom transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(ExpressCom persistentInstance) {
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
			String hql ="delete from ExpressCom where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(ExpressCom expressCom){
		try {
			getSession().update(expressCom);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public ExpressCom findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			ExpressCom instance = (ExpressCom) getSession().get("com.cargo.model.ExpressCom", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from ExpressCom";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List isExpressComExist(String name){
		
		try {
			String queryString = "from ExpressCom c where c.expressCom =:expressCom";
			return getSession().createQuery(queryString)  
			.setString("expressCom",name)		
			.list();
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public ExpressCom findByExpressCom(String name){
		try {
			String queryString = "from ExpressCom c where c.expressCom =:expressCom";
			List<ExpressCom> list =getSession().createQuery(queryString)  
			.setString("expressCom",name)		
			.list();
			if(list.size()>0){
				return list.get(0);
			}else return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
	public Map find(String expressCom){
		
		Map<String,Object> pageMap = new HashMap<String,Object>();		
		Criteria crit = getSession().createCriteria(ExpressCom.class);
		
		
		if(expressCom!=null)   
			crit.add(Restrictions.like("expressCom", "%"+expressCom+"%"));
				
		crit.addOrder(Order.desc("id"));
		
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);		
		
		List<ExpressCom> comps = (List<ExpressCom>)crit.list();
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	

		return pageMap;
	}
		
		

}
