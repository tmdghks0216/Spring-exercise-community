package com.test.app.DAO;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.app.VO.MemVO;

@Repository("MemDAO")
public class MemDAO2 {
	@Autowired
	   private SqlSessionTemplate mybatis;
	
	
	
	public MemVO loginMember(MemVO vo) {
		System.out.println("로그인 DAO접근");
		MemVO data=null;
		
		System.out.println(vo.getMid() +"    "+vo.getPassword());
		try {
		data= mybatis.selectOne("MemDAO.MEMBER_Login",vo);
		}catch (Exception e) {
			System.out.println(" 로그:  MemDAO 로그인 실패");
			System.out.println(e);
		}
		return data;
	}
	public MemVO ck_member(MemVO vo) {
		System.out.println("로그인 DAO접근");
		
		MemVO data=null;
		
	                                                   
		try {
		data=(MemVO) mybatis.selectOne("MemDAO.MEMBER_IDCK",vo);
		}catch (Exception e) {
			System.out.println(" 로그:  MemDAO 로그인 실패");
			System.out.println(e);
		}
		return data;
	}

	
	
	
	
	public void report(MemVO vo) {
		
	
		mybatis.update("MemDAO.MEMBER_REPORT",vo);
		vo=(MemVO) mybatis.selectOne("MemDAO.MEMBER_One",vo);
		if(vo.getReport()==4) {
			//게시물삭제
			mybatis.delete ("MemDAO.MEMBER_DELETE_Content",vo);
			//댓글삭제
			mybatis.delete("MemDAO.MEMBER_DELETE_Reply",vo.getMid());
		}
	}
	public void insertMember(MemVO vo) {
		mybatis.insert("MemDAO.MEMBER_INSERT",vo);
	}
	public void updateMember(MemVO vo) {
		mybatis.update("MemDAO.MEMBER_UPDATE",vo);
		
	}
	public void updatePWMember(MemVO vo) {
		mybatis.update("MemDAO.MEMBER_UPDATEPW",vo);
		
	}
	public void deleteMember(MemVO vo) {
		System.out.println(vo);
		mybatis.delete("MemDAO.MEMBER_DELETE_Content",vo);
		mybatis.delete("MemDAO.MEMBER_DELETE_Reply",vo);
		mybatis.delete("MemDAO.MEMBER_DELETE",vo);
}
	public MemVO oneMember(MemVO vo) {

		
		try {
			return (MemVO)mybatis.selectOne("MemDAO.MEMBER_One", vo);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
}
	
	
}
