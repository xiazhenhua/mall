package com.cacro.mall.shopping.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cacro.mall.shopping.service.ICategoryService;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.model.PmsProduct;
@Service
public class CategoryServiceImpl implements ICategoryService{
	@Autowired
    private PmsProductMapper pmsProductMapper;
	/**
	 * 获取某商品详情页
	 */
	@Override
	public PmsProduct getOneProduct(Long productId) {
		return pmsProductMapper.selectByPrimaryKey(productId);
	}

}
