package com.cacro.mall.shopping.service;

import java.util.List;

import com.cacro.mall.shopping.model.Page;
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
	/**
	 * 获取所有商品的数量用于分页
	 * @return
	 */
	int getallNum();
	/**
	 * 获取所有商品详细
	 * @return
	 */
	public List<PmsProduct> getProductCategory(Page pager);
	
	String jumpCategory(Long brandId);
}
