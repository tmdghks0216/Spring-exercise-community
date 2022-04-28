package com.test.app.DAO;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.app.VO.ReplyVO;

@Repository("ReplyDAO")
public class ReplyDAO2 {


	@Autowired
	   private SqlSessionTemplate mybatis;

	public void insert_reply(ReplyVO vo) {
		System.out.println( vo);
		mybatis.insert("replyDAO.replyinsert",vo);
		System.out.println("댓글달기 성공!");
		
	}
	

	public void delete_reply(ReplyVO vo) {
		mybatis.delete("replyDAO.replydelete",vo);
	}
	public void delete_reply_bpk(ReplyVO vo) {
		mybatis.delete("replyDAO.replydeletebpk",vo);
	}
	
public List<ReplyVO> get_reply(ReplyVO vo) {
	
		return mybatis.selectList("replyDAO.replyselectall",vo);
	}
}
