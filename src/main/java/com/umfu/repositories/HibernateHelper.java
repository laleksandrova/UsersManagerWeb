package com.umfu.repositories;

import com.umfu.configuration.ApplicationConfig;
import com.umfu.entities.User;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import java.util.Properties;

public class HibernateHelper {

    private static SessionFactory instance = null;

    public static SessionFactory getInstance(){
        if(instance == null){

            Configuration config = new Configuration();

            Properties configProperties = new Properties();
            configProperties.put("hibernate.connection.driver_class", ApplicationConfig.getInstance().getResource("hibernate.connection.driver_class"));
            configProperties.put("hibernate.connection.url", ApplicationConfig.getInstance().getResource("hibernate.connection.url"));
            configProperties.put("hibernate.connection.username", ApplicationConfig.getInstance().getResource("hibernate.connection.username"));
            configProperties.put("hibernate.connection.password", ApplicationConfig.getInstance().getResource("hibernate.connection.password"));
            configProperties.put("hibernate.dialect", ApplicationConfig.getInstance().getResource("hibernate.dialect"));
            configProperties.put("hibernate.current_session_context_class", ApplicationConfig.getInstance().getResource("hibernate.current_session_context_class"));

            config.addProperties(configProperties);
            config.addAnnotatedClass(User.class);

            instance = config.buildSessionFactory();
        }
        return instance;
    }


}
