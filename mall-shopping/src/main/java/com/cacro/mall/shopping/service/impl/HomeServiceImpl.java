package com.cacro.mall.shopping.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cacro.mall.shopping.model.Page;
import com.cacro.mall.shopping.service.IHomeService;
import com.macro.mall.mapper.PmsBrandMapper;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.model.PmsBrand;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductLadderVO;
@Service
public class HomeServiceImpl implements IHomeService{

	@Autowired
	private PmsProductMapper productMapper;
	@Autowired
	private PmsBrandMapper brandMapper;
	@Override
	public List<PmsProduct> getNewProductList() {
		return productMapper.getNewProductList();
	}
	@Override
	public List<PmsProductLadderVO> getDiscountProductList() {
		return productMapper.getDiscountProductList();
	}
	@Override
	public List<PmsBrand> getBrandList() {
		// TODO Auto-generated method stub
		return brandMapper.getPmsBrandList();
	}
	@Override
	public String jumpCategory(Long brandId) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int getallNum() {
		// TODO Auto-generated method stub
		return productMapper.getAllProductCount();
	}
	@Override
	public List<PmsProduct> getProductCategory(Page pager) {
		return productMapper.getProductCategory(pager.getNextStartPage(), pager.getV_pageSize());
	}
	
	
}
