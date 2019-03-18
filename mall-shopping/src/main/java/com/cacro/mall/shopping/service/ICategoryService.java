package com.cacro.mall.shopping.service;
/**
 * 商品管理Service
 * Created by pray on 2018/8/2.
 */

import com.macro.mall.model.PmsProduct;

public interface ICategoryService {
	/**
	 * 获取某商品的详情信息
	 * @param productId
	 * @return
	 */
	PmsProduct getOneProduct(Long productId);
}
