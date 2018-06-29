package com.broadcast.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.broadcast.myapp.dao.MemberDao;
import com.broadcast.myapp.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;
	
	public boolean login(String id, String pwd) {
		MemberVo memberVo = memberDao.getInfo(id);
		if(memberVo == null) {
			return false;
		}else {
			if(memberVo.getPwd().equals(pwd)) {
				return true;
			}else {
				return false;
			}
		}
	}
	
	public boolean idCheck(String id) {
		MemberVo memberVo = memberDao.getInfo(id);
		if(memberVo == null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int insert(MemberVo memberVo) {
		return memberDao.insert(memberVo);
	}
	
	public MemberVo getInfo(String id) {
		return memberDao.getInfo(id);
	}
	
	public int update(MemberVo memberVo) {
		return memberDao.update(memberVo);
	}
}
