package com.safe.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.safe.dao.BoardDao;
import com.safe.vo.Board;
// client(ClientApp.java)가 getBean해서 사용하는 객체
// 서비스 객체
// CustomerDaoImpl 객체를 주입받아 dao 작업 지시
@Component("bod") // cus로 getBean 해감
public class BoardServiceImpl implements BoardService {
    @Autowired
    BoardDao boardDao; // type 기준으로 주입, 실제로 BoardDaoImpl이 주입됨
    @Override
    public List<Board> selectAll() {
        return boardDao.selectAll();
    }
    @Override
    public Board selectOne(String num) {
        return boardDao.selectOne(num);
    }
    @Override
    public void insert(Board b) {
        boardDao.insert(b);
    }
    @Override
    public void delete(String num) {
        boardDao.delete(num);
    }
    @Override
    public void update(Board b) {
        boardDao.update(b);
    }
    @Override
    public List<Board> findByTitle(String title) {
        return boardDao.findByTitle(title);
    }
    @Override
    public List<Board> findByName(String name) {
        return boardDao.findByName(name);
    }
}