package com.safe.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.QnaService;
import com.safe.vo.Question;
import com.safe.vo.Reply;

@RestController
public class QnaRestController {
	@Autowired
	QnaService service;
	
	@RequestMapping(value = "/listQuestion", method=RequestMethod.GET)
	public List<Question> selectAll() {
		return service.selectAll();
	}
	
	@RequestMapping(value="/qna/{num}", method=RequestMethod.GET) // value에 num 바로 사용 가능!
	public Question selectOne(@PathVariable String num){
		return service.selectOne(num);
	}
	
	@RequestMapping(value="/qna", method=RequestMethod.POST) // insert 할때는 method로 POST 사용!
	public Map insertQustion(@RequestBody Question q){ // @RequestBody: REQUEST 안의 json -> java object로 변환
		service.insertQustion(q);
		Map map = new HashMap();
		map.put("result", "insert success!!!");
		
		return map;
	}

	@RequestMapping(value="/qna/{num}", method=RequestMethod.DELETE) // method로 DELETE 사용!
	public Map deleteQuestion(@PathVariable String num){
		service.deleteQuestion(num);
		Map map = new HashMap();
		map.put("result", "delete success!!!");
		
		return map;
	}
	
	@RequestMapping(value="/qna", method=RequestMethod.PUT) // update 할때는 method로 PUT 사용!
	public Map updateQuestion(@RequestBody Question q){ // @RequestBody: REQUEST 안의 json -> java object로 변환
		service.updateQuestion(q);
		Map map = new HashMap();
		map.put("result", "update success!!!");
		
		return map;
	}

	
	@RequestMapping(value="/qna/{condition}/{word}", method=RequestMethod.GET)
	public List<Question> search(@PathVariable String condition, @PathVariable String word){
		
		if(condition.equals("title")) {
			return service.findByTitle(word);
		}
		else if(condition.equals("name")) {
			return service.findByName(word);
		}
		else
			return null;
	}
	
	//qna
	@RequestMapping(value="/qnaReply/{num}", method=RequestMethod.GET) // 
	public List<Reply> selectReply(@PathVariable String num){
		return service.selectReply(num);
	}
	
	@RequestMapping(value="/qnaReply", method=RequestMethod.POST) // insert 할때는 method로 POST 사용!
	public Map insertQustion(@RequestBody Reply r){ // @RequestBody: REQUEST 안의 json -> java object로 변환
		service.insertReply(r);

		Map map = new HashMap();
		map.put("result", "insert success!!!");
		
		return map;
	}
	
	@RequestMapping(value="/qnaReply/{num}", method=RequestMethod.DELETE) // method로 DELETE 사용!
	public Map deleteReply(@PathVariable String num){
		service.deleteReply(num);
		Map map = new HashMap();
		map.put("result", "delete success!!!");
		return map;
	}
}
