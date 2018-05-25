package com.broadcast.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.broadcast.myapp.vo.ProfileVo;

@Repository
public class ProfileDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "sqlmap.ProfileMapper";
	
	public int insert(ProfileVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert", vo);
	}
	
	public ProfileVo getInfo(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", id);
	}
}
