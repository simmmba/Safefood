package com.safe.vo;

public class Answer {
    // field 6개
    private String num, qnum, pass, name, wdate, content;
    
    // getter, setter
    public String getNum() {
        return num;
    }
    public void setNum(String num) {
        this.num = num;
    }
    public String getQnum() {
        return qnum;
    }
    public void setQnum(String qnum) {
        this.qnum = qnum;
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
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    
    // 생성자-2개(default 생성자(parameter 0개), parameter 7개 생성자)
    public Answer() { }
    public Answer(String num, String qnum, String pass, String name, String wdate, String content) {
        this.num = num;
        this.qnum = qnum;
        this.pass = pass;
        this.name = name;
        this.wdate = wdate;
        this.content = content;
    }
    
    // toString()
    @Override
    public String toString() {
        return "Board [num=" + num + ", qnum=" + qnum + ", pass=" + pass + ", name=" + name + ", wdate=" + wdate
                + ", content=" + content + "]";
    }
}
