package com.safe.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.safe.dao.IMemberDao;
import com.safe.vo.Member;

public class MemberService implements IMemberService {
	@Autowired
	IMemberDao dao;
	
	@Override
	public Member login(String id, String pass) {
		return dao.login(id, pass);
	}

	@Override
	public void join(Member member) {
		dao.join(member);
	}

	@Override
	public void delete(String id) {
		dao.delete(id);
	}

	@Override
	public void update(String id, String Opass, String Npass, String address, String callnum, String allegy) {
		dao.update(id, Opass, Npass, address, callnum, allegy);
	}

	@Override
	public String newPass(String id, String name, String callnum) {
		return dao.newPass(id, name, callnum);
	}

}
