package com.hero.controller;

import com.hero.domain.Cust;
import com.hero.domain.User;
import com.hero.service.UserService;
import org.apache.ibatis.executor.ReuseExecutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("/findByNameAndPwd")
    public String findByNameAndPwd(User user,Model model){


        User user1 = userService.findByNameAndPwd(user);

        model.addAttribute("user1", user1);

        return "index";

    }

    @ResponseBody
    @RequestMapping("/findAllCust")
    public List<Cust> findAllCust() {

        List<Cust> list = userService.findAllCust();

        System.out.println("list="+list);

        return list;

    }


    @ResponseBody
    @RequestMapping("/addCust")
    public String addCust(@RequestBody Cust cust) {

        System.out.println("cust="+cust);
        int i = userService.addCust(cust);
        if (i>0){

            return "OK";
        }
        return "error!";
    }


    @RequestMapping("/deletdById")
    public void deletdById(int cid){

        System.out.println("cid="+cid);

    }


}



