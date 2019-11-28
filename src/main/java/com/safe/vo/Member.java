package com.safe.vo;

import java.io.Serializable;

public class Member implements Serializable{
	private String id, pass, name, address, callnum, allergy,authority;

	public Member() {
		
	}
	

	public Member(String id, String pass, String name, String address, String callnum, String allergy,
			String authority) {
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.address = address;
		this.callnum = callnum;
		this.allergy = allergy;
		this.authority = authority;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}

	public String getCallnum() {
		return callnum;
	}


	public void setCallnum(String callnum) {
		this.callnum = callnum;
	}


	public String getAllergy() {
		return allergy;
	}


	public void setAllergy(String allergy) {
		this.allergy = allergy;
	}
	
	

	public String getAuthority() {
		return authority;
	}


	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pass=" + pass + ", name=" + name + ", address=" + address + ", callnum="
				+ callnum + ", allergy=" + allergy + ", authority=" + authority + "]";
	}
}
