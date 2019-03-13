package com.cacro.mall.shopping.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import com.cacro.mall.shopping.model.CommonResult;
import com.cacro.mall.shopping.model.MemberDetails;
import com.cacro.mall.shopping.service.RedisService;
import com.cacro.mall.shopping.service.IUmsMemberService;
import com.cacro.mall.shopping.util.MD5Util;
import com.macro.mall.mapper.UmsMemberMapper;
import com.macro.mall.model.UmsMember;
import com.macro.mall.model.UmsMemberExample;

@Service
public class UmsMemberServiceImpl implements IUmsMemberService {

	@Autowired
	private UmsMemberMapper memberMapper;
//	@Autowired
////	private PasswordEncoder passwordEncoder;
//	@Autowired
////	private RedisService redisService;
//	@Value("${redis.key.prefix.authCode}")
//	private String REDIS_KEY_PREFIX_AUTH_CODE;
//	@Value("${authCode.expire.seconds}")
//	private Long AUTH_CODE_EXPIRE_SECONDS;

	@Override
	public UmsMember login(String username, String password) {
		// TODO Auto-generated method stub
		if (memberMapper.selectByUsername(username) == null) {
			return null;
		}
		return memberMapper.loginMember(username, MD5Util.MD5EncodeUtf8(password));
	}

	@Override
	public int register(String username, String password, String telephone) {
		// TODO Auto-generated method stub
		if (memberMapper.selectByUsername(username) != null) {
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
	    public UmsMember getByUsername(String username) {
	        UmsMemberExample example = new UmsMemberExample();
	        example.createCriteria().andUsernameEqualTo(username);
	        List<UmsMember> memberList = memberMapper.selectByExample(example);
	        if (!CollectionUtils.isEmpty(memberList)) {
	            return memberList.get(0);
	        }
	        return null;
	    }

	    @Override
	    public UmsMember getById(Long id) {
	        return memberMapper.selectByPrimaryKey(id);
	    }

	    
	    @Override
	    public CommonResult generateAuthCode(String telephone) {
	        StringBuilder sb = new StringBuilder();
	        Random random = new Random();
	        for(int i=0;i<6;i++){
	            sb.append(random.nextInt(10));
	        }
	        //验证码绑定手机号并存储到redis
//	        redisService.set(REDIS_KEY_PREFIX_AUTH_CODE+telephone,sb.toString());
//	        redisService.expire(REDIS_KEY_PREFIX_AUTH_CODE+telephone,AUTH_CODE_EXPIRE_SECONDS);
	        return new CommonResult().success("获取验证码成功",sb.toString());
	    }

	    @Override
	    public CommonResult updatePassword(String telephone, String password, String authCode) {
	        UmsMemberExample example = new UmsMemberExample();
	        example.createCriteria().andPhoneEqualTo(telephone);
	        List<UmsMember> memberList = memberMapper.selectByExample(example);
	        if(CollectionUtils.isEmpty(memberList)){
	            return new CommonResult().failed("该账号不存在");
	        }
	        //验证验证码
	        if(!verifyAuthCode(authCode,telephone)){
	            return new CommonResult().failed("验证码错误");
	        }
	        UmsMember umsMember = memberList.get(0);
//	        umsMember.setPassword(passwordEncoder.encodePassword(password,null));
	        memberMapper.updateByPrimaryKeySelective(umsMember);
	        return new CommonResult().success("密码修改成功",null);
	    }

	    @Override
	    public UmsMember getCurrentMember() {
	        SecurityContext ctx = SecurityContextHolder.getContext();
	        Authentication auth = ctx.getAuthentication();
	        MemberDetails memberDetails = (MemberDetails) auth.getPrincipal();
	        return memberDetails.getUmsMember();
	    }

	    @Override
	    public void updateIntegration(Long id, Integer integration) {
	        UmsMember record=new UmsMember();
	        record.setId(id);
	        record.setIntegration(integration);
	        memberMapper.updateByPrimaryKeySelective(record);
	    }

	    //对输入的验证码进行校验
	    private boolean verifyAuthCode(String authCode, String telephone){
	        if(StringUtils.isEmpty(authCode)){
	            return false;
	        }
//	        String realAuthCode = redisService.get(REDIS_KEY_PREFIX_AUTH_CODE + telephone);
//	        return authCode.equals(realAuthCode);
	        return true;
	    }

}
