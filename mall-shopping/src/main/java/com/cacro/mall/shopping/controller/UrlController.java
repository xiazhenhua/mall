package com.cacro.mall.shopping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/")
@SessionAttributes("user")
public class UrlController {
	@RequestMapping("/")
	public String gotoIndex() {
		return "login";
	}
	@RequestMapping("/login")
	public String gotologin() {
		return "login";
	}
	@RequestMapping("/goToReg")
	public String gotoReg() {
		return "register";
	}
	@RequestMapping("/goToIndex")
	public String goToIndex() {
		return "index";
	}
	@RequestMapping("/goToAccount")
	public String goToAccount(){
		return "account";
	}
	@RequestMapping("/getDashBoard")
	public String getDashBoard(){
		return "welcome";
	}
	@RequestMapping("/goToContact")
	public String goToContact(){
		return "contact";
	}
	@RequestMapping("/goToCart")
	public String goToCart(){
		return "cart";
	}
	@RequestMapping("/goToCategory")
	public String goToCategory(){
		return "category";
	}
	@RequestMapping("/goToSingle")
	public String goToSingle(){
		return "single";
	}
	@RequestMapping("/getProduct")
	public String getProduct(){
		return "product";
	}
}
