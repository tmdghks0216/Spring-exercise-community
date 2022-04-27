package com.test.app.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.app.DAO.MemDAO;
import com.test.app.Service.BoardService;
import com.test.app.Service.MemService;
import com.test.app.VO.BoardVO;
import com.test.app.VO.MemVO;
import com.test.app.common.SNS;


@Controller 
public class memController {

	@Autowired
	private MemService memService;
	@Autowired
	private BoardService boardservice;
	
	
	
	@RequestMapping(value ="login.do" )
	public String login(MemVO vo,HttpSession session,HttpServletRequest request, HttpServletResponse response,Model model) throws IOException{
		System.out.println(vo);
		vo=memService.loginMember(vo);
		System.out.println(vo);
		if(vo==null) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 잘못되었습니다.");
			model.addAttribute("url", "login.jsp");
			return "alert.jsp";
		}
		if(vo.getReport()==4) {
			
			model.addAttribute("msg", "정지된 회원입니다.");
			model.addAttribute("url", "login.jsp");
			return "alert.jsp";
		}else {
		session.setAttribute("id",vo.getMid() );
		session.setAttribute("area",vo.getHope_Area() );
		session.setAttribute("sex",vo.getSex() );
		}
		return "redirect:main.do";
	}
	
	@RequestMapping(value ="logout.do" )
	public String logout(MemVO vo,HttpSession session){
		session.invalidate();
		
		return "redirect:main.do";
		
	}
	@RequestMapping(value ="report.do" )
	public String report(MemVO mvo,HttpSession session){
		memService.report(mvo);
	
		return "redirect:main.do";
		
	}
	@RequestMapping(value ="mypage.do" )
	public String mypage(MemVO mvo,HttpSession session,Model model,BoardVO bvo){
		mvo.setMid((String) session.getAttribute("id"));
		bvo.setMid((String) session.getAttribute("id"));
		System.out.println(mvo);
		model.addAttribute("data",memService.oneMember(mvo));
		model.addAttribute("bdata",boardservice.getBoardListmid(bvo));
	System.out.println(memService.oneMember(mvo));
		return "mypage.jsp";
		
	}
	@ResponseBody
	@RequestMapping(value ="/updatePw.do", method =   RequestMethod.POST , produces = "application/json; charset=utf-8" )
	public String pwUpdate(MemVO mvo,HttpSession session,Model model){
		mvo.setMid((String) session.getAttribute("id"));
		
		memService.updatePWMember(mvo);
		
		return "a";
	
	
		
	}
	@ResponseBody
	@RequestMapping(value ="/phoneck.do", method =   RequestMethod.POST , produces = "application/json; charset=utf-8" )
	public String phoneck(MemVO mvo,HttpSession session,Model model){
		System.out.println("문자 API 컨트롤러");
		System.out.println(mvo);
		int key=SNS.sns(mvo);
//	int key= (int)(Math.random() * (99999 - 10000 + 1)) + 10000;  //TEST용 API로 문자 안받고 콘솔로 보여줌
//		System.out.println(key);
//		if(key==1) {
//			return Integer.toString(key);
//		}else {
//			return  Integer.toString(key);
//		}
//	}
	if(key==1) {
		return "a";
	}else {
		return  Integer.toString(key);
	}
}
	@ResponseBody
	@RequestMapping(value ="/idck.do", method =   RequestMethod.POST , produces = "application/json; charset=utf-8" )
	public String idck(MemVO mvo,HttpSession session,Model model){
		System.out.println(mvo);
		if(memService.oneMember(mvo)==null) {
			return "true";
		}else {
			return "false";
		}
		
		
	}
	@ResponseBody
	@RequestMapping(value ="/memck.do", method =   RequestMethod.POST , produces = "application/json; charset=utf-8" )
	public String memck(MemVO mvo,HttpSession session,Model model){
		System.out.println("memck 컨트롤러");
		if(memService.ck_member(mvo)==null) {
			return "true";
		}else {
			return "false";
		}
		
		
	}
	@RequestMapping(value ="signUp.do" )
	public String signUp(MemVO mvo,HttpSession session,Model model){
System.out.println(mvo);
	memService.insertMember(mvo);
		return "main.do";
		
	}
	@RequestMapping(value ="deletmem.do" )
	public String deletmem(MemVO mvo,HttpSession session,Model model){

	memService.deleteMember(mvo);
	session.invalidate();
		return "redirect:main.do";
		
	}
	
}
