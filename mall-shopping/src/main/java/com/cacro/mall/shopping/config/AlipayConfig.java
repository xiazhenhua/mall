package com.cacro.mall.shopping.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016092600602822";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCcm4mHO36Tc6LnrvFWBdaQxpYZ3YIhKOWOVx9q1wMqQYBckwEd4vydjrlVqS0iu4korCaYLHhPLk5EPKEDu5So1YqWnY5pU4rzt7QIig3mgyp0ml8wr86iykZTJYUkM++hJ6ZKeErrZ7wTHRQLvnQmOTUP49J9FVs89hznxfo05nrDonvy1UZvbPMtb9LAMXcEG47QMwQT5p/AueQXuooP7HBVpVnhm70gcweusn8Vi088GYw4JdS8fIIGDQTOp9JRCJ2sFS9btfg58WaAX6MYbWIhaDL2UIaEY9XKO+2BOFxeGqFWCBgJDCGW9z0qtrsw2y8sA33E4aPrm50yqY2jAgMBAAECggEAYfH1BZr0AwxjajtDvOVR2KIa5npfFJYbW/apM4zd8eOdgEiAfkykaXYF+8ke7YYUtldUm//UDtGLKaoxmcALrbxAPQq1MrKJSPwvoNeW8gA+4UZbGnwZ5D5V1VK1/nps+IFvw0uQr8HlIp8hFmc7BVzqDtIRpyFgOrRCR8LORZ6V3BDb0Nq/qEJ+zlhcdMi44V0Fk0J7iWfVFfFEqYHZucWI1SrON0wl79+enDVhXfYMIu0qflEAH/QX6kyHAT45OkDNC8FhjERYVtgbNIw86xDSnc1CoJBKJsFwGsEOxHHs+41hfCoygml0LFwQJCXjTtzT5xAIRO+vKlHlJdwO4QKBgQDIgJ5SAdLgMwzEgr8D9vHXfIf0ux+zsscRDnSsJDTl5p7ECVg4uVspX5YeHyrfO/6SYaU0puPpAkZMdTqSoPh0jJFXSwjNmA5YWg+6+Q9+jWXf8lWoSQpeYa/J1ShDmd6g4iJ5lByHAbA1afH8Mla33jZE5jDHX2MbdB7MoMu6nwKBgQDH9JPw+D0H9Nx0A5wt6fgC/6Hy3q/wfuHCUzIXIZ/z+/BlQTYMlUm2lFVqGU+HJVOdGA3g06pPJ0ksDqiEOuSwe6DGo1AaOlY58wQCPX3zx+B5hf0g8A9m+Tv1/wND8GPXblBdD7gPXRNhiMgEfDjko5ztpWh9QST3+l3QckfSfQKBgFN7+m/7AmsH1pEcP5zO/fPTjmiAYbrY/bpEYqAqkzwGwqStn2Y/B446lq8EGz3IJT+eGMPLmaozoEHFrhXPoKQmw32taITyg0aWeWZIvgLbrUeKB9CCWSbjVeacMp+zOdeTUPd+jEJKmawj6PYxn5n/lGkrz7O0K/gKaaiaaznRAoGAbZY/1ptWZ5vtjq/D0u4d/Ra5XXBqoLYJaQVLuJ23GnMDx5q70p2nLqeRQHrquTjd4IUkZgnbl1ICqmDGPuJAH/FBplwvNJCwXUYw9kFZXFg5UKD8oCaxalBCaon+8ic3sQRGixpoWBM84gGjDcI/NB/vi9dRswQXDMlszSc08ckCgYAJQ9N5gou51fVHQS6mmc3wGAArviFICXNizPZosF4fsOHCChOROU62hpjOOvZRkBelbrbwseTwSCERWrNnfUyZVC1T6wkL7DlFcgxzdsR+9FWBlCLJOC0DoYBw1WEjzPrzL7kW2Mcl5WWl6sP9FM6i1vdM2or06eJ6bKBfD4BQOw==\r\n" + 
    		"";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAnJuJhzt+k3Oi567xVgXWkMaWGd2CISjljlcfatcDKkGAXJMBHeL8nY65VaktIruJKKwmmCx4Ty5ORDyhA7uUqNWKlp2OaVOK87e0CIoN5oMqdJpfMK/OospGUyWFJDPvoSemSnhK62e8Ex0UC750Jjk1D+PSfRVbPPYc58X6NOZ6w6J78tVGb2zzLW/SwDF3BBuO0DMEE+afwLnkF7qKD+xwVaVZ4Zu9IHMHrrJ/FYtPPBmMOCXUvHyCBg0EzqfSUQidrBUvW7X4OfFmgF+jGG1iIWgy9lCGhGPVyjvtgThcXhqhVggYCQwhlvc9Kra7MNsvLAN9xOGj65udMqmNowIDAQAB\r\n" + 
    		"";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

