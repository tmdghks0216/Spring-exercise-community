package com.test.app.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.app.DAO.BoardDAO;
import com.test.app.Service.BoardService;
import com.test.app.VO.BoardVO;


@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Autowired // DI
	private BoardDAO boardDAO;
	
	@Override
	public void insertBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.deleteBoard(vo);
	}
	@Override
	public List<BoardVO> getBoardListALL()  {
		// TODO Auto-generated method stub
	return	boardDAO.getBoardListALL();
	}

	@Override
	public List<BoardVO> getBoardListArea(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardListArea(vo);
	}

	@Override
	public BoardVO getBoardOne(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardOne(vo);
	}

	@Override
	public List<BoardVO> getBoardCategory(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardCategory(vo);
	}

	@Override
	public void viewupBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.viewupBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardListmid(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardListmid(vo);
	}

	@Override
	public List<BoardVO> getBoardList_Area_catagory(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList_Area_catagory(vo);
	}

	@Override
	public List<BoardVO> getBoardList_Area_catagory_Condition(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList_Area_catagory_Condition(vo);
	}

	@Override
	public List<BoardVO> getBoardList_Area_catagory_Condition_event(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList_Area_catagory_Condition_event(vo);
	}

	@Override
	public void status_upBoard(BoardVO vo) {
		// TODO Auto-generated method stub
		boardDAO.status_upBoard(vo);
	}

	@Override
	public List<BoardVO> getBoardListevent(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardListevent(vo);
	}
	
}
