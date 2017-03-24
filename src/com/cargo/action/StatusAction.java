package com.cargo.action;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cargo.model.Status;

@Component
public class StatusAction extends BaseAction<Status> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void save(){
		this.statusService.save(model);
	}
	public void update(){
		this.statusService.update(model);
	}
	public void delete(){
		this.statusService.delete(model);
	}
	public List<Status> findAll(){
		return this.statusService.findAll();
	}
	public String listAll(){
		jsonList = this.statusService.findAll();
		return "jsonList";
	}
	
	
	public String deleteByIds(){
	
		this.statusService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		
		return "stream";
	}
	public String find(){
		pageMap=this.statusService.find();
		return "jsonMap";
	}
	
}
