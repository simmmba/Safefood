package com.safe.vo;

public class Intake {
    private String ino,idate,id,code, name;
    private int count;
	
    public Intake(String ino, String idate, String id, String code, String name, int count) {
		this.ino = ino;
		this.idate = idate;
		this.id = id;
		this.code = code;
		this.name = name;
		this.count = count;
	}
    
    
	public String getIno() {
		return ino;
	}


	public void setIno(String ino) {
		this.ino = ino;
	}


	public String getIdate() {
		return idate;
	}


	public void setIdate(String idate) {
		this.idate = idate;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	@Override
	public String toString() {
		return "Intake [ino=" + ino + ", idate=" + idate + ", id=" + id + ", code=" + code + ", name=" + name
				+ ", count=" + count + "]";
	}
    
    
    
    
}
