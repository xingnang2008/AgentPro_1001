package com.cargo.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cargo.dao.PayRecordDao;
import com.cargo.model.Customer;
import com.cargo.model.PayRecord;



@Component
public class PayRecordService {
	@Resource
	private PayRecordDao payRecordDao;
	
	public void save(PayRecord payRecord){
		this.payRecordDao.save(payRecord);
	}
	public void delete(PayRecord payRecord){
		this.payRecordDao.delete(payRecord);
	}
	public void update(PayRecord payRecord){
		this.payRecordDao.update(payRecord);
	}
	
	public void updateExp(String ids,String expCom,String expNo,Date expsd,Double expfee){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord p :list){
			p.setExpressCom(expCom);
			p.setExpressNo(expNo);
			p.setExSendDate(expsd);
			p.setExpressFee(expfee);
			p.setStatus(1);
			payRecordDao.update(p);
		}
	}
	public void clearExp(String ids){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord p :list){
			
			System.out.println(p.getExpressCom()+":"+p.getExpressNo());
			
			p.setExpressCom("-");
			p.setExpressNo("-");
			p.setExSendDate(null);
			p.setExpressFee(0.00);
			p.setStatus(0);
			payRecordDao.update(p);
			
		}
	}
	public List findAll(){
		return this.payRecordDao.findAll();
	}
	public PayRecord findById(java.lang.Integer id) {
		return this.payRecordDao.findById(id);
	}
	public void deleteByIds(String ids){
		this.payRecordDao.deleteByIds(ids);
	}
	//按单号查找 记录是否存在
	public Boolean isexsitByPayId(String waybill){
		return payRecordDao.isexsitByPayId(waybill);
	}
	
	//按单号筛选记录
	public Map find(String comId,String sendNo,String payId,String custId,String expressCom,String expressNo,Integer status,Date stDate,Date edDate){
		return payRecordDao.find(comId, sendNo, payId, custId, expressCom, expressNo,status, stDate, edDate);
	}

}
