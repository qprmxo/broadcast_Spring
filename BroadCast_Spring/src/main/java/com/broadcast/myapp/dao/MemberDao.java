package com.broadcast.myapp.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.broadcast.myapp.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "sqlmap.MemberMapper";
	
	public MemberVo getInfo(String id) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", id);
	}
	
	public int insert(MemberVo vo) {
		return sqlSession.insert(NAMESPACE + ".insert",vo); 
	}
	
	public int update(MemberVo vo) {
		return sqlSession.update(NAMESPACE + ".update",vo);
	}
}
