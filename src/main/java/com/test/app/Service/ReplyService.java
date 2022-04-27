package com.test.app.Service;

import java.util.List;


import com.test.app.VO.ReplyVO;

public interface ReplyService {

	public void insert_reply(ReplyVO vo);
	public void update_reply(ReplyVO vo) ;
	public void delete_reply(ReplyVO vo) ;
	public List<ReplyVO> get_reply(ReplyVO vo);
	public void delete_reply_bpk(ReplyVO vo);
}
