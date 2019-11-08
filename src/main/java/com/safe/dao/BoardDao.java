package com.safe.dao;
import java.util.List;

import com.safe.vo.Board;

//client(BoardApp.java)를 위한 인터페이스
public interface BoardDao {
    public List<Board> selectAll();
    public Board selectOne(String num);
    public void insert(Board b);
    public void delete(String num);
    public void update(Board b); // 번호 기준으로 제목과 내용 수정
    public List<Board> findByTitle(String title);
    public List<Board> findByName(String name);
    
    public List<Board> findByTitle2(String title); // like 검색
}