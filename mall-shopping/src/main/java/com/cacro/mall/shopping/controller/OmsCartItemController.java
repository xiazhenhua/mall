package com.cacro.mall.shopping.controller;

import com.cacro.mall.shopping.model.CommonResult;
import com.cacro.mall.shopping.service.IOmsCartItemService;
import com.cacro.mall.shopping.service.IUmsMemberService;
import com.macro.mall.model.OmsCartItem;
import com.macro.mall.model.UmsMember;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

/**
 * 购物车管理Controller
 * Created by macro on 2018/8/2.
 */
@Controller
@Api(tags = "OmsCartItemController", description = "购物车管理")
@RequestMapping("/cart")
public class OmsCartItemController {
    @Autowired
    private IOmsCartItemService cartItemService;
    @Autowired
    private IUmsMemberService memberService;

    @ApiOperation("添加商品到购物车")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Object add(@RequestParam Long id,HttpSession session) {
    	OmsCartItem cartItem = new OmsCartItem();
    	String name = (String) session.getAttribute("user");
    	cartItem.setMemberNickname(name);
    	cartItem.setProductId(id);
//    	cartItem.set
        int count = cartItemService.add(cartItem);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }

    @ApiOperation("获取某个会员的购物车列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public Object list(HttpSession session) {
    	String name = (String) session.getAttribute("user");
        UmsMember member = memberService.getByUsername(name);
        List<OmsCartItem> cartItemList = cartItemService.list(member.getId());
        return new CommonResult().success(cartItemList);
    }

    @ApiOperation("获取某个会员的购物车列表,包括促销信息")
    @RequestMapping(value = "/list/promotion", method = RequestMethod.GET)
    @ResponseBody
    public Object listPromotion() {
//        List<CartPromotionItem> cartPromotionItemList = cartItemService.listPromotion(memberService.getCurrentMember().getId());
//        return new CommonResult().success(cartPromotionItemList);
    	return null;
    }

    @ApiOperation("修改购物车中某个商品的数量")
    @RequestMapping(value = "/update/quantity", method = RequestMethod.POST)
    @ResponseBody
    public Object updateQuantity(@RequestParam Long id,
                                 @RequestParam Integer quantity,HttpSession session) {
    	String name = (String) session.getAttribute("user");
        UmsMember member = memberService.getByUsername(name);
        int count;
        if (quantity.equals(0)) {
        	List<Long> ids = new ArrayList<>();
        	ids.add(id);
        	count = cartItemService.delete(member.getId(), ids);
		}else {
			count = cartItemService.updateQuantity(id,member.getId(),quantity);
		}
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }

    @ApiOperation("获取购物车中某个商品的规格,用于重选规格")
    @RequestMapping(value = "/getProduct/{productId}", method = RequestMethod.GET)
    @ResponseBody
    public Object getCartProduct(@PathVariable Long productId) {
//        CartProduct cartProduct = cartItemService.getCartProduct(productId);
//        return new CommonResult().success(cartProduct);
    	return null;
    }

    @ApiOperation("修改购物车中商品的规格")
    @RequestMapping(value = "/update/attr", method = RequestMethod.POST)
    @ResponseBody
    public Object updateAttr(@RequestBody OmsCartItem cartItem) {
        int count = cartItemService.updateAttr(cartItem);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }

    @ApiOperation("删除购物车中的某个商品")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(@RequestParam("ids") List<Long> ids,HttpSession session) {
    	String name = (String) session.getAttribute("user");
        UmsMember member = memberService.getByUsername(name);
        int count = cartItemService.delete(member.getId(),ids);
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }
    
    @ApiOperation("计算购物车总价")
    @RequestMapping(value = "/price", method = RequestMethod.POST)
    @ResponseBody
    public Double totalPrice(HttpSession session) {
    	String name = (String) session.getAttribute("user");
        UmsMember member = memberService.getByUsername(name);
        List<BigDecimal> priceList = cartItemService.totalPrice(member.getId());
		double c = 0.00;
        for (BigDecimal bigDecimal : priceList) {
        	c+=bigDecimal.doubleValue();
		}
        return c;
    }
    
    @ApiOperation("清空购物车")
    @RequestMapping(value = "/clear")
    @ResponseBody
    public Object clear(HttpSession session) {
    	String name = (String) session.getAttribute("user");
        UmsMember member = memberService.getByUsername(name);
        int count = cartItemService.clear(member.getId());
        if (count > 0) {
            return new CommonResult().success(count);
        }
        return new CommonResult().failed();
    }
}