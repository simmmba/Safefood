package com.safe.dao;
import java.util.List;

import com.safe.vo.Answer;
import com.safe.vo.Question;
import com.safe.vo.Reply;
//client(QuestionApp.java)를 위한 인터페이스
public interface QnaDao {
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
	public List<Reply> selectReply(String num);
	public void insertReply(Reply r);
	public void deleteReply(String num);
}