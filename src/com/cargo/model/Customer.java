package com.cargo.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Customer entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "customer")
public class Customer implements java.io.Serializable {

	// Fields

	private Integer id;
	private String custName;
	private String custId;
	private String telphone;
	private String address;
	private String email;
	private String remarks;
	private String city;

	// Constructors

	/** default constructor */
	public Customer() {
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

	@Column(name = "custname", length = 50)
	public String getCustName() {
		return this.custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	@Column(name = "custId", length = 20)
	public String getCustId() {
		return this.custId;
	}

	public void setCustId(String custId) {
		this.custId = custId;
	}

	@Column(name = "telphone", length = 50)
	public String getTelphone() {
		return this.telphone;
	}

	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	@Column(name = "address", length = 50)
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "email", length = 30)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "remarks", length = 250)
	public String getRemarks() {
		return this.remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@Column(name = "city", length = 30)
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}