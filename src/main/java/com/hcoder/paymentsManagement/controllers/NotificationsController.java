package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/notifications")
public class NotificationsController extends BaseController {

    @Autowired
    private HttpSession httpSession;

    @Autowired
    private ContractService contractService;

    @GetMapping
    public ModelAndView goToNotifications() {
        ModelAndView notificationsMV = new ModelAndView("notifications");
        Integer lateContractsDay5 = contractService.countLateMonthsContracts(5);
        Integer lateContractsDay10 = contractService.countLateMonthsContracts(10);
        Integer lateContractsDay15 = contractService.countLateMonthsContracts(15);
        Integer lateContractsDay20 = contractService.countLateMonthsContracts(20);
        Integer lateContractsDay25 = contractService.countLateMonthsContracts(25);
        Integer lateContractsDay30 = contractService.countLateMonthsContracts(30);
        Integer totalLateContracts = lateContractsDay5 + lateContractsDay10 + lateContractsDay15 + lateContractsDay20 + lateContractsDay25 + lateContractsDay30;
        httpSession.setAttribute("totalLateContracts", totalLateContracts);
        notificationsMV.addObject("lateContractsDay5", lateContractsDay5);
        notificationsMV.addObject("lateContractsDay10", lateContractsDay10);
        notificationsMV.addObject("lateContractsDay15", lateContractsDay15);
        notificationsMV.addObject("lateContractsDay20", lateContractsDay20);
        notificationsMV.addObject("lateContractsDay25", lateContractsDay25);
        notificationsMV.addObject("lateContractsDay30", lateContractsDay30);
        return notificationsMV;
    }

    @GetMapping("/paymentDay/{paymentDay}/{page}/{size}")
    public ModelAndView searchInNotifications(@PathVariable Integer paymentDay,
                                              @PathVariable Integer page,
                                              @PathVariable Integer size) {
        ModelAndView notificationsMV = new ModelAndView("notifications/_contractsResult");
        Pagination pagination = new Pagination(page, size);
        Page<Contract> contractsPage = contractService.getLateMonthsContracts(paymentDay, pagination);
        notificationsMV.addObject("paymentDay", paymentDay);
        notificationsMV.addObject("contracts", contractsPage.getContent());
        notificationsMV.addObject("totalPages", contractsPage.getTotalPages());
        notificationsMV.addObject("pageSize", contractsPage.getPageable().getPageSize());
        notificationsMV.addObject("currentPage", contractsPage.getPageable().getPageNumber());
        return notificationsMV;
    }

}
