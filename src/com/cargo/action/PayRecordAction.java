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
	private Date expdate;  //快递日期
	private Integer checkStatus;
	private Date checkdate;
	private String checkinfo;
	private Integer expStatus;
	
	
	public void save(){
		this.payRecordService.save(model);
	}
	public void update(){
		this.payRecordService.update(model);
	}

	//添加缺货状态
	public String updateNoStore(){
		this.payRecordService.updateNoStore(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//添加快递 公司、单号和日期
	public String updateExpressInfo(){
		this.payRecordService.updateExp(ids,expCom,expNo,expdate);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//清除快递信息
	public String clearExpress(){
		this.payRecordService.updateClearExp(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//从验货处 退回到未签收状态
	public String backExpress(){
		this.payRecordService.updateBackExp(ids,expStatus);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//从退货处 退回到问题件状态
	public String backExpressProblem(){
		this.payRecordService.updateBackExpProblem(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//更新状态 日期
	public String updateExpressStatus(){
		this.payRecordService.updateExpressStatus(ids,expdate,expStatus);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	//验货
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
		pageMap=this.payRecordService.find(model.getOrderId(),model.getComId(),model.getCustId(),  model.getPayId(),model.getStatus(), stdate, enddate);
		
		return "jsonMap";
	}
	public String findALL(){
		pageMap=this.payRecordService.findALL(model.getOrderId(),model.getComId(),model.getCustId(),model.getSendNo(),  model.getPayId(),model.getExpressCom(),model.getExpressNo(),model.getStatus(), stdate, enddate);
		
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
	
	public static long getSerialversionuid() {
		return serialVersionUID;
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
	public Integer getExpStatus() {
		return expStatus;
	}
	public void setExpStatus(Integer expStatus) {
		this.expStatus = expStatus;
	}
	public Date getExpdate() {
		return expdate;
	}
	public void setExpdate(Date expdate) {
		this.expdate = expdate;
	}
	
	
	
}
