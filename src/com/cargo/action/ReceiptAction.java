package com.cargo.action;

import java.io.ByteArrayInputStream;

import org.springframework.stereotype.Component;

import com.cargo.model.Receipt;
@Component
public class ReceiptAction extends BaseAction<Receipt> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	
	public void save(){
		this.receiptService.save(model);
	}
	public void update(){
		this.receiptService.update(model);
	}
	public String deleteByIds(){
		this.receiptService.deleteByIds(ids);
		inputStream = new ByteArrayInputStream("true".getBytes());		
		return "stream";
	}
	@SuppressWarnings("unchecked")
	public String find(){		
		pageMap=this.receiptService.find(model.getComId(), stdate, enddate);
		
		return "jsonMap";
	}
	
	
	
	
}
