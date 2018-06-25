package com.broadcast.myapp.vo;

public class CategoryVo {

	private int category_num;
	private String name;
	private String id;
	public CategoryVo() {
		super();
	}
	public CategoryVo(int category_num, String name, String id) {
		super();
		this.category_num = category_num;
		this.name = name;
		this.id = id;
	}
	public CategoryVo(String name, String id) {
		super();
		this.name = name;
		this.id = id;
	}
	public int getCategory_num() {
		return category_num;
	}
	public void setCategory_num(int category_num) {
		this.category_num = category_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
}
