package com.cargo.model.dto;


public class BillStatus {

	private Integer id;
	
	
	// 客户对应客户号
	private String custId;
	private String custName;
	
	//公司信息
	private String comId;
	private String comName;
	
	// 账目信息	
		
	private Double receiptFee; //收到客户付款金额	
	private Double payFee; //花掉的金额
	private Double expressFee;
	private Double sendFee;
	
	
	
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
	public Double getReceiptFee() {
		return receiptFee;
	}
	public void setReceiptFee(Double receiptFee) {
		this.receiptFee = receiptFee;
	}
	public Double getPayFee() {
		return payFee;
	}
	public void setPayFee(Double payFee) {
		this.payFee = payFee;
	}
	public String getComId() {
		return comId;
	}
	public void setComId(String comId) {
		this.comId = comId;
	}
	public String getComName() {
		return comName;
	}
	public void setComName(String comName) {
		this.comName = comName;
	}
	public Double getExpressFee() {
		return expressFee;
	}
	public void setExpressFee(Double expressFee) {
		this.expressFee = expressFee;
	}
	public Double getSendFee() {
		return sendFee;
	}
	public void setSendFee(Double sendFee) {
		this.sendFee = sendFee;
	}
	
	
	
}
