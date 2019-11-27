package com.safe.dao;
import java.util.List;

import com.safe.vo.ExpectedIntake;
import com.safe.vo.Intake;

//client(BoardApp.java)를 위한 인터페이스
public interface IntakeDao {

	public Intake selectOne(String code,String id);
	public List<Intake> selectAll(String id, String state);
	
	public void insert(String code, String id);
	public void add(String code, String date, String id);
	public void del(String code, String date, String id);
	
	public List<Intake> bestselectAllByIntake();
	public List<Intake> bestselectAllByMaker();
	public List<Intake> bestselectAllByCalory();
	public void bestadd(String code,String id, String date);
	public void bestdel(String code,String id, String date);
	public ExpectedIntake ExpectedIntake(String code);
    
}