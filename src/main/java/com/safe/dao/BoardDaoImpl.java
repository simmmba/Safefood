package com.safe.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.safe.vo.Board;
// dao 객체: CRUD 작업
// sqlSession 객체를 주입 받아 CRUD 작업 수행
@Component("boardDao")
public class BoardDaoImpl implements BoardDao {
    @Autowired
    SqlSession session; // SqlSessionTemplate이 실제로 주입됨
    @Override
    public List<Board> selectAll() {
        System.out.println(session);
        return session.selectList("board.selectAll");
    }
    @Override
    public Board selectOne(String num) {
    	countUp(num);
        return session.selectOne("board.selectOne", num);
    }
    @Override
    public void insert(Board b) {
        session.insert("board.insert", b);
    }
    @Override
    public void delete(String num) {
        session.delete("board.delete", num);
    }
    @Override
    public void update(Board b) {
        session.update("board.update", b);
    }
    @Override
    public List<Board> findByTitle(String title) {
        return session.selectList("board.findByTitle", title);
    }
    @Override
    public List<Board> findByName(String name) {
        return session.selectList("board.findByName", name);
    }
    
    public void countUp(String num) {
    	session.update("board.updateCount",num);
    }
}