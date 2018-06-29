package com.broadcast.myapp.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.broadcast.myapp.vo.BoardVo;

@Repository
public class BoardDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "sqlmap.BoardMapper";

	public int insert(BoardVo boardVo) {
		return sqlSession.insert(NAMESPACE + ".insert", boardVo);
	}
	public List<BoardVo> getList(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".getList", map);
	}
	public BoardVo getInfo(int board_num) {
		return sqlSession.selectOne(NAMESPACE + ".getInfo", board_num);
	}
}
