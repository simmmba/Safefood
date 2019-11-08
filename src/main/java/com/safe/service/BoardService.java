package com.safe.service;
import java.util.List;

import com.mybatis.vo.Board;
//client(BoardApp.java)를 위한 인터페이스
public interface BoardService {
    public List<Board> selectAll();
    public Board selectOne(String num);
    public void insert(Board b);
    public void delete(String num);
    public void update(Board b);
    public List<Board> findByTitle(String title);
    public List<Board> findByName(String name);
    // 과제
    public List<Board> findByTitle2(String title); // like 검색
    public void delete2(String[] nums); // 여러개의 글 한꺼번에 삭제
}