package com.safe.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.safe.service.IntakeService;
import com.safe.vo.ExpectedIntake;
import com.safe.vo.Intake;
import com.safe.vo.Member;

@RestController
public class IntakeController {
	
	@Autowired
	IntakeService service;
	
	@GetMapping(value = "/myintake.food")
	public List<Intake> myintake(HttpSession session, HttpServletRequest req) {
		String state = req.getParameter("state");
		Member m = (Member) session.getAttribute("member");
		String id = m.getId();
		List<Intake> list = service.selectAll(id, state);
		System.out.println();
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
	public List<Intake> bestintake(Model model,  HttpServletRequest req) {
		String state = req.getParameter("state");
		List<Intake> list = null;
		if(state.equals("intake")) {
			list = service.bestselectAllByIntake();
		}else if(state.equals("maker")) {
			list = service.bestselectAllByMaker();
		}else {
			list = service.bestselectAllByCalory();
		}
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
	
	
	@GetMapping(value = "/expectedIntakeList.food")
	public List<ExpectedIntake> expectedIntakeList(HttpSession session, HttpServletRequest req) {
		List<ExpectedIntake> el = (List<ExpectedIntake>) session.getAttribute("expectedList");
		if(el ==null) el = new ArrayList<ExpectedIntake>();
		return el;
	}

	@GetMapping(value = "/expectedintake.food")
	public void expectedintake(HttpServletRequest req, HttpSession session) {
		String code = req.getParameter("code");
		List<ExpectedIntake> el = (ArrayList<ExpectedIntake>) session.getAttribute("expectedList");
		if(el == null)	el= new ArrayList<ExpectedIntake>();
		
		boolean flag = false;
		
		for (ExpectedIntake ei : el) {
			if(code.equals(ei.getCode())) {
				ei.setCount(ei.getCount()+1);
				flag = true;
				break;
			}
		}
		
		if(!flag)	el.add(service.expectedintake(code));
		session.setAttribute("expectedList", el);
		
	}
	
	@GetMapping(value = "/expectedintakeAdd.food")
	public void expectedintakeAdd(HttpServletRequest req, HttpSession session) {
		String code = req.getParameter("code");
		List<ExpectedIntake> el = (ArrayList<ExpectedIntake>) session.getAttribute("expectedList");
		
		for (ExpectedIntake ei : el) {
			if(code.equals(ei.getCode())) {
				ei.setCount(ei.getCount()+1);
				break;
			}
		}
	}
	
	@GetMapping(value = "/expectedintakeDel.food")
	public void expectedintakeDel(HttpServletRequest req, HttpSession session) {
		String code = req.getParameter("code");
		List<ExpectedIntake> el = (ArrayList<ExpectedIntake>) session.getAttribute("expectedList");
		
		for (int i = 0; i < el.size(); i++) {
			ExpectedIntake ei = el.get(i);
			if(code.equals(ei.getCode())) {
				if(ei.getCount() == 1) {
					el.remove(i);
				}else {
					ei.setCount(ei.getCount()-1);
				}
				break;
			}
		}
	}

	@GetMapping(value = "/dointake.food")
	public void dointake(HttpSession session) {
		List<ExpectedIntake> el = (List<ExpectedIntake>) session.getAttribute("expectedList");
		Member m = (Member)session.getAttribute("member");
		String id = m.getId();
		for (ExpectedIntake ei : el) {
			int cnt = ei.getCount();
			for (int j = 0; j < cnt ; j++) {
				service.insert(ei.getCode(), id);
			}
		}
		
		session.setAttribute("expectedList", new ArrayList<ExpectedIntake>());
	}
	
}
