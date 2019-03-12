package com.cacro.mall.shopping.service;

import java.util.List;

import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductLadderVO;

public interface IHomeService {
	
	/**
	 * 获取首页新品商品列表
	 * @return
	 */
	List<PmsProduct> getNewProductList();
	/**
	 * 获取折扣商品
	 */
	List<PmsProductLadderVO> getDiscountProductList();
	/**
	 * 获取品牌列表
	 */
	List<PmsBrand> getBrandList();
	
	String jumpCategory(Long brandId);
}
