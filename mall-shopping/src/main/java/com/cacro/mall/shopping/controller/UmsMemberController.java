package com.cacro.mall.shopping.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cacro.mall.shopping.service.IUmsMemberService;
import com.macro.mall.model.UmsMember;

@RestController
public class UmsMemberController {
	
	@Autowired
	private IUmsMemberService umsMemberService;
	
	@PostMapping(value = "/login")
	@ResponseBody
	public String login(String username, String password,HttpSession session) {
		UmsMember member  = umsMemberService.login(username, password);
		if (member!=null) {
			session.setAttribute("user", member);
			return "ok";
		}
		return null;
	}
	@PostMapping(value="/goRegister")
	@ResponseBody
	public String register(String username,String password,String tel) {
		String str = "error";
		boolean flag = umsMemberService.register(username, password, tel)>0?true:false;
		if(flag) {
			str = "ok";
		}
		return str;
	}
	@RequestMapping("checkUsername")
	public String checkUsername(String username) throws IOException {
		String str = "noUse";
		boolean flag = umsMemberService.getByUsername(username)!=null?true:false;
		if(flag) {
			str = "hasUse";
		}
		return str;
	}
}
