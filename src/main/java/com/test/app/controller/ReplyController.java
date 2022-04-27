package com.test.app.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.test.app.Service.ReplyService;
import com.test.app.VO.ReplyVO;

@Controller 
public class ReplyController {

	@Autowired
	private ReplyService ReplyService;
	
	@RequestMapping(value ="replyup.do" )
	public String replyinsert(ReplyVO vo,Model model) {
		
		ReplyService.insert_reply(vo);
		return "detail.do";
		
	}
	@RequestMapping(value ="replydelete.do" )
	public String replydelete(ReplyVO vo,Model model) {
		System.out.println(vo);
		ReplyService.delete_reply(vo);
		return "detail.do";
		
	}
}
