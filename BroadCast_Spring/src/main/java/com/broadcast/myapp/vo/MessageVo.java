package com.broadcast.myapp.vo;

import java.sql.Date;

public class MessageVo {

	private int msg_num;
	private String rid;
	private String sid;
	private String content;
	private int r_delete;
	private int s_delete;
	private int read_check;
	private Date regdate;
	
	public MessageVo() {}

	public MessageVo(int msg_num, String rid, String sid, String content, int r_delete, int s_delete, int read_check,
			Date regdate) {
		super();
		this.msg_num = msg_num;
		this.rid = rid;
		this.sid = sid;
		this.content = content;
		this.r_delete = r_delete;
		this.s_delete = s_delete;
		this.read_check = read_check;
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

	public int getR_delete() {
		return r_delete;
	}

	public void setR_delete(int r_delete) {
		this.r_delete = r_delete;
	}

	public int getS_delete() {
		return s_delete;
	}

	public void setS_delete(int s_delete) {
		this.s_delete = s_delete;
	}

	public int getRead_check() {
		return read_check;
	}

	public void setRead_check(int read_check) {
		this.read_check = read_check;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	
	
}
