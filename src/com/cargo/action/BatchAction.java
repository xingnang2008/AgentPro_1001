package com.cargo.action;

import java.io.ByteArrayInputStream;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cargo.model.Batch;

@Component
public class BatchAction extends BaseAction<Batch> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public void save(){
		this.batchService.save(model);
	}
	public void update(){
		this.batchService.update(model);
	}
	public void delete(){
		this.batchService.delete(model);
	}
	public List<Batch> findAll(){
		return this.batchService.findAll();
	}
	public String listAll(){
		jsonList = this.batchService.findAll();
		return "jsonList";
	}
	
	@SuppressWarnings("unchecked")
	public String find(){
		pageMap=this.batchService.find(model.getSendNo(), stdate, enddate);
		return "jsonMap";
	}
	public String deleteByIds(){
	
		this.batchService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		
		return "stream";
	}
	
	
}
