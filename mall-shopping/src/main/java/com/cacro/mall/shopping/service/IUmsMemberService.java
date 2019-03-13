package com.cacro.mall.shopping.service;

import com.cacro.mall.shopping.model.CommonResult;
import com.macro.mall.model.UmsMember;
import org.springframework.transaction.annotation.Transactional;

/**
 * 会员管理Service
 * Created by macro on 2018/8/3.
 */
public interface IUmsMemberService {
	
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @return
	 */
	UmsMember login(String username,String password);

    /**
     * 用户注册
     */
	@Transactional
    int register(String username, String password, String telephone);


    /**
     * 根据用户名获取会员
     */
    UmsMember getByUsername(String username);

    /**
     * 根据会员编号获取会员
     */
    UmsMember getById(Long id);

    
    /**
     * 生成验证码
     */
    CommonResult generateAuthCode(String telephone);

    /**
     * 修改密码
     */
    @Transactional
    CommonResult updatePassword(String telephone, String password, String authCode);

    /**
     * 获取当前登录会员
     */
    UmsMember getCurrentMember();

    /**
     * 根据会员id修改会员积分
     */
    void updateIntegration(Long id,Integer integration);
}
