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
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQCajdgDl2RPyuI0cTPyjmt64XxEvo4eUStX/Aq/VnOb1Um5oD+Y7I1y2i6n6OuuiFFyZ5vk2P9gICT7YHfDFZW+iUIEA7/6CszoM2Fw0eId3d5tBPOb3PcO/vfi1XHCFjx8EJ+ovo4zhat7bRehOAY0+omETd5LSZowh8YJ2OYXLjvfLeuOP+15Ol9LTHfUI+K9bjuwHiT4WGYjZ220Y+/ei0s6pB04r/f3XWbQYbMNvNlusB2P4Fg6OR1+UrQjedZZ++oKRdkynN7PHRO7jdi2cMLd6rMtrwUfSCYmhMXIVWfQlMD+aGx2ZbI7Yh9j/ghvkzy7rcOqOvmGGLjBXrJ5AgMBAAECggEAVMECO33y6Xrlr0KA7TvCnwE2J3Cj+OYkMbyqnCCph0RgiKXjGlZmfxw8x6GIVQ62M1mz+Lwy1yDphtxw8I9Orc0RYag4x8LSeWdrwPWn3R8FUZ2MheWXqiaSA1dvabLN+m8XTu8ohgKAdk/tzGAvry/Q57fX9ktnfcOHC3FhREYhJ8mPRQGWimWv3OcfIP3nn9tO1NU5Zt2Tu5Pk2I5BGi+w0dCy8QuZ/ernaWB0hGc8kU61ZvCuAE0FQz0CcBnI2FcqGkbl5BODWnzbxvK5K0ToBliv25LbfWI8NSA46Xd/ZCaxg+ZjH3pOzhUv06FdrUTtITk8mLiaUyFZQ47EgQKBgQDKWHEG45SWWxL/E0hyq5b9a1pPlPDUQ9nvE6cTd+UKc1O+8SK+5mAXEzuyduqQt2igwl3iKVMlydAp15OG0s9PFsKkN/xf7tWuchGcqzWKyIvY+/EHYQWrKWRhqWzocynx4lqJVG8+AWUXMVIgi8P+9XwYvBoOdQSQLLYOMhG0sQKBgQDDiT15LlP8HoebsXOpWqIarpvBpqfW5BHjqRLJOfzUTki6pCTlpHW1nTbJaST54rxa+XhtuKN1F0GOep3itMRAJNQ8AKbbfl0Fn9ZcIeoNDShEr+4La0+gm0NxH5zXAJ1cgNmxjwjAqUpisTGYnwThtCPYdLjij7uFpsYjf2/sSQKBgEC/ejN1IXfXXsXGetlOtPsUngp3I3UY3STWihD9vYnRi4u/B5pEh5z6p5Cc4sQ6HD3M1FPpW1TtNjIdbHSpAnNRWilITPa5qyCuGZqjYnetYqqlO+RblH/Ht/pUR6g+Kb7f6o6lOQ+DTMDWJGyLrMTp8rLLhh74LOShmgQC242RAoGABpsOTpe4Ep5dam8WPzRmoYwgiuw8Y1AVIqHFlrK0zd9PKa796BwkNdx3y1oX+7EjN9eRr/M64mvEtTGDP/NnZdtYqCZFfMjKD7SUo0wqAgLdx2RCIHShngVgw+OTgtfseQGJWSxB2XBeqPLfgA5vNcjGJTvcOxsr9Jnru6tEdrECgYEAseqstwae8YM/c4JENJtatYPnjvcYmkdsbZ8k37+O5dVlXSMujLvyJGIu7SuR9XM2vSazxnABwwtXGXQBlzwAnFFTqHBf341jthbX4ev2HfqpJNGOZt09sPOJG0c/RN3TKdu2Rl14Wng8BNQckaGpU7psQA8zabvHS9A1jiQU3T8=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmo3YA5dkT8riNHEz8o5reuF8RL6OHlErV/wKv1Zzm9VJuaA/mOyNctoup+jrrohRcmeb5Nj/YCAk+2B3wxWVvolCBAO/+grM6DNhcNHiHd3ebQTzm9z3Dv734tVxwhY8fBCfqL6OM4Wre20XoTgGNPqJhE3eS0maMIfGCdjmFy473y3rjj/teTpfS0x31CPivW47sB4k+FhmI2dttGPv3otLOqQdOK/3911m0GGzDbzZbrAdj+BYOjkdflK0I3nWWfvqCkXZMpzezx0Tu43YtnDC3eqzLa8FH0gmJoTFyFVn0JTA/mhsdmWyO2IfY/4Ib5M8u63Dqjr5hhi4wV6yeQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://127.0.0.1/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://127.0.0.1:8081/paySuccessReturnPage";

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

