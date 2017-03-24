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
@Component
public class BatchDao extends BaseDao {
	public void save(Batch transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Batch persistentInstance) {
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
			String hql ="delete from Batch where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(Batch customer){
		try {
			getSession().update(customer);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Batch findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			Batch instance = (Batch) getSession().get("com.cargo.model.Batch", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from Batch order by id desc";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List isBatchExist(String name){
		
		try {
			String queryString = "from Batch c where c.sendNo =:sendNo";
			return getSession().createQuery(queryString)  
			.setString("sendNo",name)		
			.list();
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public Batch findBySendNo(String name){
		try {
			String queryString = "from Batch c where c.sendNo =:sendNo";
			List<Batch> list =getSession().createQuery(queryString)  
			.setString("sendNo",name)		
			.list();
			if(list.size()>0){
				return list.get(0);
			}else return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
	public Map find(String sendNo,Date stDate,Date edDate){
		
		Map<String,Object> pageMap = new HashMap<String,Object>();		
		Criteria crit = getSession().createCriteria(Batch.class);
		
		if(sendNo!=null){   
		crit.add(Restrictions.like("sendNo", "%"+sendNo+"%"));
		}
		if(stDate!=null){                        //ge查询制定时间之后的记录  
			crit.add(Restrictions.ge("sendDate",stDate));  
		}
		if(edDate!=null){                          //le查询指定时间之前的记录  
			  crit.add(Restrictions.le("sendDate",edDate));  
		}
		crit.addOrder(Order.desc("id"));
		
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);		
		
		List<Batch> comps = (List<Batch>)crit.list();
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	

		return pageMap;
	}
		
		

}
