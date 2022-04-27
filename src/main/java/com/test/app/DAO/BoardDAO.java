package com.test.app.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.test.app.VO.BoardVO;



@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	private String BOARDINSERT = "insert into board (bpk,bArea,bcategory,event,condition,bPhoto,title,mid,content,period,badrr) values((select nvl(max(bpk),0)+1 from board),?,?,?,?,?,?,?,?,?,?)";
	private String BOARDUPDATE = "update board set bArea=?,bcategory=?,bPhoto=?,condition=?,content=?,period=?,badrr=?,event=?,title=? where bpk=?";
	private String BOARDDEL="delete board where bpk=?";
	private String BOARD_SELECTALL="select * from board";
	private String BOARD_SELECTALL_MID="select * from board where mid=?";
	private String BOARD_SELECTALL_event="select * from board where event=?";
	private String BOARD_SELECTALLbArea="select * from board where bArea=?";
	private String BOARD_SELECTONE="select * from board where bpk=? ";
	private String BOARD_SELECTONE_Coategory="select * from board where Bcategory=? ";
	private String BOARD_SELECTONE_Coategory_BAREA="select * from board where Bcategory=? and bArea=? ";
	private String BOARD_SELECTONE_Coategory_BAREA_CONDITION="select * from board where Bcategory=? and bArea=? and condition=?";
	private String BOARD_SELECTONE_Coategory_BAREA_CONDITION_EVENT="select * from board where Bcategory=? and bArea=? and condition=? and event=?";
	private String BOARDVIEWUPDATE = "update board set views=views+1 where bpk=?";
	private String BOARD_status_UPDATE = "update board set status='모집완료' where bpk=?";
	public void insertBoard(BoardVO vo) {
		System.out.println("insertBoard() 호출됨");
		jdbcTemplate.update(BOARDINSERT,vo.getbArea(),vo.getBcategory(),vo.getEvent(),vo.getCondition(),vo.getbPhoto(),vo.getTitle(),vo.getMid(),vo.getContent(),vo.getPeriod(),vo.getBadrr());
		
	}
	
	public void updateBoard(BoardVO vo) {
		jdbcTemplate.update(BOARDUPDATE,vo.getbArea(),vo.getBcategory(),vo.getbPhoto(),vo.getCondition(),vo.getContent(),vo.getPeriod(),vo.getBadrr(),vo.getEvent(),vo.getTitle(),vo.getBpk());
	}
	public void deleteBoard(BoardVO vo) {
		jdbcTemplate.update(BOARDDEL,vo.getBpk());
	}
	
	
	public void viewupBoard(BoardVO vo) { 
		jdbcTemplate.update(BOARDVIEWUPDATE,vo.getBpk());
	}
	public void status_upBoard(BoardVO vo) { 
		jdbcTemplate.update(BOARD_status_UPDATE,vo.getBpk());
	}
	
	public List<BoardVO> getBoardListALL(){

		 return jdbcTemplate.query(BOARD_SELECTALL,new BoardRowMapper());	
	}
	public List<BoardVO> getBoardListArea(BoardVO vo){
		Object[] args= {vo.getbArea()};
		return jdbcTemplate.query(BOARD_SELECTALLbArea,args,new BoardRowMapper());
		
	}
	public List<BoardVO> getBoardListevent(BoardVO vo){
		Object[] args= {vo.getEvent()};
		System.out.println(vo);
		return jdbcTemplate.query(BOARD_SELECTALL_event,args,new BoardRowMapper());
		
	}
	public List<BoardVO> getBoardList_Area_catagory(BoardVO vo){
		Object[] args= {vo.getBcategory(),vo.getbArea()};
		return jdbcTemplate.query(BOARD_SELECTONE_Coategory_BAREA,args,new BoardRowMapper());
		
	}
	public List<BoardVO> getBoardList_Area_catagory_Condition(BoardVO vo){
		Object[] args= {vo.getBcategory(),vo.getbArea(),vo.getCondition()};
		return jdbcTemplate.query(BOARD_SELECTONE_Coategory_BAREA_CONDITION,args,new BoardRowMapper());
		
	}
	public List<BoardVO> getBoardList_Area_catagory_Condition_event(BoardVO vo){
		Object[] args= {vo.getBcategory(),vo.getbArea(),vo.getCondition(),vo.getEvent()};
		return jdbcTemplate.query(BOARD_SELECTONE_Coategory_BAREA_CONDITION_EVENT,args,new BoardRowMapper());
		
	}
	public List<BoardVO> getBoardListmid(BoardVO vo){
		Object[] args= {vo.getMid()};
		return jdbcTemplate.query(BOARD_SELECTALL_MID,args,new BoardRowMapper());
		
	}
	public BoardVO getBoardOne(BoardVO vo){
		Object[] args= {vo.getBpk()};
		return jdbcTemplate.queryForObject(BOARD_SELECTONE,args,new BoardRowMapper());
}
	public List<BoardVO> getBoardCategory(BoardVO vo){
		Object[] args= {vo.getBcategory()};
		return jdbcTemplate.query(BOARD_SELECTONE_Coategory,args,new BoardRowMapper());
}
	
	
}
class BoardRowMapper implements RowMapper<BoardVO> {

	@Override
	public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		BoardVO data=new BoardVO();
		data.setBpk(rs.getInt("bpk"));
		data.setbArea(rs.getString("bArea"));
		data.setEvent(rs.getNString("event"));
		data.setBcategory(rs.getString("bcategory"));
		data.setCondition(rs.getString("condition"));
		data.setbPhoto(rs.getString("bphoto"));
		data.setTitle(rs.getString("title"));
		data.setMid(rs.getString("mid"));
		data.setContent(rs.getString("content"));
		data.setBdate(rs.getDate("bdate"));
		data.setPeriod(rs.getNString("period"));
		data.setViews(rs.getInt("views"));
		data.setBadrr(rs.getString("badrr"));
		data.setStatus(rs.getNString("status"));
		return data;
	}
	
}
	

