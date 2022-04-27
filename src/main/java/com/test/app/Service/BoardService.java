package com.test.app.Service;

import java.util.List;

import com.test.app.VO.BoardVO;


public interface BoardService {
	public void insertBoard(BoardVO vo);
	public void updateBoard(BoardVO vo);
	public void deleteBoard(BoardVO vo);
	public List<BoardVO> getBoardListALL();
	public List<BoardVO> getBoardListArea(BoardVO vo);
	public BoardVO getBoardOne(BoardVO vo);
	public List<BoardVO> getBoardCategory(BoardVO vo);
	public void viewupBoard(BoardVO vo);
	public List<BoardVO> getBoardListmid(BoardVO vo);
	public List<BoardVO> getBoardList_Area_catagory(BoardVO vo);
	public List<BoardVO> getBoardList_Area_catagory_Condition(BoardVO vo);
	public List<BoardVO> getBoardList_Area_catagory_Condition_event(BoardVO vo);
	public void status_upBoard(BoardVO vo);
	public List<BoardVO> getBoardListevent(BoardVO vo);
}
