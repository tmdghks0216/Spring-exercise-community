package com.test.app.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.test.app.VO.ReplyVO;



@Repository("replyDAO")
public class ReplyDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	final String insert = "insert into reply(rpk,bpk,mid,msg) values((select NVL(max(rpk),0)+1 from reply),?,?,?)";
	final String selectall = "select * from reply where bpk=?   ORDER BY rdate  DESC";
	final String update = "update reply set msg=? where rpk=?";
	final String delete = "delete reply where rpk=? and bpk=?";
	final String deletebpk = "delete reply where bpk=?";
	
	
	public void insert_reply(ReplyVO vo) {
		System.out.println( vo);
		jdbcTemplate.update(insert,vo.getBpk(),vo.getMid(),vo.getMsg());
		System.out.println("댓글달기 성공!");
		
	}
	
	public void update_reply(ReplyVO vo) {
		jdbcTemplate.update(update,vo.getMsg(),vo.getRpk());
	}
	public void delete_reply(ReplyVO vo) {
		jdbcTemplate.update(delete,vo.getRpk(),vo.getBpk());
	}
	public void delete_reply_bpk(ReplyVO vo) {
		jdbcTemplate.update(delete,vo.getRpk(),vo.getBpk());
	}
	
public List<ReplyVO> get_reply(ReplyVO vo) {
	Object[] args= {vo.getBpk()};
		return jdbcTemplate.query(selectall,args,new RelplyRowMapper());
	}

	
	
}
class RelplyRowMapper implements RowMapper<ReplyVO>{

	@Override
	public ReplyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		ReplyVO data=new ReplyVO();
		data.setBpk(rs.getInt("bpk"));
		data.setRpk(rs.getInt("rpk"));
		data.setMid(rs.getNString("mid"));
		data.setMsg(rs.getNString("msg"));
		data.setRdate(rs.getDate("rdate"));
		return data;
	}
	
}
