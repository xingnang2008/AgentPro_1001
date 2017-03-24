package com.cargo.dao;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
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

import com.cargo.model.PayRecord;
@Component
public class PayRecordDao extends BaseDao {
	public void save(PayRecord transientInstance) {
		//log.debug("saving Rebate instance");
		try {
			getSession().save(transientInstance);
		} catch (RuntimeException re) {
			throw re;
		}
	}

	public void delete(PayRecord persistentInstance) {
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
			String hql ="delete from PayRecord where id in ("+ ids +")";
			getSession().createQuery(hql).executeUpdate();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public void update(PayRecord line){
		try {
			getSession().update(line);
		} catch (RuntimeException re) {
			throw re;
		}
	}
	//选中的记录集
	public List<PayRecord> listByIds(String ids) {
		//log.debug("deleting Rebate instance");
		try {
			String hql ="from PayRecord where id in ("+ ids +")";
			Query queryObject = getSession().createQuery(hql);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public PayRecord findById(java.lang.Integer id) {
		//log.debug("getting Rebate instance with id: " + id);
		try {
			PayRecord instance = (PayRecord) getSession().get("com.cargo.model.PayRecord", id);
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
	}
	public List findAll() {
		//log.debug("finding all Rebate instances");
		try {
			String queryString = "from PayRecord";
			Query queryObject = getSession().createQuery(queryString);
			return queryObject.list();
		} catch (RuntimeException re) {
			throw re;
		}
	}
	
	
	//按单号查找 记录是否存在
	public Boolean isexsitByPayId(String waybill){
		boolean isExsit = false;
		List list = null;
			
			try {
				String queryString = "from PayRecord t where t.payId =:payId";
				list = getSession().createQuery(queryString)  
				.setString("payId",waybill)		
				.list();
				
				if(list.size()>0){
					return true;
				}
			} catch (RuntimeException re) {
				throw re;
			}
			
		
		
		return isExsit;
	}
	public Map find(String comId,String sendNo,String payId,String custId,String expressCom,String expressNo,Integer status,Date stDate,Date edDate){
		Map<String,Object> pageMap = new HashMap<String,Object>();	
		Criteria crit = getSession().createCriteria(PayRecord.class);				
		if(sendNo!=null){
			crit.add(Restrictions.like("sendNo", "%"+sendNo+"%"));
		}		
		if(comId!=null){
			crit.add(Restrictions.like("comId",  "%"+comId+"%"));
		}
		if(payId!=null){
			crit.add(Restrictions.like("payId", "%"+payId+"%"));
		}
		if(custId!=null){
			crit.add(Restrictions.like("custId", "%"+custId+"%"));
		}
		if(expressCom!=null){
			crit.add(Restrictions.like("expressCom", "%"+expressCom+"%"));
		}
		if(expressNo!=null){
			crit.add(Restrictions.like("expressNo", "%"+expressNo+"%"));
		}
		if(status!=null){
			crit.add(Restrictions.eq("status", status));
		}
		if(stDate!=null)                        //ge查询制定时间之后的记录  
			crit.add(Restrictions.ge("buyDate",stDate));  
		if(edDate!=null)                          //le查询指定时间之前的记录  
			  crit.add(Restrictions.le("buyDate",edDate));  
		
		crit.addOrder(Order.desc("id"));
		Long rowCount = (Long) crit.setProjection(Projections.rowCount()).uniqueResult();  //执行查询记录行数
		crit.setProjection(null);
		
		
		List<PayRecord> comps = (List<PayRecord>)crit.list();
		
		
		pageMap.put("rows",comps);
		pageMap.put("total",rowCount);	
				
		return pageMap;		
	}
	/*
	//按客户号查询  按日期 汇总收款
	public List<RceiptByCustAndDate> listByCustIdAndDate(String sender){
		
		try {
			String hql ="select comId,comName,sum(fee) ,rdate  from PayRecord r where r.sender=:sender group by rdate order by rdate desc";
			List<Object[]> results = getSession().createQuery(hql)
			.setString("sender",sender)
			.list();
			List<RceiptByCustAndDate> list = new ArrayList();			
			if(results!=null&&results.size()>0){
			    String custId = "";//发货人
			    Number fee =0; //金额
			    Object rdate = new Date();
			    for(Object[] obj:results){
			    	custId = obj[0]!=null?(String) obj[0]:"";
			        fee = obj[1] != null?Integer.parseInt(obj[1].toString()):BigDecimal.ZERO;			      
			        rdate = obj[2]!=null?((Date) obj[2]):"-";
			      
			       RceiptByCustAndDate rbcsd = new RceiptByCustAndDate();
			       rbcsd.setSender(sender);
			       rbcsd.setFee(fee.intValue());
			       rbcsd.setRdate((Date)rdate);
			       rbcsd.setCustId(custId);
			       list.add(rbcsd);
			    }
			}
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	//按日期 汇总收款
	public List<RceiptByCustAndDate> listByCustIdAndDate(){
		
		try {
			String hql ="select custId,sum(fee) ,rdate ,sender from PayRecord group by rdate  order by rdate desc";
			List<Object[]> results = getSession().createQuery(hql)
			.list();
			List<RceiptByCustAndDate> list = new ArrayList();			
			if(results!=null&&results.size()>0){
			    String custId = ""; //客户号
			    String sender ="";//发货人
			    Number fee =0; //金额
			    Object rdate = new Date();
			    for(Object[] obj:results){
			    	custId = obj[0]!=null?(String) obj[0]:"";
			        fee = obj[1] != null?Integer.parseInt(obj[1].toString()):BigDecimal.ZERO;			      
			        rdate = obj[2]!=null?((Date) obj[2]):"-";
			        sender = obj[3]!=null?(String) obj[3]:"";
			        
			       RceiptByCustAndDate rbcsd = new RceiptByCustAndDate();
			       rbcsd.setSender(sender);
			       rbcsd.setFee(fee.intValue());
			       rbcsd.setRdate((Date)rdate);
			       rbcsd.setCustId(custId);
			       list.add(rbcsd);
			    }
			}
			return list;
		} catch (RuntimeException re) {
			throw re;
		}
		
	}
	*/
}
