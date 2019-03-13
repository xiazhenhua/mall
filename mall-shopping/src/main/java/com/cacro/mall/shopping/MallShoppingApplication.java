package com.cacro.mall.shopping;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.security.SecurityAutoConfiguration;

@SpringBootApplication(exclude = { SecurityAutoConfiguration.class })
@MapperScan({"com.macro.mall.mapper"})
public class MallShoppingApplication {
	public static void main(String[] args) {
        SpringApplication.run(MallShoppingApplication.class, args);
    }
}
