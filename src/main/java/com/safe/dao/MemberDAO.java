package com.safe.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.safe.vo.Member;


@Repository
public class MemberDAO implements IMemberDao {
	
	@Autowired
	SqlSession session;

	@Override
	public Member login(String id, String pass) {
		Map<String, String> m = new HashMap<String, String>();
		pass = encode(pass);
		m.put("id", id);
		m.put("pass", pass);
		return session.selectOne("member.selectLogin",m);
	}

	@Override
	public void join(Member m) {
		m.setPass(encode(m.getPass()));
		session.insert("member.insertJoin",m);

	}
	
	@Override
	public void update(String id, String Opass, String Npass, String address, String callnum, String allegy) {
		Map<String, String> m = new HashMap<>();
		m.put("id", id);
		m.put("Npass", encode(Npass));
		m.put("Opass", encode(Opass));
		m.put("address", address);
		m.put("callnum", callnum);
		m.put("allegy",allegy);
		
		session.update("member.update",m);
	}
	
	public void updatePass(String id, String newPass) {
//		Connection conn = null;
//		PreparedStatement pstat = null;
//		String query = "update member set pass = ?   where id=?";
//		
//		try {
//			conn = getConnection();
//			pstat = conn.prepareStatement(query);
//			
//			pstat.setString(1, newPass);
//			pstat.setString(2, id);
//			pstat.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		close(null, null, pstat, conn);
	}	



	@Override
	public void delete(String id) {
		session.delete("member.delete",id);
	}
	
	public String encode(String pass) {//암호화
		StringBuilder sb=new StringBuilder();
		int len=pass.length();
		for(int i=0;i<len;i++) {
			char c=pass.charAt(i);
			sb.append(Character.toString((char) (c-len)));
		}
		return sb.toString();
	}
	public String decode(String pass) {//복호화
		StringBuilder sb=new StringBuilder();
		int len=pass.length();
		for(int i=0;i<len;i++) {
			char c=pass.charAt(i);
			sb.append(Character.toString((char) (c+len)));
		}
		return sb.toString();
	}

	public String newPass(String id, String name, String callnum) {
		
		Map<String, String> m = new HashMap<>();
		String newPass = makePass();
		String encodePass =	encode(newPass);
		m.put("pass", encodePass);
		m.put("id", id);
		m.put("name", name);
		m.put("callnum", callnum);
		System.out.println("왜 실행이 안될까");
		int result = session.update("member.updatePass",m);
		if(result == 0) newPass = null;
		
		System.out.println(result);
		return newPass;
	}

	public String makePass() {
		StringBuilder sb=new StringBuilder();
		for(int i=0;i<6;i++) {
			sb.append((char)(Math.random()*26+97));
		}
		return sb.toString();
	}
}
