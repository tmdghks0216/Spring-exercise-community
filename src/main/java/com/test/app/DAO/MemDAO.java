package com.test.app.DAO;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.test.app.VO.MemVO;




@Repository
public class MemDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	private final String MEMBER_One="select * from member where mid=? ";
	private final String MEMBER_Login="select * from member where mid=? and password=?";
	private final String MEMBER_IDCK="select * from member where name=? and phone=?";
	private final String MEMBER_INSERT="insert into member(mid,password,name,phone,sex,Hope_Area) values(?,?,?,?,?,?)";
	private final String MEMBER_UPDATE="update member set password=?,phone=? where mid=?";
	private final String MEMBER_DELETE="delete member where mid=?";
	private final String MEMBER_REPORT="update member set report=report+1 where mid=?";
	private final String MEMBER_DELETE_Content="delete board where mid=?";
	private final String MEMBER_DELETE_Reply="delete reply where mid=?";
	private final String MEMBER_UPDATEPW="update member set password=? where mid=?";
	public MemVO loginMember(MemVO vo) {
		System.out.println("로그인 DAO접근");
		Object[] args= {vo.getMid(),vo.getPassword()};
		MemVO data=null;
		
		System.out.println(vo.getMid() +"    "+vo.getPassword());
		try {
		data= jdbcTemplate.queryForObject(MEMBER_Login,args, new MemberRowMapper());
		}catch (Exception e) {
			System.out.println(" 로그:  MemDAO 로그인 실패");
			System.out.println(e);
		}
		return data;
	}
	public MemVO ck_member(MemVO vo) {
		System.out.println("로그인 DAO접근");
		Object[] args= {vo.getName(),vo.getPhone()};
		MemVO data=null;
		
	                                                   
		try {
		data= jdbcTemplate.queryForObject(MEMBER_IDCK,args, new MemberRowMapper());
		}catch (Exception e) {
			System.out.println(" 로그:  MemDAO 로그인 실패");
			System.out.println(e);
		}
		return data;
	}

	
	
	
	
	public void report(MemVO vo) {
		
		Object[] args= {vo.getMid()};
		jdbcTemplate.update(MEMBER_REPORT,vo.getMid());
		vo= jdbcTemplate.queryForObject(MEMBER_One,args, new MemberRowMapper());
		if(vo.getReport()==4) {
			jdbcTemplate.update(MEMBER_DELETE_Content,vo.getMid());
			jdbcTemplate.update(MEMBER_DELETE_Reply,vo.getMid());
		}
	}
	public void insertMember(MemVO vo) {
		jdbcTemplate.update(MEMBER_INSERT,vo.getMid(),vo.getPassword(),vo.getName(),vo.getPhone(),vo.getSex(),vo.getHope_Area());
	}
	public void updateMember(MemVO vo) {
		jdbcTemplate.update(MEMBER_UPDATE,vo.getPassword(),vo.getPhone(),vo.getMid());
		
	}
	public void updatePWMember(MemVO vo) {
		jdbcTemplate.update(MEMBER_UPDATEPW,vo.getPassword(),vo.getMid());
		
	}
	public void deleteMember(MemVO vo) {
		jdbcTemplate.update(MEMBER_DELETE_Content,vo.getMid());
		jdbcTemplate.update(MEMBER_DELETE_Reply,vo.getMid());
		jdbcTemplate.update(MEMBER_DELETE,vo.getMid());
}
	public MemVO oneMember(MemVO vo) {
		Object[] args= {vo.getMid()};
		
		try {
			return jdbcTemplate.queryForObject(MEMBER_One,args, new MemberRowMapper());
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
}
	
}
class MemberRowMapper implements RowMapper<MemVO>{

	@Override
	public MemVO mapRow(ResultSet rs, int rowNum) throws SQLException {
		// TODO Auto-generated method stub
		MemVO data=new MemVO();
		data.setMid(rs.getString("mid"));
		data.setPassword(rs.getString("password"));
		data.setName(rs.getString("name"));
		data.setPhone(rs.getString("phone"));
		data.setHope_Area(rs.getString("hope_Area"));
		data.setSex(rs.getString("sex"));
		data.setReport(rs.getInt("report"));
	
		
		return data;
	}
	
}