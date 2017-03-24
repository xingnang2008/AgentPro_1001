package com.cargo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cargo.dao.ExpressComDao;
import com.cargo.model.ExpressCom;

@Component("expressComService")
public class ExpressComService {

	private ExpressComDao expressComDao;

	public ExpressComDao getExpressComDao() {
		return expressComDao;
	}

	@Resource
	public void setExpressComDao(ExpressComDao expressComDao) {
		this.expressComDao = expressComDao;
	}

	public void save(ExpressCom bitch) {
		this.expressComDao.save(bitch);
	}

	public void delete(ExpressCom bitch) {
		this.expressComDao.delete(bitch);
	}

	public void update(ExpressCom bitch) {	
		
		this.expressComDao.update(bitch);		
	}

	public List<ExpressCom> findAll() {
		return this.expressComDao.findAll();

	}

	public void deleteByIds(String ids) {
		this.expressComDao.deleteByIds(ids);
	}


	public Map find(String company) {
		return this.expressComDao.find(company);
	}

	

}
