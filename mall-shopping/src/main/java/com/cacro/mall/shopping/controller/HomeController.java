package com.cacro.mall.shopping.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cacro.mall.shopping.service.IHomeService;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductCategory;

import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping("/home")
public class HomeController {

	@Autowired
	private IHomeService homeService;
	
	@ApiOperation("获取首页商品分类")
    @RequestMapping(value = "/productCateList/{parentId}", method = RequestMethod.GET)
    @ResponseBody
    public Object getProductCateList(@PathVariable Long parentId) {
//        List<PmsProductCategory> productCategoryList = homeService.getProductCateList(parentId);
//        return new CommonResult().success(productCategoryList);
		return null;
    }
	
	@RequestMapping(value="/newProductList",method= RequestMethod.GET)
	@ResponseBody
	public List<PmsProduct> getNewProductList() {
		return homeService.getNewProductList();
	}
	
	
	
}
