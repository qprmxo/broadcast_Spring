package com.broadcast.myapp.vo;

import java.sql.Date;

public class MessageVo {

	private int msg_num;
	private String rid;
	private String sid;
	private String content;
	private int deletecheck;
	private Date regdate;
	
	public MessageVo() {}

	public MessageVo(int msg_num, String rid, String sid, String content, int deletecheck, Date regdate) {
		super();
		this.msg_num = msg_num;
		this.rid = rid;
		this.sid = sid;
		this.content = content;
		this.deletecheck = deletecheck;
		this.regdate = regdate;
	}
	public MessageVo(String rid, String sid, String content) {
		super();
		this.rid = rid;
		this.sid = sid;
		this.content = content;
	}

	public int getMsg_num() {
		return msg_num;
	}
	public void setMsg_num(int msg_num) {
		this.msg_num = msg_num;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getSid() {
		return sid;
	}
	public void setSid(String sid) {
		this.sid = sid;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getDeletecheck() {
		return deletecheck;
	}
	public void setDeletecheck(int deletecheck) {
		this.deletecheck = deletecheck;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
