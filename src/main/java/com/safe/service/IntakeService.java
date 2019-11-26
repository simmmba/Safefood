package com.safe.service;
import java.util.List;

import com.safe.vo.Intake;

public interface IntakeService {

	public Intake selectOne(String code,String id);
	public List<Intake> selectAll(String id, String state);
	
	public void insert(String code, String id);
	public void update(String code, String id);
	public void add(String ino, String date, String id);
	public void del(String ino, String date, String id);
	
    
}