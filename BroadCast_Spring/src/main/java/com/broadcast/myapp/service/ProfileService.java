package com.broadcast.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.broadcast.myapp.dao.ProfileDao;
import com.broadcast.myapp.vo.ProfileVo;

@Service
public class ProfileService {

	@Autowired
	private ProfileDao profileDao;
	
	public int insert(ProfileVo vo) {
		return profileDao.insert(vo);
	}
	
	public ProfileVo getInfo(String id) {
		return profileDao.getInfo(id);
	}
}
