package com.broadcast.myapp.vo;

public class MemberVo {

	private int m_num;
	private String id;
	private String pwd;
	private String name;
	
	public MemberVo() {}
	
	public MemberVo(int m_num, String id, String pwd, String name) {
		super();
		this.m_num = m_num;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}
	
	public MemberVo(String id, String pwd, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}

	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
}
