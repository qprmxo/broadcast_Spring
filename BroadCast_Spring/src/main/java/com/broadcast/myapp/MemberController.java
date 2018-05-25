package com.broadcast.myapp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.broadcast.myapp.service.MemberService;
import com.broadcast.myapp.service.ProfileService;
import com.broadcast.myapp.vo.MemberVo;
import com.broadcast.myapp.vo.ProfileVo;

@Controller
public class MemberController {
	
	@Autowired private MemberService memberService;
	@Autowired private ProfileService profileService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return ".main";
	}
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String main() {
		return ".main";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String personnal(@PathVariable(value="id") String id, HttpServletRequest req) {
		req.setAttribute("id", id);
		ProfileVo vo = profileService.getInfo(id);
		
		req.setAttribute("vo", vo);
		
		return ".personnal";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return ".member";
	}
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Model model, String id, String pwd, HttpServletRequest req) {
		if(memberService.login(id, pwd)) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			req.setAttribute("result", id + "様、歓迎します。");
			
			return ".main.result";
		}else {
			req.setAttribute("result", "会員情報がありません。");
			return ".member.result";
		}
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.invalidate();
		
		req.setAttribute("result", "ログアウトしました。");
		
		return ".main.result";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return ".member.join.join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(Model model, String id, String pwd, String name, HttpServletRequest req) {
		int n = memberService.insert(new MemberVo(id, pwd, name));
		if(n>0) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			profileService.insert(new ProfileVo(id, id + "様のページ"));
			
			req.setAttribute("result", "登録完了致しました。");
			
			return ".main.result";
		}else {
			req.setAttribute("result", "登録失敗しました。");
			
			return ".member.result";
		}		
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.POST)
	public String idCheck(String id) {
		if(memberService.idCheck(id)) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@RequestMapping(value = "/memberUpdate", method = RequestMethod.GET)
	public String memberInfo(Model model, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		MemberVo vo = memberService.getInfo(id);
		
		model.addAttribute("vo", vo);
		
		return ".member.join.update";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(String id, String pwd, String name, HttpServletRequest req) {
		int n = memberService.update(new MemberVo(id, pwd, name));
		if(n>0) {
			req.setAttribute("result", "更新完了致しました。");
			return ".main.result";
		}else {
			req.setAttribute("result", "更新失敗しました。");
			return ".member.result";
		}		
	}
}
