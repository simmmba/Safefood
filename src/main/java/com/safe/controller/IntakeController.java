package com.safe.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.IntakeService;
import com.safe.vo.Intake;
import com.safe.vo.Member;

@RestController
public class IntakeController {
	
	@Autowired
	IntakeService service;
	
	@GetMapping(value = "/myintake.food")
	public List<Intake> myintake(Model model, HttpSession session, HttpServletRequest req) {
		String state = req.getParameter("state");
		System.out.println(state);
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Intake> list = service.selectAll(id, state);
		return list;
	}
	
	@GetMapping(value = "/intake.food")
	public void intake(HttpServletRequest req, HttpSession session) {
		String code = req.getParameter("code");
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		System.out.println(code + "  "  + id);
		
		service.insert(code, id);

	}
	
	@GetMapping(value = "/intakeDel.food")
	public void intakeDel(HttpServletRequest req, HttpSession session) {
		String ino = req.getParameter("ino");
		
		service.del(ino);
		
	}
	
	@GetMapping(value = "/intakeAdd.food")
	public void intakeAdd(HttpServletRequest req, HttpSession session) {
		String ino = req.getParameter("ino");
		service.add(ino);
		
	}
	

}
