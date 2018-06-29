package com.broadcast.myapp;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.broadcast.myapp.service.CategoryService;
import com.broadcast.myapp.service.ProfileService;
import com.broadcast.myapp.vo.CategoryVo;
import com.broadcast.myapp.vo.ProfileVo;

@Controller
public class InfoController {
	
	@Autowired private ProfileService profileService;
	@Autowired private CategoryService categoryService;

	@RequestMapping(value = "/{id}/setting", method = RequestMethod.GET)
	public String info(@PathVariable(value="id") String id, Model model) {
		ProfileVo profileVo = profileService.getInfo(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		
		model.addAttribute("id", id);
		model.addAttribute("categoryList", categoryList);
		model.addAttribute("profileVo", profileVo);
		
		return ".personnal.info.profile";
	}
	
	@RequestMapping(value = "/{id}/category", method = RequestMethod.GET)
	public String category(@PathVariable(value="id") String id, Model model) {
		ProfileVo profileVo = profileService.getInfo(id);
		List<CategoryVo> categoryList = categoryService.getList(id);
		
		model.addAttribute("id", id);
		model.addAttribute("profileVo", profileVo);
		model.addAttribute("categoryList", categoryList);
		return ".personnal.info.category";
	}
	
	
	@RequestMapping(value = "/{id}/category/insert", method = RequestMethod.POST)
	@ResponseBody
	public int categoryInsert(@PathVariable(value="id") String id, String name, int index_num, Model model) {
		int n = categoryService.insert(new CategoryVo(name, id, index_num));
		if(n>0) {
			int category_num = categoryService.getNumber(new CategoryVo(name, id));
			return category_num;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/category/delete", method = RequestMethod.POST)
	public int categoryDelete(int category_num, Model model) {
		int n = categoryService.delete(category_num);
		if(n>0) {
			return category_num;
		}else {
			return 0;
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/{id}/category/confirm", method = RequestMethod.POST)
	public String categoryConfirm(int category_num, int index_num) {
		int n = categoryService.updateIndex(new CategoryVo(category_num, index_num));
		if(n>0) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/{id}/setting/update", method = RequestMethod.POST)
	public String infoUpdate(@PathVariable(value="id") String id, String title, MultipartFile imgfile, Model model, HttpSession session) {
		ProfileVo profileVo = profileService.getInfo(id);
		
		String path = session.getServletContext().getRealPath("/resources/image");
		String orgfilename = imgfile.getOriginalFilename();
		String savefilename = UUID.randomUUID() + "_" + orgfilename;
		
		if(orgfilename == null || orgfilename.equals("")) {
			orgfilename = profileVo.getOrg_filename();
			savefilename = profileVo.getSave_filename();
		}else {
			try {
				new File(path + "//" + profileVo.getSave_filename()).delete();
				FileCopyUtils.copy(imgfile.getInputStream(), new FileOutputStream(path + "//" + savefilename));
				System.out.println(path + "//" + savefilename + "upload!!");
			}catch(IOException e) {
				e.printStackTrace();
				System.out.println(e.getMessage());
				model.addAttribute("result", "アップロードに失敗しました。");
				return ".personnal.info.result";
			}
		}
		int n = profileService.update(new ProfileVo(id, title, orgfilename, savefilename));
		if(n>0) {
			model.addAttribute("result", "プロフィール修正を成功しました！");
		}else {
			model.addAttribute("result", "プロフィール修正を失敗しました！");
		}
		return ".personnal.info.result";
	}
}
