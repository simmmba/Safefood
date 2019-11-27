package com.safe.vo;

public class Reply {
	private String num, boardNum, name, wdate, content;

	public Reply(String num, String boardNum, String name, String wdate, String content) {
		this.num = num;
		this.boardNum = boardNum;
		this.name = name;
		this.wdate = wdate;
		this.content = content;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public String toString() {
		return "Reply [num=" + num + ", boardNum=" + boardNum + ", name=" + name + ", wdate=" + wdate + ", content="
				+ content + "]";
	}
	
	
	
}
