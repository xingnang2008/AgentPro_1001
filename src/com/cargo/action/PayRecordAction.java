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
	private Date exped;
	private Integer checkStatus;
	private Date checkdate;
	private String checkinfo;
	
	
	public void save(){
		this.payRecordService.save(model);
	}
	public void update(){
		this.payRecordService.update(model);
	}
	public String updateExpress(){
		this.payRecordService.updateExp(ids,expCom,expNo,expsd);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String clearExpress(){
		this.payRecordService.updateClearExp(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String backExpress(){
		this.payRecordService.updateBackExp(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String receiveExpress(){
		this.payRecordService.updateReceiveExp(ids,exped);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String checkExpress(){
		this.payRecordService.updateCheckExp(ids,checkStatus,checkdate,checkinfo);
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
		pageMap=this.payRecordService.find(model.getOrderId(),model.getComId(),model.getCustId(), model.getSendNo(), model.getPayId(), model.getExpressCom(),model.getExpressNo(),model.getStatus(), stdate, enddate);
		
		return "jsonMap";
	}
	public String deleteByIds(){
		this.payRecordService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String listFee(){
			pageMap=this.payRecordService.listFee(model.getComId());
		
		return "jsonMap";
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
	
	public Date getExped() {
		return exped;
	}
	public void setExped(Date exped) {
		this.exped = exped;
	}
	public Integer getCheckStatus() {
		return checkStatus;
	}
	public void setCheckStatus(Integer checkStatus) {
		this.checkStatus = checkStatus;
	}
	public Date getCheckdate() {
		return checkdate;
	}
	public void setCheckdate(Date checkdate) {
		this.checkdate = checkdate;
	}
	public String getCheckinfo() {
		return checkinfo;
	}
	public void setCheckinfo(String checkinfo) {
		this.checkinfo = checkinfo;
	}
	
	
	
}
