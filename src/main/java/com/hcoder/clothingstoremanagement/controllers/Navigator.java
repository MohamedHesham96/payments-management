package com.hcoder.clothingstoremanagement.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class Navigator {

    @Autowired
    private HttpSession httpSession;

    @RequestMapping("/")
    public String userLogin() {

        return "login";
    }

    @RequestMapping("/logout")
    public String userLogout() {

        httpSession.removeAttribute("username");

        return "login";

    }

    @RequestMapping("/login")
    public String userLogin(@RequestParam("username") String username, @RequestParam("password") String password) {

        if (username.equals("mazen") && password.equals("mazen")) {

            httpSession.setAttribute("username", username);

            httpSession.setAttribute("passwrord", password);

            return "redirect:/today";

        } else {

            return "login";

        }

    }
}
