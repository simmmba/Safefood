package com.safe.vo;

public class Board {
    // field 7개
    private String num, name, wdate, title, content;
    private int count;
    
    // getter, setter
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
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
    
    // 생성자-2개(default 생성자(parameter 0개), parameter 7개 생성자)
    public Board() { }
    public Board(String num,  String name, String wdate, String title, String content, int count) {
        this.num = num;
        this.name = name;
        this.wdate = wdate;
        this.title = title;
        this.content = content;
        this.count = count;
    }
    
    // toString()
    @Override
    public String toString() {
        return "Board [num=" + num  + ", name=" + name + ", wdate=" + wdate
                + ", title=" + title + ", content=" + content + ", count=" + count + "]";
    }
}
