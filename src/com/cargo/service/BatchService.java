package com.cargo.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.cargo.dao.BatchDao;
import com.cargo.model.Batch;

@Component("batchService")
public class BatchService {

	private BatchDao batchDao;

	public BatchDao getBatchDao() {
		return batchDao;
	}

	@Resource
	public void setBatchDao(BatchDao batchDao) {
		this.batchDao = batchDao;
	}

	public void save(Batch bitch) {
		this.batchDao.save(bitch);
	}

	public void delete(Batch bitch) {
		this.batchDao.delete(bitch);
	}

	public void update(Batch bitch) {	
		
		this.batchDao.update(bitch);		
	}

	public List<Batch> findAll() {
		return this.batchDao.findAll();

	}




	public void deleteByIds(String ids) {
		this.batchDao.deleteByIds(ids);
	}


	public Map find(String sendNo, Date stDate, Date edDate) {
		return this.batchDao.find(sendNo, stDate, edDate);
	}

	

}
