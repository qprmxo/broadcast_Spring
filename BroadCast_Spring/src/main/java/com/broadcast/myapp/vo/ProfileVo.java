package com.broadcast.myapp.vo;

public class ProfileVo {

	private int profile_num;
	private String id;
	private String title;
	private String org_filename;
	private String save_filename;
	public ProfileVo() {
		super();
	}
	public ProfileVo(String id, String title) {
		super();
		this.id = id;
		this.title = title;
	}
	public ProfileVo(int profile_num, String id, String title, String org_filename, String save_filename) {
		super();
		this.profile_num = profile_num;
		this.id = id;
		this.title = title;
		this.org_filename = org_filename;
		this.save_filename = save_filename;
	}
	public ProfileVo(String id, String title, String org_filename, String save_filename) {
		super();
		this.id = id;
		this.title = title;
		this.org_filename = org_filename;
		this.save_filename = save_filename;
	}
	public int getProfile_num() {
		return profile_num;
	}
	public void setProfile_num(int profile_num) {
		this.profile_num = profile_num;
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
	public String getOrg_filename() {
		return org_filename;
	}
	public void setOrg_filename(String org_filename) {
		this.org_filename = org_filename;
	}
	public String getSave_filename() {
		return save_filename;
	}
	public void setSave_filename(String save_filename) {
		this.save_filename = save_filename;
	}
	
	
}
