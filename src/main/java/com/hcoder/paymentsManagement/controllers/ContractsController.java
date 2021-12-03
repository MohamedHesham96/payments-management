package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/contracts")
public class ContractsController {

    @Autowired
    ContractService contractService;

    @GetMapping("/{contractId}")
    public ModelAndView getContract(@PathVariable Integer contractId) {
        ModelAndView contractsDetailsMV = new ModelAndView("contractDetails");
        Contract contract = contractService.getContract(contractId);
        contractsDetailsMV.addObject("contract", contract);
        return contractsDetailsMV;
    }
}
