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
		
		service.insert(code, id);

	}
	@GetMapping(value = "/intakeAdd.food")
	public void intakeAdd(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		
		String id = m.getId();
		String code = req.getParameter("code");
		String date = req.getParameter("date");
		
		service.add(code,date, id);
	}
	
	@GetMapping(value = "/intakeDel.food")
	public void intakeDel(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		
		String id = m.getId();
		String code = req.getParameter("code");
		String date = req.getParameter("date");
		service.del(code,date,id);
	}
	
	@GetMapping(value = "/bestintake.food")
	public List<Intake> bestintake(Model model, HttpSession session, HttpServletRequest req) {
		String state = req.getParameter("state");
		
		List<Intake> list = service.bestselectAll(state);
		
		
		return list;
	}
	
	@GetMapping(value = "/bestintakeAdd.food")
	public void bestintakeAdd(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");

		String id = m.getId();
		String code = req.getParameter("code");
		String date = req.getParameter("date");

		service.bestadd(code, id,date);
		
	}
	
	@GetMapping(value = "/bestintakeDel.food")
	public void bestintakeDel(HttpServletRequest req, HttpSession session) {
		Member m = (Member) session.getAttribute("member");
		
		String id = m.getId();
		String code = req.getParameter("code");
		String date = req.getParameter("date");
		service.bestdel(code,id,date);
	}
	
	

}
