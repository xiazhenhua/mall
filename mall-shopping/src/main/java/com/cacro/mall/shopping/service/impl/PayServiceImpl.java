package com.cacro.mall.shopping.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alipay.api.AlipayApiException;
import com.cacro.mall.shopping.alipay.Alipay;
import com.cacro.mall.shopping.alipay.AlipayBean;
import com.cacro.mall.shopping.service.PayService;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private Alipay alipay;
	
	@Override
	public String aliPay(AlipayBean alipayBean) throws AlipayApiException {
		return alipay.pay(alipayBean);
	}

}
