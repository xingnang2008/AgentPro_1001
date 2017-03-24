package com.cargo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * Status entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "status")
public class Status {
	
	// Fields

	private Integer id;
	private String status;	
	private String remarks;
	

	// Constructors

	/** default constructor */
	public Status() {
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



	public String getStatus() {
		return status;
	}



	public void setStatus(String status) {
		this.status = status;
	}



	public String getRemarks() {
		return remarks;
	}



	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	
	
	

}
