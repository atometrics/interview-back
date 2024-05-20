package com.atometrics.interviewback.security;

import java.util.List;

import org.apache.commons.collections4.CollectionUtils;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {


    private final SecurityProperties securityProperties;


    public WebSecurityConfig(final SecurityProperties securityProperties) {
        this.securityProperties = securityProperties;

    }


    @Bean
    public SecurityFilterChain filterChain(final HttpSecurity http) throws Exception {

        http
                .cors(cors -> {
                    UrlBasedCorsConfigurationSource configurationSource = new UrlBasedCorsConfigurationSource();
                    CorsConfiguration baseConfig = new CorsConfiguration();

                    List<String> origins = securityProperties.getCors().getOrigins();
                    if (CollectionUtils.isNotEmpty(origins)) {
                        origins.forEach(baseConfig::addAllowedOrigin);
                    }

                    baseConfig.addAllowedMethod(HttpMethod.GET);
                    baseConfig.addAllowedHeader("*");
                    baseConfig.setAllowCredentials(true);
                    configurationSource.registerCorsConfiguration("/**", baseConfig);
                    cors.configurationSource(configurationSource);
                });

        return http.build();
    }




}
