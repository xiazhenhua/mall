package com.cacro.mall.shopping.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alipay.api.AlipayApiException;
import com.cacro.mall.shopping.alipay.AlipayBean;
import com.cacro.mall.shopping.service.PayService;
import com.cacro.mall.shopping.util.UUIDTools;

/**
 * 订单接口
 * 
 * @author Louis
 * @date Dec 12; 2018
 */
@RestController()
@RequestMapping("/alipay")
public class OrderController {

	@Autowired
	private PayService payService;

	/**
	 * 阿里支付
	 * @param tradeNo
	 * @param subject
	 * @param amount
	 * @param body
	 * @return
	 * @throws AlipayApiException
	 */
	@PostMapping(value = "/pay")
	public String alipay() throws AlipayApiException {
		AlipayBean alipayBean = new AlipayBean();
		String outTradeNo = UUIDTools.uuid(); 
		String subject ="一加"; 
		String totalAmount = "3599"; 
		String body = "红魔手机测试";
		alipayBean.setOut_trade_no(outTradeNo);
		alipayBean.setSubject(subject);
		alipayBean.setTotal_amount(totalAmount);
		alipayBean.setBody(body);
		return payService.aliPay(alipayBean);
	}
}
