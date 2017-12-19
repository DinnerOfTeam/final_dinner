package com.finalTotal.dinner.indiGroup.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class IndiGroupDAOImpl extends SqlSessionDaoSupport 
		implements IndigroupDAO {
	private String namespace="config.group";

	@Override
	public int createGroup(IndigroupVO vo) {
		return getSqlSession().insert(namespace+ ".createGroup", vo);
	}

	@Override
	public int checkGroupName(String name) {
		return getSqlSession().selectOne(namespace+ ".checkGroupName", name);
	}

	@Override
	public List<IndigroupVO> selectByGroupName(String name) {
		return getSqlSession().selectList(namespace+ ".selectByGroupName", name);
	}

	@Override
	public int regiGroup(GroupRegiVO vo) {
		return getSqlSession().insert(namespace+ ".regiGroup", vo);
	}

	@Override
	public int insertGroupMember(GroupMemberVO vo) {
		return getSqlSession().insert(namespace+ ".insertGroupMember", vo);
	}

	@Override
	public List<IndigroupVO> selectMyGroup(int memNo) {
		return getSqlSession().selectList(namespace+ ".selectMyGroup", memNo);
	}

	@Override
	public int countNumberGroupMember(int groupNo) {
		return getSqlSession().selectOne(namespace+ ".countNumberGroupMember", groupNo);
	}

	@Override
	public int cancelGroup(GroupRegiVO vo) {
		return getSqlSession().delete(namespace+ ".cancelGroup", vo);
	}

	@Override
	public int deleteGroupMember(GroupMemberVO vo) {
		return getSqlSession().delete(namespace+ ".deleteGroupMember", vo);
	}

	@Override
	public int checkGroup(GroupRegiVO vo) {
		return getSqlSession().selectOne(namespace+ ".checkGroup", vo);
	}

	@Override
	public List<GroupMemberVO> showAllUser(int groupNo) {
		return getSqlSession().selectList(namespace+ ".showAllUser", groupNo);
	}

	@Override
	public int updateUserNone(int memNo) {
		return getSqlSession().update(namespace+ ".updateUserNone", memNo);
	}

	@Override
	public int updateUserExist(Map<String, Integer> map) {
		return getSqlSession().update(namespace+ ".updateUserExist", map);
	}

	@Override
	public IndigroupVO selectByGNtoMN(int groupNo) {
		return getSqlSession().selectOne(namespace+ ".selectByGNtoMN", groupNo);
	}

	@Override
	public List<GroupRegiVO> selectRegiList(int groupNo) {
		return getSqlSession().selectList(namespace+ ".selectRegiList", groupNo);
	}

}
