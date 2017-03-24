package com.cargo.action;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.cargo.model.Company;

@Component
public class CompanyAction extends BaseAction<Company> {

	public void save(){
		this.companyService.save(model);
	}
	public void update(){
		this.companyService.update(model);
	}
	public void delete(){
		this.companyService.delete(model);
	}
	public List<Company> findAll(){
		return this.companyService.findAll();
	}
	public String listAll(){
		jsonList = this.companyService.findAll();
		return "jsonList";
	}
	
	@SuppressWarnings("unchecked")
	public String find(){
		pageMap=this.companyService.find(model.getComId(),model.getCompany(), stdate, enddate);
		return "jsonMap";
	}
	public String deleteByIds(){
	
		this.companyService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		
		return "stream";
	}
	
	
}
