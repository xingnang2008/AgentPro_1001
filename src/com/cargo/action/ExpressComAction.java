package com.cargo.action;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cargo.model.ExpressCom;

@Component
public class ExpressComAction extends BaseAction<ExpressCom> {

	public void save(){
		this.expressComService.save(model);
	}
	public void update(){
		this.expressComService.update(model);
	}
	public void delete(){
		this.expressComService.delete(model);
	}
	public List<ExpressCom> findAll(){
		return this.expressComService.findAll();
	}
	public String listAll(){
		jsonList = this.expressComService.findAll();
		return "jsonList";
	}
	
	@SuppressWarnings("unchecked")
	public String find(){
		pageMap=this.expressComService.find(model.getExpressCom());
		return "jsonMap";
	}
	public String deleteByIds(){
	
		this.expressComService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		
		return "stream";
	}
	
	
}
