package com.broadcast.myapp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.broadcast.myapp.dao.MessageDao;
import com.broadcast.myapp.vo.MessageVo;

@Service
public class MessageService {

	@Autowired
	private MessageDao messageDao;
	
	public List<MessageVo> getRecvList(HashMap<String, Object> map){
		return messageDao.getRecvList(map);
	}
	public List<MessageVo> getSendList(HashMap<String, Object> map){
		return messageDao.getSendList(map);
	}
	public int getRecvCount(String rid) {
		return messageDao.getRecvCount(rid);
	}
	public int getSendCount(String sid) {
		return messageDao.getSendCount(sid);
	}
	public MessageVo getInfo(int msg_num) {
		return messageDao.getInfo(msg_num);
	}
	
	
	public int sendMsg(MessageVo messageVo) {
		return messageDao.msgSend(messageVo);
	}
	public int msgRecvDelete(int msg_num) {
		return messageDao.msgRecvDelete(msg_num);
	}
	public int msgSendDelete(int msg_num) {
		return messageDao.msgSendDelete(msg_num);
	}
	public int msgReadCheck(int msg_num) {
		return messageDao.msgReadCheck(msg_num);
	}
}
