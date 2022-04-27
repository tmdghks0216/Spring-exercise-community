package com.test.app.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;


import com.test.app.Service.BoardService;
import com.test.app.Service.ReplyService;
import com.test.app.VO.BoardVO;

import com.test.app.VO.ReplyVO;



@Controller 
@SessionAttributes("data")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService ReplyService;
	//메인페이지
	@RequestMapping(value="/main.do")
	public String getBoardList(BoardVO vo,Model model,HttpSession session) throws ParseException {
		List<BoardVO> data=new ArrayList<BoardVO>() ;
		periodCk(boardService.getBoardListALL());
		if(vo.getEvent()!=null) {//메인페이지 운동종목 선택시 
			data=boardService.getBoardListevent(vo);
		
		}else {

			data=boardService.getBoardListALL();
			}
			model.addAttribute("bdata",data);
		
		return "main.jsp";
	}
	//게시물 상세페이지
	@RequestMapping(value="/detail.do")
	public String getBoard(BoardVO vo,ReplyVO rvo,Model model) {
		boardService.viewupBoard(vo);
		List<ReplyVO> datas=new ArrayList<ReplyVO>();
		datas=ReplyService.get_reply(rvo);
		System.out.println(datas);
		model.addAttribute("datas",datas);

		model.addAttribute("bdata",boardService.getBoardOne(vo));
		System.out.println(boardService.getBoardOne(vo));
		return "detail.jsp";

	}
	//게시물 목록보기
	@RequestMapping(value="/board.do")
	public String getBoardListCoategory(BoardVO vo,Model model,HttpServletRequest requset) throws ParseException {
		System.out.println(vo);
		String[] evantList = requset.getParameterValues("event");
		List<BoardVO> getdata=new ArrayList<BoardVO>();
		List<BoardVO> data=new ArrayList<BoardVO>();
		//정보 업데이트
		periodCk(boardService.getBoardListALL());
		//필터
		if(vo.getEvent()==null && vo.getbArea()==null && vo.getCondition()==null) {  //카테고리만 들어왔을때
			model.addAttribute("bdata",boardService.getBoardCategory(vo));
			
		}
		else if(vo.getEvent()==null && vo.getCondition().equals("상관없음")) {// 카테고리 & 지역
			
			model.addAttribute("bdata",boardService.getBoardList_Area_catagory(vo));
		}else if(vo.getEvent()==null ){ //카테고리 & 지역 & 성별조건
			model.addAttribute("bdata",boardService.getBoardList_Area_catagory_Condition(vo));
		}else if(evantList!=null){// 모든 조건이 들어있을떄
			for(String v : evantList ) {
				vo.setEvent(v);
				getdata= boardService.getBoardList_Area_catagory_Condition_event(vo) ;
				data.addAll(getdata);
			}
			model.addAttribute("bdata",data);
		}
		
	
		
		model.addAttribute("bcategory",vo.getBcategory());
		model.addAttribute("bArea",vo.getbArea());
		model.addAttribute("condition",vo.getCondition());
		model.addAttribute("evant",vo.getEvent());
		return "board.jsp";

	}
	//게시물삭제
	@RequestMapping(value="/dletboard.do")
	public String dletboard(BoardVO vo,Model model,HttpSession session,ReplyVO rvo) {
		System.out.println(vo);
		
		boardService.deleteBoard(vo);
		ReplyService.delete_reply(rvo);
		return "redirect:main.do";

	}
	//게시물 작성
	@RequestMapping(value="/boardinsert.do")
	public String insertboard(BoardVO vo,Model model ,HttpSession session) {
		System.out.println(vo);
		vo.setMid((String) session.getAttribute("id"));
		vo.setbPhoto(vo.getEvent()+".png");//운동 종목에 따라서 지정 사진 적용
		boardService.insertBoard(vo);
		return "redirect:main.do";

	}
	//게시물 업데이트 뷰
	@RequestMapping(value="/boardupdatview.do")
	public String updateboardview(BoardVO vo,Model model,HttpSession session) {
		System.out.println(vo);
		
		model.addAttribute("bdata",boardService.getBoardOne(vo));

		return "boardUpdate.jsp";

	}
	//게시물 업데이트
	@RequestMapping(value="/boardupdat.do")
	public String updateboard(BoardVO vo,Model model,HttpSession session) {
		System.out.println(vo);
		vo.setbPhoto(vo.getEvent()+".png");
		boardService.updateBoard(vo);
		return "redirect:main.do";

	}
	
	//데이터 상태 업데이트
	public void periodCk(List<BoardVO> list) throws ParseException {
		System.out.println("정보 업데이트");
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd ");
		 Date todaysDate = new Date();
		for(BoardVO vo : list) {
		Date date= formatter.parse( vo.getPeriod())	;  
			if(todaysDate.after(date)) {
				boardService.status_upBoard(vo);
			}
		}
			
	}
	
}