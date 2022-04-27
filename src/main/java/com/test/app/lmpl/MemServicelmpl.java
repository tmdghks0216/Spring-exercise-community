package com.test.app.lmpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.app.DAO.MemDAO;
import com.test.app.Service.MemService;
import com.test.app.VO.MemVO;

@Service("memService")
public class MemServicelmpl implements MemService{

	@Autowired
	private MemDAO memDAO;
		
	@Override
	public void insertMember(MemVO vo) {
		// TODO Auto-generated method stub
		memDAO.insertMember(vo);
	}

	@Override
	public void updateMember(MemVO vo) {
		// TODO Auto-generated method stub
		memDAO.updateMember(vo);
	}

	@Override
	public void deleteMember(MemVO vo) {
		// TODO Auto-generated method stub
		memDAO.deleteMember(vo);
	}



	@Override
	public MemVO loginMember(MemVO vo) {
		// TODO Auto-generated method stub
		return memDAO.loginMember(vo);
	}

	@Override
	public void report(MemVO vo) {
		// TODO Auto-generated method stub
		 memDAO.report(vo);
	}

	@Override
	public MemVO oneMember(MemVO vo) {
		// TODO Auto-generated method stub
		return memDAO.oneMember(vo);
	}

	@Override
	public void updatePWMember(MemVO vo) {
		// TODO Auto-generated method stub
		memDAO.updatePWMember(vo);
		
	}

	@Override
	public MemVO ck_member(MemVO vo) {
		// TODO Auto-generated method stub
		return memDAO.ck_member(vo);
	}

}
