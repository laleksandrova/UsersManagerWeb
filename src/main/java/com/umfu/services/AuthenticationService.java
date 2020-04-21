package com.umfu.services;

import com.umfu.entities.User;
import com.umfu.repositories.HibernateHelper;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.stream.Collectors;

public class AuthenticationService {

    private static HttpSession getSession(){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();

        return request.getSession();
    }

    public static User getLoggedUser(){

        User result = null;

        HttpSession session = getSession();

        if(session.getAttribute("loggedUser") != null)
            result = (User)session.getAttribute("loggedUser");

        return result;
    }

    public static void authenticate(String username, String password){
        HttpSession session = getSession();

        HibernateHelper.getInstance().getCurrentSession().beginTransaction();
        List<User> items = HibernateHelper.getInstance().getCurrentSession().createCriteria(User.class).list();
        List<User> users = items.stream().filter(u -> u.getUsername().equals(username) && u.getPassword().equals(password)).collect(Collectors.toList());
        HibernateHelper.getInstance().getCurrentSession().getTransaction().commit();

        User loggedUser = users.size() > 0 ? users.get(0) : null;

        session.setAttribute("loggedUser", loggedUser);
    }

    public static void logout(){

        HttpSession session = getSession();

        session.setAttribute("loggedUser", null);
    }
}
