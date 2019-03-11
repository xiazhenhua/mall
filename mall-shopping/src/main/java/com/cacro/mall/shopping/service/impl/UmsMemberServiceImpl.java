package com.cacro.mall.shopping.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cacro.mall.shopping.service.IUmsMemberService;
import com.cacro.mall.shopping.util.MD5Util;
import com.macro.mall.mapper.UmsMemberMapper;
import com.macro.mall.model.UmsMember;
import com.mysql.fabric.xmlrpc.base.Member;

@Service
public class UmsMemberServiceImpl implements IUmsMemberService{

	@Autowired
    private UmsMemberMapper memberMapper;
	@Override
	public UmsMember login(String username, String password) {
		// TODO Auto-generated method stub
		if (memberMapper.selectByUsername(username)==null) {
			return null;
		}
		return memberMapper.loginMember(username,MD5Util.MD5EncodeUtf8(password));
	}

	@Override
	public UmsMember getByUsername(String username) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public UmsMember getById(Long id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int register(String username, String password, String telephone) {
		// TODO Auto-generated method stub
		if (memberMapper.selectByUsername(username)!=null) {
			return -1;
		}
		UmsMember member = new UmsMember();
		member.setUsername(username);
		member.setPassword(MD5Util.MD5EncodeUtf8(password));
		member.setMemberLevelId(4L);
		member.setPhone(telephone);
		member.setStatus(1);
		member.setCreateTime(new Date());
		return memberMapper.insertSelective(member);
	}

	@Override
	public int updatePassword(String telephone, String password, String authCode) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UmsMember getCurrentMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateIntegration(Long id, Integer integration) {
		// TODO Auto-generated method stub
		
	}

}
