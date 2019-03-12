package com.cacro.mall.shopping.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.cacro.mall.shopping.model.Page;
import com.cacro.mall.shopping.service.IHomeService;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductLadderVO;

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
	@RequestMapping(value="/discountProductList",method= RequestMethod.GET)
	@ResponseBody
	public List<PmsProductLadderVO> getDiscountProductList() {
		return homeService.getDiscountProductList();
	}
	@RequestMapping(value="/brandList",method= RequestMethod.GET)
	@ResponseBody
	public List<PmsBrand> getBrandList() {
		return homeService.getBrandList();
	}
	@RequestMapping(value="/getOneBrandCategory",method= RequestMethod.GET)
	@ResponseBody
	public List<PmsBrand> getOneBrandCategory(Long brandId) {
		//没写完，点击轮播的图片跳转到筛选过的category上
		return homeService.getBrandList();
	}
	
	@RequestMapping(value="/getallNum",method= RequestMethod.GET)
	@ResponseBody
	public int getallNum() {
		return homeService.getallNum();
	}
	
	@RequestMapping(value="/getProductCategory",method= RequestMethod.GET)
	@ResponseBody
	public List<PmsProduct> getProductCategory(HttpServletRequest request) {
		String currentPage = request.getParameter("curpage") == null ? "0" : request.getParameter("curpage");
		String rows = request.getParameter("page_Size") == null ? "3" : request.getParameter("page_Size");
		Page pager = new Page(currentPage, rows);
		return homeService.getProductCategory(pager);
	}
	
	
}
