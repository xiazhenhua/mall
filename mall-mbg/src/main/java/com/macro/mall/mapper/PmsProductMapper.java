package com.macro.mall.mapper;

import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.PmsProductExample;
import com.macro.mall.model.PmsProductLadderVO;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PmsProductMapper {
    long countByExample(PmsProductExample example);

    int deleteByExample(PmsProductExample example);

    int deleteByPrimaryKey(Long id);

    int insert(PmsProduct record);

    int insertSelective(PmsProduct record);
    //获取新品列表
    List<PmsProduct> getNewProductList();
    //获取折扣商品列表
    List<PmsProductLadderVO> getDiscountProductList();
    //获取所有商品数量
    int getAllProductCount();
    //获取详细商品信息
    List<PmsProduct> getProductCategory(@Param("nextStartPage")int nextStartPage,@Param("v_pageSize") int v_pageSize);
    
    
    List<PmsProduct> selectByExampleWithBLOBs(PmsProductExample example);

    List<PmsProduct> selectByExample(PmsProductExample example);

    PmsProduct selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExampleWithBLOBs(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByExample(@Param("record") PmsProduct record, @Param("example") PmsProductExample example);

    int updateByPrimaryKeySelective(PmsProduct record);

    int updateByPrimaryKeyWithBLOBs(PmsProduct record);

    int updateByPrimaryKey(PmsProduct record);
}