package com.test.app.Service;


import com.test.app.VO.MemVO;

public interface MemService {
	public MemVO loginMember(MemVO vo);
	public void insertMember(MemVO vo);
	public void updateMember(MemVO vo);
	public void deleteMember(MemVO vo);
	public void report(MemVO vo);
	public MemVO oneMember(MemVO vo) ;
	public void updatePWMember(MemVO vo) ;
	public MemVO ck_member(MemVO vo);
	
}
