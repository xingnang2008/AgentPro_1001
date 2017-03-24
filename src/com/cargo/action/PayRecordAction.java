package com.cargo.action;

import java.io.ByteArrayInputStream;
import java.util.Date;

import org.springframework.stereotype.Component;

import com.cargo.model.PayRecord;

@Component
public class PayRecordAction extends BaseAction<PayRecord> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String expCom;
	private String expNo;
	private Date expsd;
	private Double expfee;
	
	
	public void save(){
		this.payRecordService.save(model);
	}
	public void update(){
		this.payRecordService.update(model);
	}
	public String updateExpress(){
		this.payRecordService.updateExp(ids,expCom,expNo,expsd,expfee);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String clearExpress(){
		this.payRecordService.clearExp(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public void delete(){
		this.payRecordService.delete(model);
	}
	@SuppressWarnings("unchecked")
	public String listAll(){
		jsonList = this.payRecordService.findAll();
		return "jsonList";
	}
	public String findExist(){
		inputStream =new ByteArrayInputStream("false".getBytes());	
		if(this.payRecordService.isexsitByPayId(model.getPayId())!=true){
			inputStream = new ByteArrayInputStream("true".getBytes());
		}
		return "stream";
	}
	@SuppressWarnings("unchecked")
	public String find(){
		pageMap=this.payRecordService.find(model.getComId(), model.getSendNo(), model.getPayId(), model.getCustId(),model.getExpressCom(),model.getExpressNo(),model.getStatus(), stdate, enddate);
		
		return "jsonMap";
	}
	public String deleteByIds(){
		this.payRecordService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	
	
	
	
	
	
	/*
	 * 
	 * 传参用
	 */
	
	
	public String getExpCom() {
		return expCom;
	}
	public void setExpCom(String expCom) {
		this.expCom = expCom;
	}
	public String getExpNo() {
		return expNo;
	}
	public void setExpNo(String expNo) {
		this.expNo = expNo;
	}
	public Date getExpsd() {
		return expsd;
	}
	public void setExpsd(Date exsd) {
		this.expsd = exsd;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	public Double getExpfee() {
		return expfee;
	}
	public void setExpfee(Double expfee) {
		this.expfee = expfee;
	}
	
	
}
