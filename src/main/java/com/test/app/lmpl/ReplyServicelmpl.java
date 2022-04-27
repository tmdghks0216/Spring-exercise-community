package com.test.app.lmpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.app.DAO.ReplyDAO;
import com.test.app.Service.ReplyService;

import com.test.app.VO.ReplyVO;

@Service("replyService")
public class ReplyServicelmpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;
	@Override
	public void insert_reply(ReplyVO vo) {
		// TODO Auto-generated method stub
		 replyDAO.insert_reply(vo);
		
	}

	@Override
	public void update_reply(ReplyVO vo) {
		// TODO Auto-generated method stub
		replyDAO.update_reply(vo);
	}

	@Override
	public void delete_reply(ReplyVO vo) {
		// TODO Auto-generated method stub
		replyDAO.delete_reply(vo);
	}

	@Override
	public List<ReplyVO> get_reply(ReplyVO vo) {
		// TODO Auto-generated method stub
		return replyDAO.get_reply(vo);
	}

	@Override
	public void delete_reply_bpk(ReplyVO vo) {
		// TODO Auto-generated method stub
		replyDAO.delete_reply_bpk(vo);
	}



}
