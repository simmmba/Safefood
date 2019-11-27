package com.safe.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.safe.dao.IMemberDao;
import com.safe.vo.Member;

@Controller
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	IMemberDao service;
	

	@GetMapping(value = "/joinForm.food")
	public String joinForm(HttpServletRequest req, HttpServletResponse res) {
		return "join";
	}
	
	@PostMapping(value = "/join.food")
	public String join(HttpServletRequest req, HttpServletResponse res) {
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");
		String name = req.getParameter("name");
		String address = req.getParameter("address");
		String call = req.getParameter("callnum");

		String[] allergyArr = req.getParameterValues("allergy");

		String allergy = null;
		StringBuilder sb = new StringBuilder();
		
		if (allergyArr != null) {
			sb.append(allergyArr[0]);
			if(allergyArr.length > 1) {
				for(int i = 1; i < allergyArr.length-1; i++) {
					sb.append("," + allergyArr[i]);
				}
			}
			allergy = sb.toString();
		}

		Member m = new Member(id, pass, name, address, call, allergy);
		System.out.println(m.toString());
		service.join(m);
		return "redirect:/main.food";
	}

	
	@GetMapping(value = "/loginForm.food")
	public String loginForm(HttpServletRequest req, HttpServletResponse res) {
		return "login";
	}

	@PostMapping(value = "/login.food")
	public String login(HttpServletRequest req) {
		String id = req.getParameter("id");
		String pass = req.getParameter("pass");

		Member m = service.login(id, pass);

		if (service.login(id, pass) != null) {
			HttpSession hs = req.getSession();
			hs.setAttribute("member", m);
			return "redirect:/main.food";
		
		} else {
			String msg = "아이디 또는 패스워드가 틀립니다.";
			req.setAttribute("msg", msg);
			return "loginFail";
		}
		
	}

	@GetMapping(value = "/logout.food")
	public String logout(HttpServletRequest req) throws IOException, ServletException {
		req.getSession().invalidate();
		return "redirect:/main.food";
		
	}

	@GetMapping(value = "/memberinfo.food")
	public String memberinfo(HttpServletRequest req, HttpServletResponse res) {
		return "memberinfo";
	}

	@GetMapping(value = "/editForm.food")
	public String editForm(HttpServletRequest req, HttpServletResponse res) {
		return "editpage";
	}
	
	
	@PostMapping(value = "/edit.food")
	public String edit(HttpServletRequest req) {

		String id = req.getParameter("id");
		String address = req.getParameter("address");
		String callnum = req.getParameter("callnum");
		String Opass=req.getParameter("Opass");
		String Npass=req.getParameter("Npass");
		
		if(Npass =="") Npass = Opass;

		String[] allergyArr = req.getParameterValues("allergy");
		String allergy = null;
		StringBuilder sb = new StringBuilder();

		if (allergyArr != null) {
			sb.append(allergyArr[0]);
			if(allergyArr.length > 1) {
				for(int i = 1; i < allergyArr.length-1; i++) {
					sb.append("," + allergyArr[i]);
				}
			}
			allergy = sb.toString();
		}
		
		service.update(id, Opass, Npass, address, callnum, allergy);

		HttpSession hs = req.getSession();
		Member m = (Member) hs.getAttribute("member");
		m.setAddress(address);
		m.setCallnum(callnum);
		m.setAllegy(allergy);
		
		return "memberinfo";
	}
	
	@GetMapping(value = "/quit.food")
	public String quit(HttpServletRequest req ) throws IOException {
		
		String id=req.getParameter("id");
		service.delete(id);
		
		req.getSession().invalidate();
		return "redirect:/main.food";
	}
	
	
	@GetMapping(value = "/quitConfirm.food")
	public String quitConfirm(HttpServletRequest req) {
		String id=req.getParameter("id");
		req.setAttribute("id", id);
		
		return "quit";
		
	}

	@PostMapping(value = "/pass.food")
	public String pass(HttpServletRequest req, HttpServletResponse res) {
		return "pass";
	}

	@PostMapping(value = "/passProcess.food")
	public String passProcess(HttpServletRequest req) throws IOException {
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String callnum = req.getParameter("callnum");
		
		String newPass=service.newPass(id,name,callnum);
		
		if(newPass==null) {
			String msg = "회원정보가 없습니다.";
			req.setAttribute("msg", msg);
			return "login";
		}
		else {
			String msg = "임시 비밀번호를 발급했습니다.";
			req.setAttribute("msg", msg);
			req.setAttribute("newPass", newPass);
			
			return "passSuccess";
		}
	}
	
	@ExceptionHandler
	public String exception() {
		return "error";
	}

}
