package com.safe.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.safe.service.FoodService;
import com.safe.vo.Food;
import com.safe.vo.Word;

@Controller
public class SafeFoodController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Autowired
	FoodService service;
	
	static List<Word> trends = new ArrayList<>();
	String[] allergy = { "대두", "땅콩", "우유", "게", "새우", "참치", "연어", "쑥", "소고기", "닭고기", "복숭아", "민들레", "계란흰자" };
	
	
	@GetMapping(value = "/main.food")
	public String list(HttpServletRequest req, Model model) {
		List<Food> list=service.searchAll("all",null);
		model.addAttribute("list", list);//jsp에서 꺼내쓰도록 list 저장
		return "index";
	}

	@GetMapping(value = "/read.food")
	public String read(HttpServletRequest req) {

		List<Food> list=service.searchAll("all",null);
		req.setAttribute("list", list);//jsp에서 꺼내쓰도록 list 저장
		
		//jsp로 forward해서 넘어가기
		return "read";
	}
	
	@GetMapping(value = "/search.food")
	public String search(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		String word = req.getParameter("word");

		if (key == null)	key = "all";
		
		//인기 검색어
		ServletContext app = req.getServletContext();
		if (word != null && word!="")	trendWord(word);
		app.setAttribute("trends", trends);
		
		List<Food> list = new ArrayList<Food>();
		if(!key.equals("all") && word != null && !word.trim().equals("")) {
			list=service.searchAll(key, word);
		}
		else {
			list=service.searchAll("all",null);
		}
		model.addAttribute("list", list);//jsp에서 꺼내쓰도록 list 저장
		//jsp로 forward해서 넘어가기
		return "index";
	}
	@GetMapping(value = "/searchRead.food")
	public String searchRead(HttpServletRequest req, Model model) {
		String key = req.getParameter("key");
		String word = req.getParameter("word");

		if (key == null)	key = "all";

		
		ServletContext app = req.getServletContext();
		if (word != null)	trendWord(word);
		app.setAttribute("trends", trends);
		
		List<Food> list = new ArrayList<Food>();
		
		if(!key.equals("all") && word != null && !word.trim().equals("")) {
			if(key.equals("칼로리")) {
				try {
					list=service.searchCal(word);
					double cal=0.0;
					for(int i=0;i<list.size();i++) {
						cal+=list.get(i).getCalory();
					}
					String str=String.format("%.2f",cal);
					model.addAttribute("cal",str);
					model.addAttribute("list", list);
					return "cal";
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			else {
				list=service.searchAll(key, word);
			}
		}
		else list=service.searchAll("all",null);
		model.addAttribute("list", list);//jsp에서 꺼내쓰도록 list 저장
		return "read";
	}

	@GetMapping(value = "/detail.food")
	public String detail(HttpServletRequest req, Model model) {
		int code = Integer.parseInt(req.getParameter("code"));
		Food f = service.search(code);

		String meterial = f.getMaterial();
		String allergy = findAllergy(meterial);

		model.addAttribute("f",f);
		model.addAttribute("a",allergy);
		
		return "detail";
	}

	@GetMapping(value = "/qna.food")
	public String qna() {
		return "qna";
	}
	
	@GetMapping(value = "/intakeinfo.food")
	public String intake() {
		return "myintake";
	}

	@GetMapping(value = "/bestintakeinfo.food")
	public String bestintake() {
		return "bestintake";
	}

	@GetMapping(value = "/expectedintakeinfo.food")
	public String expectedintake() {
		return "expectedintake";
	}
	
	public void trendWord(String word) {
		boolean flag = true;

		for (Word w : trends) {
			if (w.word.equals(word)) {
				w.cnt++;
				flag = false;
				break;
			}
		}

		if (flag)	trends.add(new Word(word, 1));

		trends.sort(new Comparator<Word>() {
			@Override
			public int compare(Word o1, Word o2) {
				return Integer.compare(o2.cnt, o1.cnt);
			}
		});
	}

	public String findAllergy(String meterial) {
		StringBuilder sb = new StringBuilder();
		
		for (String a : allergy) {
			if(meterial.contains(a)) {
				sb.append(a).append("  ");
			}
		}
		return sb.toString();
	}

}
