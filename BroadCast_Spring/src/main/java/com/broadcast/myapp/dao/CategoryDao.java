package com.broadcast.myapp.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.broadcast.myapp.vo.CategoryVo;

@Repository
public class CategoryDao {

	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE = "sqlmap.CategoryMapper";
	
	public int insert(CategoryVo categoryVo) {
		return sqlSession.insert(NAMESPACE + ".insert", categoryVo);
	}
	public int delete(int category_num) {
		return sqlSession.delete(NAMESPACE + ".delete", category_num);
	}
	public List<CategoryVo> getList(String id) {
		return sqlSession.selectList(NAMESPACE + ".getList", id);
	}
	public int getNumber(CategoryVo categoryVo) {
		return sqlSession.selectOne(NAMESPACE + ".getNumber",categoryVo);
	}
	public int updateIndex(CategoryVo categoryVo) {
		return sqlSession.update(NAMESPACE + ".updateIndex", categoryVo);
	}
}
