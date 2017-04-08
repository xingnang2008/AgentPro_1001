package com.cargo.action;

import java.io.ByteArrayInputStream;

import org.springframework.stereotype.Component;

import com.cargo.model.Orders;
@SuppressWarnings("unchecked")
@Component
public class OrdersAction extends BaseAction<Orders> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public void save(){
		this.ordersService.save(model);
	}
	public void update(){
		this.ordersService.update(model);
	}
	public String deleteByIds(){
		this.ordersService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	public String find(){		
		pageMap=this.ordersService.find(model.getComId(),model.getOrderId(),model.getCustId(),stdate, enddate);
		
		return "jsonMap";
	}
	
	public String listAll(){
		jsonList = this.ordersService.findAll();
		return "jsonList";
	}
	
	public String findExist(){
		inputStream =new ByteArrayInputStream("false".getBytes());	
		if(this.ordersService.isexsitByOrdersId(model.getOrderId())!=true){
			inputStream = new ByteArrayInputStream("true".getBytes());
		}
		return "stream";
	}
	
}
