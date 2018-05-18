package com.broadcast.myapp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.broadcast.myapp.vo.MessageVo;

@Repository
public class MessageDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "sqlmap.MessageMapper";
	
	public List<MessageVo> getRecvList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getRecvList",map);
	}
	
	public List<MessageVo> getSendList(String sid){
		return sqlSession.selectList(NAMESPACE + ".getSendList", sid);
	}
	
	public int getRecvCount(String rid) {
		return sqlSession.selectOne(NAMESPACE + ".getRecvCount",rid);
	}
	
	public int msgSend(MessageVo vo) {
		return sqlSession.insert(NAMESPACE + ".msgSend", vo);
	}
	
	public int msgDelete(int msg_num) {
		return sqlSession.update(NAMESPACE + ".msgDelete", msg_num);
	}
}
