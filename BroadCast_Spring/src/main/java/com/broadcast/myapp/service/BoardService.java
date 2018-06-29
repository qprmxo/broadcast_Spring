package com.broadcast.myapp.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.broadcast.myapp.dao.BoardDao;
import com.broadcast.myapp.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardDao dao;
	
	public int insert(BoardVo boardVo) {
		return dao.insert(boardVo);
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return dao.getList(map);
	}
	public BoardVo getInfo(int board_num) {
		return dao.getInfo(board_num);
	}
}
