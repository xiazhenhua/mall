package com.cacro.mall.shopping.component;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class WebSecurityConfig extends WebSecurityConfigurerAdapter{
	@Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        //解决authenticationManager无法注入
		return super.authenticationManagerBean();
    }
}
