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
	
	public List<MessageVo> getSendList(String sid){
		return messageDao.getSendList(sid);
	}
	
	public int getRecvCount(String rid) {
		return messageDao.getRecvCount(rid);
	}
	
	public int sendMsg(MessageVo vo) {
		return messageDao.msgSend(vo);
	}
	
	public int msgDelete(int msg_num) {
		return messageDao.msgDelete(msg_num);
	}
}
