package com.safe.dao;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.safe.vo.Answer;
import com.safe.vo.Question;
import com.safe.vo.Reply;
// dao 객체: CRUD 작업
// sqlSession 객체를 주입 받아 CRUD 작업 수행
@Component("qnaDao")
public class QnaDaoImpl implements QnaDao {
    @Autowired
    SqlSession session; // SqlSessionTemplate이 실제로 주입됨
    
    @Override
    public List<Question> selectAll() {
        System.out.println(session);
        return session.selectList("qna.selectAll");
    }
    @Override
    public Question selectOne(String num) {
    	countUp(num);
        return session.selectOne("qna.selectOne", num);
    }
	@Override
	public void insertQustion(Question q) {
		session.insert("qna.insertQuestion", q);
	}
	@Override
	public void deleteQuestion(String num) {
		session.delete("qna.deleteQuestion", num);
	}
	@Override
	public void updateQuestion(Question q) {
		session.update("qna.updateQuestion", q);
	}
	@Override
	public void insertAnswer(Answer a) {
		session.insert("qna.insertAnswer", a);
	}
	@Override
	public void deleteAnswer(String num) {
		session.delete("qna.deleteAnswer", num);
	}
	@Override
	public void updateAnswer(Answer a) {
		session.update("qna.updateAnswer", a);
	}
	public void countUp(String num) {
    	session.update("qna.updateCount",num);
    }
	@Override
	public List<Question> findByTitle(String title) {
        return session.selectList("qna.findByTitle", title);
	}
	@Override
	public List<Question> findByName(String name) {
        return session.selectList("qna.findByName", name);
	}
	@Override
	public List<Reply> selectReply(String num) {
		return session.selectList("qna.selectReply",num);
	}
	@Override
	public void insertReply(Reply r) {
		session.insert("qna.insertReply",r);
	}
	@Override
	public void deleteReply(String num) {
		session.delete("qna.deleteReply",num);
	}
	
}