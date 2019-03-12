package com.cacro.mall.shopping.service;

import java.util.List;

import com.macro.mall.model.PmsProduct;

public interface IHomeService {
	
	/**
	 * 获取首页新品商品列表
	 * @return
	 */
	List<PmsProduct> getNewProductList();
}
