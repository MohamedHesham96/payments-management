package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ResponseModal;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class BaseController {

    @Autowired
    ContractService contractService;

    @Autowired
    private HttpSession httpSession;

    @ExceptionHandler(MethodArgumentNotValidException.class)
    public @ResponseBody
    ResponseModal handleValidationExceptions(MethodArgumentNotValidException ex) {
        List<String> errors = new ArrayList<>();
        ex.getBindingResult().getAllErrors().forEach((error) -> {
            String errorMessage = error.getDefaultMessage();
            errors.add(errorMessage);
        });
        return new ResponseModal(false, errors.toString());
    }

    public void updateContractLatestPayedMonth() {
        Integer lateContractsDay5 = contractService.countLateMonthsContracts(5);
        Integer lateContractsDay10 = contractService.countLateMonthsContracts(10);
        Integer lateContractsDay15 = contractService.countLateMonthsContracts(15);
        Integer lateContractsDay20 = contractService.countLateMonthsContracts(20);
        Integer lateContractsDay25 = contractService.countLateMonthsContracts(25);
        Integer lateContractsDay30 = contractService.countLateMonthsContracts(30);
        Integer totalLateContracts = lateContractsDay5 + lateContractsDay10 + lateContractsDay15 + lateContractsDay20 + lateContractsDay25 + lateContractsDay30;
        httpSession.setAttribute("totalLateContracts", totalLateContracts);
    }
}
