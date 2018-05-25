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
	public List<MessageVo> getSendList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getSendList", map);
	}
	public int getRecvCount(String rid) {
		return sqlSession.selectOne(NAMESPACE + ".getRecvCount",rid);
	}
	public int getSendCount(String sid) {
		return sqlSession.selectOne(NAMESPACE + ".getSendCount", sid);
	}
	public MessageVo getInfo(int msg_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", msg_num);
	}
	
	
	public int msgSend(MessageVo vo) {
		return sqlSession.insert(NAMESPACE + ".msgSend", vo);
	}
	public int msgRecvDelete(int msg_num) {
		return sqlSession.update(NAMESPACE + ".msgRecvDelete", msg_num);
	}
	public int msgSendDelete(int msg_num) {
		return sqlSession.update(NAMESPACE + ".msgSendDelete", msg_num);
	}
	public int msgReadCheck(int msg_num) {
		return sqlSession.update(NAMESPACE + ".msgReadCheck", msg_num);
	}
}
