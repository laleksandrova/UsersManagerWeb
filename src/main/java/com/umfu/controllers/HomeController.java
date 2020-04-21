package com.umfu.controllers;

import com.umfu.services.AuthenticationService;
import com.umfu.viewmodels.home.LoginVM;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

    @RequestMapping(value = { "/", "/home/index" })
    public ModelAndView Index(){
        return new ModelAndView("/home/index");
    }

    @RequestMapping(value = "/home/login", method = RequestMethod.GET)
    public ModelAndView Login(){
        LoginVM model = new LoginVM();

        return new ModelAndView("/home/login", "model", model);
    }

    @RequestMapping(value = "/home/login", method = RequestMethod.POST)
    public ModelAndView Login(@ModelAttribute("model") LoginVM model){
        AuthenticationService.authenticate(model.getUsername(), model.getPassword());

        if(AuthenticationService.getLoggedUser() == null)
            return new ModelAndView("/home/login", "model", model);

        return new ModelAndView("redirect:/");
    }

    @RequestMapping(value = "/home/logout", method = RequestMethod.GET)
    public ModelAndView Logout(){
        AuthenticationService.logout();

        return new ModelAndView("redirect:/");
    }
}
