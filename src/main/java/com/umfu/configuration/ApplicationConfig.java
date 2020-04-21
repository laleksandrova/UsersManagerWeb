package com.umfu.configuration;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.util.Properties;

public class ApplicationConfig {

    private static ApplicationConfig instance = null;

    public static ApplicationConfig getInstance(){
        if(instance == null){
            instance = new ApplicationConfig();
        }
        return instance;
    }

    private Properties configurationProperties;

    private ApplicationConfig(){

        Resource resource = new ClassPathResource("/application.properties");

        try{
            configurationProperties = PropertiesLoaderUtils.loadProperties(resource);

        }
        catch (Throwable ex){
            configurationProperties = new Properties();
        }
    }

    public String getResource(String key){
        return configurationProperties.getProperty(key);
    }

    public int getPagesCount(){
        return 10;
    }
}
