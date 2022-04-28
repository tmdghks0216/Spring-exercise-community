package com.test.app.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.app.VO.BoardVO;

@Repository("boardDAO")
public class BoardDAO2 {
	
	
	@Autowired
	   private SqlSessionTemplate mybatis;
	
	public void insertBoard(BoardVO vo) {
		System.out.println("insertBoard() 호출됨");
		mybatis.insert("BoardDAO.BOARDINSERT",vo);
		
	}
	
	public void updateBoard(BoardVO vo) {
		mybatis.update("BoardDAO.BOARDUPDATE",vo);
	}
	public void deleteBoard(BoardVO vo) {
		mybatis.delete("BoardDAO.BoardDAO.BOARDDEL",vo);
	}
	
	
	public void viewupBoard(BoardVO vo) { 
		mybatis.update("BoardDAO.BOARDVIEWUPDATE",vo);
	}
	public void status_upBoard(BoardVO vo) { 
		mybatis.update("BoardDAO.BOARD_status_UPDATE",vo);
	}
	
	public List<BoardVO> getBoardListALL(){

		 return mybatis.selectList("BoardDAO.BOARD_SELECTALL");	
	}
	public List<BoardVO> getBoardListArea(BoardVO vo){

		return mybatis.selectList("BoardDAO.BOARD_SELECTALLbArea",vo);
		
	}
	public List<BoardVO> getBoardListevent(BoardVO vo){

		return mybatis.selectList("BoardDAO.BOARD_SELECTALL_event",vo);
		
	}
	public List<BoardVO> getBoardList_Area_catagory(BoardVO vo){
		
		return mybatis.selectList("BoardDAO.BOARD_SELECTONE_Category_BAREA",vo);
		
	}
	public List<BoardVO> getBoardList_Area_catagory_Condition(BoardVO vo){
		
		return mybatis.selectList("BoardDAO.BOARD_SELECTALL_Category_BAREA_CONDITION",vo);
		
	}
	public List<BoardVO> getBoardList_Area_catagory_Condition_event(BoardVO vo){
		
		return mybatis.selectList("BoardDAO.BOARD_SELECTALL_Category_BAREA_CONDITION_EVENT",vo);
		
	}
	public List<BoardVO> getBoardListmid(BoardVO vo){
		
		return mybatis.selectList("BoardDAO.BOARD_SELECTALL_MID",vo);
		
	}
	public BoardVO getBoardOne(BoardVO vo){
		
		return (BoardVO)mybatis.selectOne("BoardDAO.BOARD_SELECTONE",vo);
}
	public List<BoardVO> getBoardCategory(BoardVO vo){
		
		return mybatis.selectList("BoardDAO.BOARD_SELECTALL_Category",vo);
}
	
}
