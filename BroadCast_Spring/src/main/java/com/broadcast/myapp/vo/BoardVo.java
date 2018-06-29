package com.broadcast.myapp.vo;

import java.sql.Date;

public class BoardVo {

	private int board_num;
	private int category_num;
	private String id;
	private String title;
	private String content;
	private Date regdate;
	public BoardVo() {
		super();
	}
	public BoardVo(int category_num) {
		super();
		this.category_num = category_num;
	}
	public BoardVo(int category_num, String id, String title, String content) {
		super();
		this.category_num = category_num;
		this.id = id;
		this.title = title;
		this.content = content;
	}
	public BoardVo(int board_num, int category_num, String id, String title, String content, Date regdate) {
		super();
		this.board_num = board_num;
		this.category_num = category_num;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
}
