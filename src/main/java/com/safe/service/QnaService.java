package com.safe.service;
import java.util.List;

import com.safe.vo.Answer;
import com.safe.vo.Board;
import com.safe.vo.Question;
//client(QuestionApp.java)를 위한 인터페이스
public interface QnaService {
    public List<Question> selectAll();
    public Question selectOne(String num);
    public void insertQustion(Question q);
    public void deleteQuestion(String num);
    public void updateQuestion(Question q);
    public void insertAnswer(Answer a);
    public void deleteAnswer(String num);
    public void updateAnswer(Answer a);
    public List<Question> findByTitle(String title);
    public List<Question> findByName(String name);
}