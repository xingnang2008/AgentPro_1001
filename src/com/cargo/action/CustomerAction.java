package com.cargo.action;

import java.io.ByteArrayInputStream;
import org.springframework.stereotype.Component;

import com.cargo.model.Customer;
@Component
public class CustomerAction extends BaseAction<Customer> {
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void save(){
		this.customerService.save(model);
	}
	public void update(){
		this.customerService.update(model);
	}
	
	public String deleteByIds(){
		this.customerService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	@SuppressWarnings("unchecked")
	public String listAll(){
		jsonList = this.customerService.findAll();
		return "jsonList";
	}
	@SuppressWarnings("unchecked")
	public String find(){
		pageMap = this.customerService.find(model.getCustId(),model.getCustName(), model.getTelphone());
			
		return "jsonMap"; 
	}
}
