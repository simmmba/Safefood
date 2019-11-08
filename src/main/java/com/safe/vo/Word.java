package com.safe.vo;

public class Word{
	public String word; 
	public int cnt;
	
	public Word(String word, int cnt){
		this.word = word;
		this.cnt = cnt;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	} 
}