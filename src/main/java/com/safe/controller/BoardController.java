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

import com.safe.service.BoardService;
import com.safe.vo.Board;

// @RestController: @Controller + @ResponseBody(java object -> json으로 변환)
@RestController
public class BoardController {
	@Autowired
	BoardService service;
	
//	@GetMapping("/customers")
	@RequestMapping(value="/board", method=RequestMethod.GET)
	public List<Board> selectAll(){
		return service.selectAll();
	}
	
	// http://localhost:8080/rest/board/11
	@RequestMapping(value="/board/{num}", method=RequestMethod.GET) // value에 num 바로 사용 가능!
	public Board selectOne(@PathVariable String num){
		return service.selectOne(num);
	}
	
	@RequestMapping(value="/board", method=RequestMethod.POST) // insert 할때는 method로 POST 사용!
	public Map insert(@RequestBody Board b){ // @RequestBody: REQUEST 안의 json -> java object로 변환
		service.insert(b);
		Map map = new HashMap();
		map.put("result", "insert success!!!");
		
		return map;
	}

	@RequestMapping(value="/board/{num}", method=RequestMethod.DELETE) // method로 DELETE 사용!
	public Map delete(@PathVariable String num){
		service.delete(num);
		Map map = new HashMap();
		map.put("result", "delete success!!!");
		
		return map;
	}
	
	@RequestMapping(value="/board", method=RequestMethod.PUT) // update 할때는 method로 PUT 사용!
	public Map update(@RequestBody Board b){ // @RequestBody: REQUEST 안의 json -> java object로 변환
		service.update(b);
		Map map = new HashMap();
		map.put("result", "update success!!!");
		
		return map;
	}
	
	@RequestMapping(value="/board/{condition}/{word}", method=RequestMethod.GET)
	public List<Board> search(@PathVariable String condition, @PathVariable String word){
		
		if(condition.equals("title"))
			return service.findByTitle(word);

		else if(condition.equals("name")) {
			System.out.println(word);
			return service.findByName(word);
		}
		
		else
			return null;
		
	}
}
