package com.cacro.mall.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cacro.mall.shopping.service.IHomeService;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.model.PmsProduct;
@Service
public class HomeServiceImpl implements IHomeService{

	@Autowired
	private PmsProductMapper productMapper;
	@Override
	public List<PmsProduct> getNewProductList() {
		// TODO Auto-generated method stub
		return productMapper.getNewProductList();
	}
	
	
}
