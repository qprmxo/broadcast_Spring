package com.broadcast.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {

	@RequestMapping(value = "/{id}/boardList", method = RequestMethod.GET)
	public String boardList(@PathVariable(value="id") String id, int category_num) {
		
		return "";
	}
}
