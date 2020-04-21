package com.umfu.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {

/*make authentication - no login, no manage users!*/

    @RequestMapping(value = { "/user", "/user/index" }, method = RequestMethod.GET)
    public ModelAndView Index(){
        return new ModelAndView("/user/index");
    }

    @RequestMapping(value = { "/user", "/user/edit" }, method = RequestMethod.GET)
    public ModelAndView Edit(){
        return new ModelAndView("/user/edit");
    }

    @RequestMapping(value = { "/user", "/user/edit" }, method = RequestMethod.POST)
    public ModelAndView EditSave()
    {
        return new ModelAndView("/user/edit");
    }
}
