package com.finalTotal.dinner.indiGroup.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class IndiGroupServiceImpl implements IndiGroupService{
	@Autowired
	private IndigroupDAO dao;
	
	@Override
	@Transactional
	public int createGroup(IndigroupVO vo) {
		return dao.createGroup(vo);
	}

	@Override
	public int checkGroupName(String name) {
		return dao.checkGroupName(name);
	}

	@Override
	public List<IndigroupVO> selectByGroupName(Map<String, Object> map) {
		return dao.selectByGroupName(map);
	}

	@Override
	public int regiGroup(GroupRegiVO vo) {
		return dao.regiGroup(vo);
	}

	@Override
	@Transactional
	public int insertGroupMember(GroupMemberVO vo) {
		int cnt= 0;
		try {
			cnt= dao.insertGroupMember(vo);
			System.out.println("그룹 멤버 vo="+ vo+ ", 가입 결과 : "+ cnt);
			if(cnt> 0) {
				GroupRegiVO vo2= new GroupRegiVO();
				vo2.setGroupNo(vo.getGroupNo());
				vo2.setMemNo(vo.getMemNo());
				cnt= dao.checkGroup(vo2);
				System.out.println("가입신청 여부 확인 : "+ cnt);
				if(cnt> 0) {
					cnt= dao.cancelGroup(vo2);
					System.out.println("가입신청 삭제 확인 : "+ cnt);
				}
			}
		}catch(RuntimeException e) {
			cnt= 0;
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public List<IndigroupVO> selectMyGroup(int memNo) {
		return dao.selectMyGroup(memNo);
	}

	@Override
	public int countNumberGroupMember(int groupNo) {
		return dao.countNumberGroupMember(groupNo);
	}

	@Override
	public int cancelGroup(GroupRegiVO vo) {
		return dao.cancelGroup(vo);
	}

	@Override
	public List<GroupMemberVO> showAllUser(int groupNo) {
		return dao.showAllUser(groupNo);
	}

	@Override
	public int updateUserNone(int memNo) {
		return dao.updateUserNone(memNo);
	}

	@Override
	public int updateUserExist(Map<String, Integer> map) {
		return dao.updateUserExist(map);
	}

	@Override
	public IndigroupVO selectByGNtoMN(int groupNo) {
		return dao.selectByGNtoMN(groupNo);
	}

	@Override
	public List<GroupRegiVO> selectRegiList(int groupNo) {
		return dao.selectRegiList(groupNo);
	}

	@Override
	public IndigroupVO selectByGroupNo(int groupNo) {
		return dao.selectByGroupNo(groupNo);
	}

	@Override
	@Transactional
	public int deleteGroupMember(GroupMemberVO vo) {
		int memNo= dao.isGroupTop(vo.getGroupNo());
		if(memNo== vo.getMemNo()) {
			dao.deleteGroup(vo.getGroupNo());
		}
		return dao.deleteGroupMember(vo);
	}

	@Override
	public List<IndigroupVO> allGroup(int memNo) {
		return dao.allGroup(memNo);
	}
	
	
}
