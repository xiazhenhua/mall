package com.cacro.mall.shopping.service.impl;

import com.cacro.mall.shopping.service.IOmsCartItemService;
import com.cacro.mall.shopping.service.IUmsMemberService;
import com.macro.mall.mapper.OmsCartItemMapper;
import com.macro.mall.mapper.PmsProductMapper;
import com.macro.mall.model.OmsCartItem;
import com.macro.mall.model.OmsCartItemExample;
import com.macro.mall.model.PmsProduct;
import com.macro.mall.model.UmsMember;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * 购物车管理Service实现类
 * Created by macro on 2018/8/2.
 */
@Service
public class OmsCartItemServiceImpl implements IOmsCartItemService {
    @Autowired
    private OmsCartItemMapper cartItemMapper;
    @Autowired
    private PmsProductMapper pmsProductMapper;
//    @Autowired
//    private PortalProductDao productDao;
//    @Autowired
//    private OmsPromotionService promotionService;
    @Autowired
    private IUmsMemberService memberService;
    
    public String getUsername(HttpRequest request) {
		return null;
    	
    }
    @Override
    public int add(OmsCartItem cartItem) {
        int count;
        UmsMember currentMember =memberService.getByUsername(cartItem.getMemberNickname());
        cartItem.setMemberId(currentMember.getId());
        cartItem.setMemberNickname(currentMember.getNickname());
        cartItem.setDeleteStatus(0);
        OmsCartItem existCartItem = getCartItem(cartItem);
        Long id =cartItem.getProductId();
        PmsProduct pro = pmsProductMapper.selectByPrimaryKey(id);
        if (existCartItem == null) {
        	cartItem.setQuantity(1);
        	cartItem.setPrice(pro.getPrice());
        	cartItem.setProductName(pro.getName());
        	cartItem.setProductSubTitle(pro.getSubTitle());
        	cartItem.setProductCategoryId(pro.getProductCategoryId());
            cartItem.setCreateDate(new Date());
            count = cartItemMapper.insert(cartItem);
        } else {
        	existCartItem.setModifyDate(new Date());
            existCartItem.setQuantity(existCartItem.getQuantity() + 1);
            count = cartItemMapper.updateByPrimaryKeySelective(existCartItem);
        }
        return count;
    }

    /**
     * 根据会员id,商品id和规格获取购物车中商品
     */
    private OmsCartItem getCartItem(OmsCartItem cartItem) {
        OmsCartItemExample example = new OmsCartItemExample();
        OmsCartItemExample.Criteria criteria = example.createCriteria().andMemberIdEqualTo(cartItem.getMemberId())
                .andProductIdEqualTo(cartItem.getProductId()).andDeleteStatusEqualTo(0);
        if (!StringUtils.isEmpty(cartItem.getSp1())) {
            criteria.andSp1EqualTo(cartItem.getSp1());
        }
        if (!StringUtils.isEmpty(cartItem.getSp2())) {
            criteria.andSp2EqualTo(cartItem.getSp2());
        }
        if (!StringUtils.isEmpty(cartItem.getSp3())) {
            criteria.andSp3EqualTo(cartItem.getSp3());
        }
        List<OmsCartItem> cartItemList = cartItemMapper.selectByExample(example);
        if (!CollectionUtils.isEmpty(cartItemList)) {
            return cartItemList.get(0);
        }
        return null;
    }

    @Override
    public List<OmsCartItem> list(Long memberId) {
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andMemberIdEqualTo(memberId);
        return cartItemMapper.selectByExample(example);
    }

//    @Override
//    public List<CartPromotionItem> listPromotion(Long memberId) {
//        List<OmsCartItem> cartItemList = list(memberId);
//        List<CartPromotionItem> cartPromotionItemList = new ArrayList<>();
//        if(!CollectionUtils.isEmpty(cartItemList)){
//            cartPromotionItemList = promotionService.calcCartPromotion(cartItemList);
//        }
//        return cartPromotionItemList;
//    }

    @Override
    public int updateQuantity(Long id, Long memberId, Integer quantity) {
        OmsCartItem cartItem = new OmsCartItem();
        cartItem.setQuantity(quantity);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andDeleteStatusEqualTo(0)
                .andIdEqualTo(id).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(cartItem, example);
    }

    @Override
    public int delete(Long memberId, List<Long> ids) {
        OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andIdIn(ids).andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record, example);
    }

//    @Override
//    public CartProduct getCartProduct(Long productId) {
//        return productDao.getCartProduct(productId);
//    }

    @Override
    public int updateAttr(OmsCartItem cartItem) {
        //删除原购物车信息
        OmsCartItem updateCart = new OmsCartItem();
        updateCart.setId(cartItem.getId());
        updateCart.setModifyDate(new Date());
        updateCart.setDeleteStatus(1);
        cartItemMapper.updateByPrimaryKeySelective(updateCart);
        cartItem.setId(null);
        add(cartItem);
        return 1;
    }

    @Override
    public int clear(Long memberId) {
        OmsCartItem record = new OmsCartItem();
        record.setDeleteStatus(1);
        OmsCartItemExample example = new OmsCartItemExample();
        example.createCriteria().andMemberIdEqualTo(memberId);
        return cartItemMapper.updateByExampleSelective(record,example);
    }
}
