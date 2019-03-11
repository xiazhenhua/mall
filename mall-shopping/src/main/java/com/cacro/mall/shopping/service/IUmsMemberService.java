package com.cacro.mall.shopping.service;

import org.springframework.transaction.annotation.Transactional;

import com.macro.mall.model.UmsMember;

public interface IUmsMemberService {
	/**
	 * 登录
	 * @param username
	 * @param password
	 * @return
	 */
	UmsMember login(String username,String password);
	 /**
     * 根据用户名获取会员
     */
    UmsMember getByUsername(String username);

    /**
     * 根据会员编号获取会员
     */
    UmsMember getById(Long id);

    /**
     * 用户注册
     */
    int register(String username, String password, String telephone);

    /**
     * 修改密码
     */
    @Transactional
    int updatePassword(String telephone, String password, String authCode);

    /**
     * 获取当前登录会员
     */
    UmsMember getCurrentMember();

    /**
     * 根据会员id修改会员积分
     */
    void updateIntegration(Long id,Integer integration);
}
