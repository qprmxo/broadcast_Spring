package com.broadcast.myapp;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.broadcast.myapp.service.BoardService;
import com.broadcast.myapp.service.CategoryService;
import com.broadcast.myapp.service.ProfileService;
import com.broadcast.myapp.vo.BoardVo;
import com.broadcast.myapp.vo.CategoryVo;
import com.broadcast.myapp.vo.ProfileVo;

@Controller
public class BoardController {

	@Autowired private BoardService boardService;
	@Autowired private ProfileService profileService;
	@Autowired private CategoryService categoryService;
	
	@RequestMapping(value = "/{id}/boardList", method = RequestMethod.GET)
	public String boardList(@PathVariable(value="id") String id, 
									@RequestParam(value="category_num", defaultValue="0") int category_num, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_num", category_num);
		List<BoardVo> boardList = boardService.getList(map);
		List<CategoryVo> categoryList = categoryService.getList(id);
		String category_name = null;
		
		if(category_num == 0) {
			category_name = "すべての書き込み";
		}else {
			for(int i=0; i<categoryList.size(); i++) {
				if(categoryList.get(i).getCategory_num() == category_num) {
					category_name = categoryList.get(i).getName();
				}
			}
		}
		
		ProfileVo profileVo = profileService.getInfo(id);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("profileVo", profileVo);
		model.addAttribute("category_num", category_num);
		model.addAttribute("category_name", category_name);
		model.addAttribute("categoryList", categoryList);
		return ".personnal.board.list";
	}
	
	@RequestMapping(value = "/{id}/boardSearch", method = RequestMethod.POST)
	public String search(@PathVariable(value="id") String id, String searchField, String search, 
								@RequestParam(value="category_num", defaultValue="0") int category_num, Model model) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("category_num", category_num);
		map.put("searchField", searchField);
		map.put("search", search);
		List<BoardVo> boardList = boardService.getList(map);
		ProfileVo profileVo = profileService.getInfo(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		String category_name = null;
		
		if(category_num == 0) {
			category_name = "すべての書き込み";
		}else {
			for(int i=0; i<categoryList.size(); i++) {
				if(categoryList.get(i).getCategory_num() == category_num) {
					category_name = categoryList.get(i).getName();
				}
			}
		}
		
		model.addAttribute("category_num", category_num);
		model.addAttribute("category_name", category_name);
		model.addAttribute("profileVo", profileVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardList", boardList);
		model.addAttribute("search", search);
		model.addAttribute("searchField", searchField);
		
		return ".personnal.board.list";
	}
	
	@RequestMapping(value = "/{id}/boardInsert", method = RequestMethod.GET)
	public String insert(@PathVariable(value="id") String id, Model model) {
		ProfileVo profileVo = profileService.getInfo(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		
		model.addAttribute("profileVo", profileVo);
		model.addAttribute("categoryList", categoryList);
		
		return ".personnal.board.insert";
	}
	
	@RequestMapping(value = "/{id}/boardInsert", method = RequestMethod.POST)
	public String insert(@PathVariable(value="id") String id, int category, String title, String content, Model model) {
		
		int n = boardService.insert(new BoardVo(category, id, title, content));
		if(n>0) {
			model.addAttribute("result", "書き込み完了！");
		}else {
			model.addAttribute("result", "書き込み失敗！");
		}
		model.addAttribute("category_num", category);
		return ".personnal.board.result";
	}
	
	@RequestMapping(value = "/{id}/boardDetail", method = RequestMethod.GET)
	public String detail(@PathVariable(value="id") String id, int board_num, Model model) {
		ProfileVo profileVo = profileService.getInfo(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		BoardVo boardVo = boardService.getInfo(board_num);
		String category_name = null;
		
		if(boardVo.getCategory_num() == 0) {
			category_name = "すべての書き込み";
		}else {
			for(int i=0; i<categoryList.size(); i++) {
				if(categoryList.get(i).getCategory_num() == boardVo.getCategory_num()) {
					category_name = categoryList.get(i).getName();
				}
			}
		}
		
		model.addAttribute("profileVo", profileVo);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("boardVo", boardVo);
		model.addAttribute("category_name", category_name);
		return ".personnal.board.detail";
	}
}
