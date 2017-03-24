package com.cargo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Company entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "expresscom")
public class ExpressCom {
	
	private Integer id;
	private String expressCom;
	private String tel;
	private String remarks;
	
	
	
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

	

	public String getExpressCom() {
		return expressCom;
	}

	public void setExpressCom(String expressCom) {
		this.expressCom = expressCom;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

}
