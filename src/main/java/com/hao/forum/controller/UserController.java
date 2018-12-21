package com.hao.forum.controller;

import com.hao.forum.common.Msg;
import com.hao.forum.entity.User;
import com.hao.forum.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping(value = "/user/register",method = RequestMethod.POST)
    public ModelAndView register(User user){
        Msg msg=userService.doRegister(user);
        ModelAndView mav = new ModelAndView();
        if(msg.getCode()==100){
            mav.addObject("sucessMsg","注册成功");
            mav.setViewName("redirect:/login.jsp");
        }else{
            mav.addObject("errorMsg",msg.getMsg());
            mav.setViewName("forward:/register.jsp");
        }
        return mav;
    }

    @RequestMapping(value = "/user/login",method = RequestMethod.POST)
    public ModelAndView login(@RequestParam String userName,@RequestParam String passWord){
        Msg msg = userService.doLogin(userName,passWord);
        ModelAndView mav = new ModelAndView();
        if(msg.getCode()==100){
            mav.setViewName("redirect:/index");
        }else {
            mav.addObject("errorMsg",msg.getMsg());
            mav.setViewName("forward:/login.jsp");
        }
        return mav;
    }
    @RequestMapping("/user/logout")
    public Msg logout(){
        return userService.logout();
    }
    @RequestMapping(value = "/admin/user/lock",method = RequestMethod.POST)
    public Msg lockUser(@RequestParam String userName){
        return userService.doLockedUser(userName);
    }

    @RequestMapping(value = "/admin/user/unlock",method = RequestMethod.POST)
    public Msg unLockUser(@RequestParam String userName){
        return userService.doLockedUser(userName);
    }
}
