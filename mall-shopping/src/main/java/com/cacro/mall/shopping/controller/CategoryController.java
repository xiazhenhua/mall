package com.cacro.mall.shopping.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cacro.mall.shopping.model.CommonResult;
import com.cacro.mall.shopping.service.ICategoryService;
import com.cacro.mall.shopping.service.IUmsMemberService;
import com.macro.mall.model.PmsProduct;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/product")
public class CategoryController {
	// 目录列表
	@Autowired
	private ICategoryService categoryService;

	@Autowired
	private IUmsMemberService memberService;

	@ApiOperation("获取某个商品详情")
	@RequestMapping(value = "/productItem", method = RequestMethod.GET)
	@ResponseBody
	public Object getOneProduct(@RequestParam("productId") Long productId) {
		PmsProduct product = categoryService.getOneProduct(productId);
		if (product != null) {
			return new CommonResult().success(product);
		}
		return new CommonResult().failed();

	}
}
