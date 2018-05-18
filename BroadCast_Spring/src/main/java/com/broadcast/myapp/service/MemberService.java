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
		MemberVo vo = memberDao.getInfo(id);
		if(vo == null) {
			return false;
		}else {
			if(vo.getPwd().equals(pwd)) {
				return true;
			}else {
				return false;
			}
		}
	}
	
	public boolean idCheck(String id) {
		MemberVo vo = memberDao.getInfo(id);
		if(vo == null) {
			return true;
		}else {
			return false;
		}
	}
	
	public int insert(MemberVo vo) {
		return memberDao.insert(vo);
	}
	
	public MemberVo getInfo(String id) {
		return memberDao.getInfo(id);
	}
	
	public int update(MemberVo vo) {
		return memberDao.update(vo);
	}
}
