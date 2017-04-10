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
	private static int P_NEW=1;  //已经订
	private static int P_SENDED=2; //已发出
	private static int P_RECEIVED=3; //已收到
	private static int P_CHECKED=5; //验货通过
	private static int P_PROBLEM=4; //验货有问题
	private static int P_NONE=0; //无货
	private static int P_BACK=-1; //退货
	private static int P_OUT=7; //已转运
	
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
	
	public void updateExp(String ids,String expCom,String expNo,Date expsd){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord p :list){
			p.setExpressCom(expCom);
			p.setExpressNo(expNo);
			p.setExSendDate(expsd);			
			p.setStatus(P_SENDED);
			update(p);
		}
	}
	public void updateClearExp(String ids){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord pd :list){
			
			
			pd.setExpressCom("-");
			pd.setExpressNo("-");
			pd.setExSendDate(null);			
			pd.setStatus(P_NEW);
			
			update(pd);
			
		}
	}
	//从验货处 退回到未签收状态
	public void updateBackExp(String ids,Integer status){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord pd :list){
			if(status == 2){
				pd.setExRecDate(null);
			}
			pd.setStatus(status);
			update(pd);
			
		}
	}
	//从退货处 退回到问题件状态
	public void updateBackExpProblem(String ids){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord pd :list){
			pd.setExRecDate(null);
			pd.setStatus(P_PROBLEM);
			update(pd);
			
		}
	}
	//缺货标记
	public void updateNoStore(String ids){
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord pd :list){
			pd.setStatus(P_NONE);
			update(pd);
			
		}
	}
	//更新 状态 和 日期
	public void updateExpressStatus(String ids,Date date,Integer status){
			
		List<PayRecord> list = payRecordDao.listByIds(ids);
		for(PayRecord pd :list){
			pd.setStatus(status);
			if(status == P_SENDED){
				pd.setExSendDate(date);
			}else if(status ==P_RECEIVED){
				pd.setExRecDate(date);
			}else if(status ==P_CHECKED){
				pd.setCheckDate(date);
			}else if(status ==P_PROBLEM){
				pd.setCheckDate(date);
			}else if(status ==P_BACK){
				pd.setBackDate(date);
			}else if(status ==P_OUT){
				pd.setSendDate(date);
			}
			
			update(pd);
			
		}
		
	}
	public void updateCheckExp(String ids,Integer checkStatus,Date checkDate,String checkInfo){
		Integer status = checkStatus==0?P_CHECKED:P_PROBLEM; 
		
		List<PayRecord> list = payRecordDao.listByIds(ids);
		
		for(PayRecord pd :list){
			pd.setCheckDate(checkDate);
			pd.setCheckInfo(checkInfo);			
			pd.setStatus(status);
			
			
			update(pd);
			
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
	public Map findALL(String orderId,String comId,String custId,String sendNo,String payId,String expressCom,String expressNo,Integer status,Date stDate,Date edDate){
		return payRecordDao.findALL(orderId, comId, custId, sendNo, payId, expressCom, expressNo, status, stDate, edDate);
	}
	public Map find(String orderId,String comId,String custId,String payId,Integer status,Date stDate,Date edDate){
		return payRecordDao.find(orderId, comId, custId, payId, status, stDate, edDate);
	}
	//按公司汇总财务记录
	public Map listFee(String comId){
		return payRecordDao.listFee(comId);
	}

}
