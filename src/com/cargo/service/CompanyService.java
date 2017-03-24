package com.cargo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cargo.dao.CompanyDao;
import com.cargo.model.Company;

@Component("companyService")
public class CompanyService {

	private CompanyDao companyDao;

	public CompanyDao getCompanyDao() {
		return companyDao;
	}

	@Resource
	public void setCompanyDao(CompanyDao companyDao) {
		this.companyDao = companyDao;
	}

	public void save(Company bitch) {
		this.companyDao.save(bitch);
	}

	public void delete(Company bitch) {
		this.companyDao.delete(bitch);
	}

	public void update(Company bitch) {	
		
		this.companyDao.update(bitch);		
	}

	public List<Company> findAll() {
		return this.companyDao.findAll();

	}

	public void deleteByIds(String ids) {
		this.companyDao.deleteByIds(ids);
	}


	public Map find(String comId,String company, Date stDate, Date edDate) {
		return this.companyDao.find(comId,company, stDate, edDate);
	}

	

}
