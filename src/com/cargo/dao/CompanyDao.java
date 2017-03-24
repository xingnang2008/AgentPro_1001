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

import com.cargo.model.Company;
@Component
public class CompanyDao extends BaseDao {
	public void save(Company transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(Company persistentInstance) {
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
			String hql ="delete from Company where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void update(Company company){
		try {
			getSession().update(company);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public Company findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			Company instance = (Company) getSession().get("com.cargo.model.Company", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from Company";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List isCompanyExist(String name){
		
		try {
			String queryString = "from Company c where c.comId =:comId";
			return getSession().createQuery(queryString)  
			.setString("comId",name)		
			.list();
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	public Company findBySendNo(String name){
		try {
			String queryString = "from Company c where c.comId =:comId";
			List<Company> list =getSession().createQuery(queryString)  
			.setString("comId",name)		
			.list();
			if(list.size()>0){
				return list.get(0);
			}else return null;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
	public Map find(String comId,String company,Date stDate,Date edDate){
		
		Map<String,Object> pageMap = new HashMap<String,Object>();		
		Criteria crit = getSession().createCriteria(Company.class);
		
		if(comId!=null)   
		crit.add(Restrictions.like("comId", "%"+comId+"%"));
		if(company!=null)   
			crit.add(Restrictions.like("company", "%"+company+"%"));
		if(stDate!=null)                        //ge查询制定时间之后的记录  
			crit.add(Restrictions.ge("sendDate",stDate));  
		if(edDate!=null)                          //le查询指定时间之前的记录  
			  crit.add(Restrictions.le("sendDate",edDate));  
		
		crit.addOrder(Order.desc("id"));
		
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);		
		
		List<Company> comps = (List<Company>)crit.list();
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	

		return pageMap;
	}
		
		

}
