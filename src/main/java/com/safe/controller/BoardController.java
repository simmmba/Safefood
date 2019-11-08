package com.safe.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.safe.service.BoardService;
import com.safe.vo.Board;

@Controller
public class BoardController {
	@Autowired
	BoardService service;
	
	@GetMapping(value = "/notice.food")
	public String notice(Model model) {
		List<Board> list = service.selectAll();
		model.addAttribute("list", list);
		
		return "notice"; // 논리적인 view 이름
	}
	
	@GetMapping(value = "/noticeInsert.food")
	public String noticeInsert() {
		return "noticeInsert";
	}
	
	@PostMapping(value = "/noticeInsert.food")
	public String noticeInsert2(Model model, Board c) {
		model.addAttribute("c", c);
		service.insert(c);
		
		return "redirect:notice.food";
	}
	
	@GetMapping(value = "/noticeRead.food")
	public String noticeRead(String num, Model model) {
		Board c = service.selectOne(num);
		model.addAttribute("c", c);
		
		return "noticeRead";
	} 
}
