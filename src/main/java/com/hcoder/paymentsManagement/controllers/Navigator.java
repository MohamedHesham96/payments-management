package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
public class Navigator {

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private ContractService contractService;

    @RequestMapping("/")
    public ModelAndView userLogin() {
        return new ModelAndView("login");
    }

    @RequestMapping("/logout")
    public ModelAndView userLogout() {
        httpSession.removeAttribute("username");
        return new ModelAndView("login");
    }

    @RequestMapping("/login")
    public ModelAndView userLogin(@RequestParam("username") String username, @RequestParam("password") String password) {
        if (username.equals("admin") && password.equals("admin4m")) {
            httpSession.setAttribute("username", username);
            httpSession.setAttribute("passwrord", password);
            return goHomePage();
        } else {
            return new ModelAndView("login");
        }

    }

    @RequestMapping("/home")
    public ModelAndView goHomePage() {
        ModelAndView homeMV = new ModelAndView("homePage");
        homeMV.addObject("remainAmountDay0", contractService.sumPaymentDayRemainAmountTotal(0));
        homeMV.addObject("remainAmountDay5", contractService.sumPaymentDayRemainAmountTotal(5));
        homeMV.addObject("remainAmountDay10", contractService.sumPaymentDayRemainAmountTotal(10));
        homeMV.addObject("remainAmountDay15", contractService.sumPaymentDayRemainAmountTotal(15));
        homeMV.addObject("remainAmountDay20", contractService.sumPaymentDayRemainAmountTotal(20));
        homeMV.addObject("remainAmountDay25", contractService.sumPaymentDayRemainAmountTotal(25));
        homeMV.addObject("remainAmountDay30", contractService.sumPaymentDayRemainAmountTotal(30));
        return homeMV;
    }

}
