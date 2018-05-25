package com.broadcast.myapp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.broadcast.myapp.service.ProfileService;
import com.broadcast.myapp.vo.ProfileVo;

@Controller
public class InfoController {
	
	@Autowired private ProfileService profileService;

	@RequestMapping(value = "/{id}/setting", method = RequestMethod.GET)
	public String info(@PathVariable(value="id") String id, Model model) {
		ProfileVo vo = profileService.getInfo(id);
		
		model.addAttribute("vo", vo);
		
		return ".personnal.info.profile";
	}
}
