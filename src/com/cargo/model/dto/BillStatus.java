package com.cargo.model.dto;


public class BillStatus {

	private Integer id;
	
	
	// 客户对应客户号
	private String custId;
	private String custName;
		
	// 账目信息	
		
	private Integer receiptFee; //收到客户付款金额	
	private Integer payFee; //花掉的金额	
	
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getCustId() {
		return custId;
	}
	public void setCustId(String custId) {
		this.custId = custId;
	}
	public String getCustName() {
		return custName;
	}
	public void setCustName(String custName) {
		this.custName = custName;
	}
	public Integer getReceiptFee() {
		return receiptFee;
	}
	public void setReceiptFee(Integer receiptFee) {
		this.receiptFee = receiptFee;
	}
	public Integer getPayFee() {
		return payFee;
	}
	public void setPayFee(Integer payFee) {
		this.payFee = payFee;
	}
	
	
	
}
