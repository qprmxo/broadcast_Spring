package com.broadcast.myapp;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.broadcast.myapp.service.MessageService;
import com.broadcast.myapp.vo.MessageVo;
import com.broadcast.util.PageUtil;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "/recvList", method = RequestMethod.GET)
	public String recvList(Model model, HttpServletRequest req, 
								@RequestParam(value="pageNum",defaultValue="1") int pageNum) {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = messageService.getRecvCount(id);
		PageUtil pu = new PageUtil(pageNum, 2, 5, totalRowCount);
		
		map.put("rid", id);
		map.put("startRow", pu.getStartRow());
		map.put("endRow", pu.getEndRow());
		
		List<MessageVo> list = messageService.getRecvList(map);
		
		model.addAttribute("pu", pu);
		model.addAttribute("list", list);
		
		return ".member.message.recvList";
	}
	
	@RequestMapping(value = "/sendList", method = RequestMethod.GET)
	public String sendList(Model model, HttpServletRequest req, 
								@RequestParam(value="pageNum",defaultValue="1") int pageNum) {
		
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id");
		List<MessageVo> list = messageService.getSendList(id);
		
		model.addAttribute("list", list);
		
		return ".member.message.sendList";
	}
	
	@RequestMapping(value = "/msgSend", method = RequestMethod.GET)
	public String msgSend() {
		return "member/message/msgSend";
	}
	
	@RequestMapping(value = "/msgSend", method = RequestMethod.POST)
	public String msgSend(Model model, String rid, String content, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String sid = (String)session.getAttribute("id");
		
		int n = messageService.sendMsg(new MessageVo(rid, sid, content));
		if(n>0) {
			req.setAttribute("result", "メッセージを発送しました。");
			return ".member.message.result";
		}else {
			req.setAttribute("result", "発送失敗");
			return ".member.message.result";
		}
	}
	
	@RequestMapping(value = "/msgDelete", method = RequestMethod.POST)
	public String msgDelete(int[] chk) {
		for(int i = 0; i<chk.length; i++) {
			messageService.msgDelete(chk[i]);
		}
		return "redirect:message";
	}
}
