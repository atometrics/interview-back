package com.atometrics.interviewback.security;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.List;

@Getter
@Component
@ConfigurationProperties(prefix = "security")
public class SecurityProperties {


    private final Cors cors = new Cors();
    private final Csrf csrf = new Csrf();

    @Getter
    @Setter
    public static class Cors {
        private List<String> origins;
    }

    @Getter
    @Setter
    public static class Csrf {
        private String domain;
        private String samesite;

    }
}
