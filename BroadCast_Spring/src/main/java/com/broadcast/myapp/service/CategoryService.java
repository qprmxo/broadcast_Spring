package com.broadcast.myapp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.broadcast.myapp.dao.CategoryDao;
import com.broadcast.myapp.vo.CategoryVo;

@Service
public class CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	public int insert(CategoryVo categoryVo) {
		return categoryDao.insert(categoryVo);
	}
	public int delete(int category_num) {
		return categoryDao.delete(category_num);
	}
	public List<CategoryVo> getList(String id) {
		return categoryDao.getList(id);
	}
	public int getNumber(CategoryVo categoryVo) {
		return categoryDao.getNumber(categoryVo);
	}
	public int updateIndex(CategoryVo categoryVo) {
		return categoryDao.updateIndex(categoryVo);
	}
}
