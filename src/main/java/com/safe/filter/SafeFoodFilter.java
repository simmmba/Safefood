//package com.safe.filter;
//
//import java.io.IOException;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import com.safe.controller.MemberController;
//import com.safe.controller.SafeFoodController;
//
//@WebFilter(filterName = "/SafeFoodFilter", urlPatterns = { "*.food" })
//public class SafeFoodFilter implements Filter {
//
//	public SafeFoodFilter() {
//	}
//
//	public void destroy() {
//	}
//
//	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
//		HttpServletRequest req=(HttpServletRequest) request;
//		HttpServletResponse res=(HttpServletResponse) response;
//		
//		req.setCharacterEncoding("utf-8");
//		res.setContentType("text/html;charset=utf-8");
//		
//		String reqString = req.getServletPath();
//
//		req.setCharacterEncoding("utf-8");
//
//		MemberController mc = new MemberController();
//		SafeFoodController ss=new SafeFoodController();
//
//		System.out.println(reqString);
//		
//		if(reqString.equals("/main.food")) {
////			ss.list(req,res);
//			
//		}else if(reqString.equals("/search.food")){
//			ss.list(req,res);
//			
//		}else if(reqString.equals("/read.food")) {
//			ss.read(req,res);
//			
//		}else if (reqString.equals("/joinForm.food")) {
//			System.out.println("joinForm");
//			mc.joinForm(req, res);
//		
//		}else if (reqString.equals("/join.food")) {
//			System.out.println("join");
//			mc.join(req, res);
//			
//		}else if (reqString.equals("/loginForm.food")) {
//			System.out.println("loginForm");
//			mc.loginForm(req, res);
//		
//		}else if (reqString.equals("/login.food")) {
//			System.out.println("login");
//			mc.login(req, res);
//		
//		}else if (reqString.equals("/logout.food")) {
//			System.out.println("logout");
//			mc.logout(req, res);
//		
//		}else if(reqString.equals("/searchRead.food")){
//			ss.read(req, res);
//		
//		}else if(reqString.equals("/detail.food")){
//			ss.detail(req,res);
//		
//		}else if(reqString.equals("/memberinfo.food")){
//			mc.memberinfo(req,res);
//		
//		}else if(reqString.equals("/editForm.food")){
//			mc.editForm(req,res);
//		
//		}else if(reqString.equals("/edit.food")){
//			mc.edit(req,res);
//		}else if(reqString.equals("/quit.food")) {
//			mc.quit(req,res);
//		}else if(reqString.equals("/quitConfirm.food")) {
//			mc.quitConfirm(req,res);
//		}
//		else if(reqString.equals("/pass.food")) {
//			mc.pass(req,res);
//		}else if(reqString.equals("/passProcess.food")){
//			mc.passProcess(req,res);
//		}else if(reqString.equals("/cal.food")){
//			ss.cal(req,res);
//		}
//		
//	}
//
//	public void init(FilterConfig fConfig) throws ServletException {
//	}
//
//}
