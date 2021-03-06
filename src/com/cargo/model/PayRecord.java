package com.cargo.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "payrecord")
public class PayRecord {

	// Fields

	private Integer id;
	
	// 定单号
	private String orderId;
	private String comId;
	private String custId;
	// 链接信息
	private String payId;
	private Integer pics;
	private Double payFee;
	private String wwwadd;
	private String info;
	private Date buyDate;

	// 中国快递信息
	private Double expressFee;
	private String expressNo;
	private String expressCom;
	private Date exSendDate;
	private Date exRecDate;
	private Date backDate;

	// 俄国快递信息
	private Double sendFee;
	private String sendNo;
	private String sendCom;
	private Date sendDate;
	private Date recDate;


	// 状态

	private Integer status;
	private String infoes;

	// 日期
	private Date checkDate;
	private String checkInfo;
	

	// Constructors

	/** default constructor */
	public PayRecord() {
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}

	public Integer getPics() {
		return pics;
	}

	public void setPics(Integer pics) {
		this.pics = pics;
	}

	public Double getPayFee() {
		return payFee;
	}

	public void setPayFee(Double payFee) {
		this.payFee = payFee;
	}

	public String getWwwadd() {
		return wwwadd;
	}

	public void setWwwadd(String wwwadd) {
		this.wwwadd = wwwadd;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public Double getExpressFee() {
		return expressFee;
	}

	public void setExpressFee(Double expressFee) {
		this.expressFee = expressFee;
	}

	

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getInfoes() {
		return infoes;
	}

	public void setInfoes(String infoes) {
		this.infoes = infoes;
	}

	public Date getBuyDate() {
		return buyDate;
	}

	public void setBuyDate(Date buyDate) {
		this.buyDate = buyDate;
	}

	public String getExpressNo() {
		return expressNo;
	}

	public void setExpressNo(String expressNo) {
		this.expressNo = expressNo;
	}

	public String getExpressCom() {
		return expressCom;
	}

	public void setExpressCom(String expressCom) {
		this.expressCom = expressCom;
	}

	public Date getExSendDate() {
		return exSendDate;
	}

	public void setExSendDate(Date exSendDate) {
		this.exSendDate = exSendDate;
	}

	public Date getExRecDate() {
		return exRecDate;
	}

	public void setExRecDate(Date exRecDate) {
		this.exRecDate = exRecDate;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public Date getSendDate() {
		return sendDate;
	}

	public void setSendDate(Date sendDate) {
		this.sendDate = sendDate;
	}

	

	public Double getSendFee() {
		return sendFee;
	}

	public void setSendFee(Double sendFee) {
		this.sendFee = sendFee;
	}

	public String getSendNo() {
		return sendNo;
	}

	public void setSendNo(String sendNo) {
		this.sendNo = sendNo;
	}

	public String getSendCom() {
		return sendCom;
	}

	public void setSendCom(String sendCom) {
		this.sendCom = sendCom;
	}

	public Date getRecDate() {
		return recDate;
	}

	public void setRecDate(Date recDate) {
		this.recDate = recDate;
	}


	public String getCheckInfo() {
		return checkInfo;
	}

	public void setCheckInfo(String checkInfo) {
		this.checkInfo = checkInfo;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getComId() {
		return comId;
	}

	public void setComId(String comId) {
		this.comId = comId;
	}

	public String getCustId() {
		return custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	public Date getBackDate() {
		return backDate;
	}

	public void setBackDate(Date backDate) {
		this.backDate = backDate;
	}

	

}
