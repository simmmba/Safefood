package com.safe.dao;

import java.util.List;

import com.safe.vo.Member;

public interface IMemberDao {
	public Member login(String id, String pass);
	public void join(Member member);
	public void delete(String id);
	public void update(String id, String Opass, String Npass, String address, String callnum, String allegy);
	public String newPass(String id, String name, String callnum);

}
