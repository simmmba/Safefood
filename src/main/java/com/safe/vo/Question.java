package com.safe.vo;

public class Question {

	private String num, pass, name, wdate, title, content;
    private int count, replycount;
	public Question(String num, String pass, String name, String wdate, String title, String content, int count,
			int replycount) {
		this.num = num;
		this.pass = pass;
		this.name = name;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.count = count;
		this.replycount = replycount;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReplycount() {
		return replycount;
	}
	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}
	@Override
	public String toString() {
		return "Question [num=" + num + ", pass=" + pass + ", name=" + name + ", wdate=" + wdate + ", title=" + title
				+ ", content=" + content + ", count=" + count + ", replycount=" + replycount + "]";
	}
	
    
 
}
