package com.safe.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.safe.dao.BoardDao;
import com.safe.dao.QnaDao;
import com.safe.vo.Answer;
import com.safe.vo.Board;
import com.safe.vo.Question;
import com.safe.vo.Reply;
// client(ClientApp.java)가 getBean해서 사용하는 객체
// 서비스 객체
// CustomerDaoImpl 객체를 주입받아 dao 작업 지시
@Component("qna") // cus로 getBean 해감
public class QnaServiceImpl implements QnaService {
    @Autowired
    QnaDao qnaDao; // type 기준으로 주입, 실제로 BoardDaoImpl이 주입됨
    @Override
    public List<Question> selectAll() {
        return qnaDao.selectAll();
    }
    @Override
    public Question selectOne(String num) {
        return qnaDao.selectOne(num);
    }
	@Override
	public void insertQustion(Question q) {
		qnaDao.insertQustion(q);
	}
	@Override
	public void deleteQuestion(String num) {
		qnaDao.deleteQuestion(num);
	}
	@Override
	public void updateQuestion(Question q) {
		qnaDao.updateQuestion(q);
	}
	@Override
	public void insertAnswer(Answer a) {
		qnaDao.insertAnswer(a);
	}
	@Override
	public void deleteAnswer(String num) {
		qnaDao.deleteAnswer(num);
	}
	@Override
	public void updateAnswer(Answer a) {
		qnaDao.updateAnswer(a);
	}
	@Override
	public List<Question> findByTitle(String title) {
        return qnaDao.findByTitle(title);
	}
	@Override
	public List<Question> findByName(String name) {
        return qnaDao.findByName(name);
	}
	@Override
	public List<Reply> selectReply(String num) {
		return qnaDao.selectReply(num);
	}
	@Override
	public void insertReply(Reply r) {
		qnaDao.insertReply(r);
	}
	@Override
	public void deleteReply(String num) {
		qnaDao.deleteReply(num);
	}
}