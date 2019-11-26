package com.safe.service;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.safe.dao.IntakeDao;
import com.safe.vo.Intake;
// dao 객체: CRUD 작업
// sqlintakeDao 객체를 주입 받아 CRUD 작업 수행
@Service
public class IntakeServiceImpl implements IntakeService{
    @Autowired
    IntakeDao intakeDao; // SqlintakeDaoTemplate이 실제로 주입됨

    @Override
    public List<Intake> selectAll(String id, String state) {
    	return intakeDao.selectAll(id, state);
    }
    
    @Override
	public Intake selectOne(String code,String id) {
		return intakeDao.selectOne(code,id);
	}
	@Override
	public void update(String code, String id) {
		intakeDao.update(code,id);
	}
	@Override
	public void insert(String code, String id) {
		intakeDao.insert(code,id);
	}

	@Override
	public void add(String code, String date, String id) {
		intakeDao.add(code,date,id);
	}

	@Override
	public void del(String code, String date, String id) {
		intakeDao.del(code,date, id);
	}

    
}