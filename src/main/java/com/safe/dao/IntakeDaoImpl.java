package com.safe.dao;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Intake;
// dao 객체: CRUD 작업
// sqlSession 객체를 주입 받아 CRUD 작업 수행
@Repository
public class IntakeDaoImpl implements IntakeDao {
    @Autowired
    SqlSession session; // SqlSessionTemplate이 실제로 주입됨

    @Override
    public List<Intake> selectAll(String id, String state) {
    	Map<String,String> m = new HashMap<String, String>();
    	if(state.equals("day")) state = "1";
    	else if(state.equals("week")) state = "8";
    	else state = "32";
    	m.put("id", id);
    	m.put("state", state);
    	
    	
    	return session.selectList("intake.selectAll",m);
    }

    @Override
	public Intake selectOne(String code,String id) {
		Map<String,String> m = new HashMap<>();
		m.put("code", code);
		m.put("id", id);
		return session.selectOne("intake.selectOne",m);
	}

	@Override
	public void update(String code, String id) {
		Intake intake= selectOne(code, id);
		
		if(intake == null) {
			insert(code,id);
		}else {
			Map<String,String> m = new HashMap<>();
			m.put("ino", intake.getIno());
			m.put("code", code);
			m.put("id", id);
			session.update("intake.update",m);
		}
	}
	@Override
	public void insert(String code, String id) {
		Map<String,String> m = new HashMap<>();
		m.put("code", code);
		m.put("id", id);
		session.insert("intake.insert",m);
	}

	@Override
	public void add(String code, String date, String id) {
		Map<String,String> m = new HashMap<>();
		m.put("id", id);
		m.put("code", code);
		m.put("date", date);
		session.insert("intake.add",m);
	}
	
	@Override
	public void del(String code, String date, String id) {
		Map<String,String> m = new HashMap<>();
		m.put("id", id);
		m.put("code", code);
		m.put("date", date);
		session.delete("intake.del", m);
		
	}

    
}