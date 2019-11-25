package com.safe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.safe.service.IntakeService;
import com.safe.vo.Intake;
import com.safe.vo.Member;

@Controller
public class IntakeController {
	
	@Autowired
	IntakeService service;
	
	@GetMapping(value = "/myintake.food")
	public String myintake(Model model, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Intake> list = service.selectAll(id);
		
		model.addAttribute("list",list);
		
		return "myintake";
	}
	
	@GetMapping(value = "/intake.food")
	public String intake(HttpServletRequest req, HttpSession session) {
		String code = req.getParameter("code");
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		service.update(code, id);
		//		if(m == null) return "login";
//		
//		
		return "main.food";
//		
	}
	
//	@GetMapping(value = "/noticeInsertForm.food")
//	public String noticeInsert(HttpSession session) {
//		Member m = (Member) session.getAttribute("member");
//		if(m == null) return "login";
//		return "noticeInsert";
//	}
//	
//	@PostMapping(value = "/noticeInsert.food")
//	public String noticeInsert(HttpSession session, Model model, Board b) {
//		System.out.println(b.getName());
//		model.addAttribute("b", b);
//		service.insert(b);
//		
//		return "redirect:notice.food";
//	}
//	
//	@GetMapping(value = "/noticeRead.food")
//	public String noticeRead(String num, Model model) {
//		Board b = service.selectOne(num);
//		model.addAttribute("b", b);
//		
//		return "noticeRead";
//	} 
//	
//	@GetMapping(value = "/noticeEditForm.food")
//	public String noticeEditForm(HttpSession session, HttpServletRequest req, Model model) {
//		
//		Member m = (Member) session.getAttribute("member");
//		if(m == null) return "login";
//		
//		String num = req.getParameter("num");
//		Board b = service.selectOne(num);
//		model.addAttribute("b", b);
//		return "noticeEdit";
//	}
//	
//	@PostMapping(value = "/noticeEdit.food")
//	public String noticeEdit(Board b) {
//		service.update(b);
//		return "redirect:notice.food";
//	} 
//
//	@GetMapping(value = "/noticeDelete.food")
//	public String noticeDelete(HttpSession session, HttpServletRequest req) {
//		
//		Member m = (Member) session.getAttribute("member");
//		if(m == null) return "login";
//		
//		String num = req.getParameter("num");
//		service.delete(num);
//		return "redirect:notice.food";
//	}
//	@GetMapping(value = "/noticeSearch.food")
//	public String noticeSearch(HttpServletRequest req, Model m) {
//		
//		String key = req.getParameter("condition");
//		String word = req.getParameter("word");
//		List<Board> list = null;
//
//		if(key.equals("제목")) {
//			list = service.findByTitle(word);
//		}else {
//			list = service.findByName(word);
//		}
//		m.addAttribute("list",list);
//		return "notice";
//	}
}
