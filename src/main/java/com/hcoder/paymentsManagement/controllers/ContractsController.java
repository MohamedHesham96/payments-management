package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ClientPayDTO;
import com.hcoder.paymentsManagement.DTO.ContractDTO;
import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.DTO.ResponseModal;
import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.ClientPay;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.service.ClientPayService;
import com.hcoder.paymentsManagement.service.ClientService;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/contracts")
public class ContractsController extends BaseController {

    @Autowired
    ContractService contractService;

    @Autowired
    ClientPayService clientPayService;

    @Autowired
    ClientService clientService;


    @GetMapping
    public ModelAndView getContracts() {
        Pagination pagination = new Pagination(0, 10);
        ModelAndView contractsPageMV = new ModelAndView("contracts");
        Page<Contract> contractsPage = contractService.getContracts(pagination);
        contractsPageMV.addObject("contracts", contractsPage.getContent());
        contractsPageMV.addObject("total", contractsPage.getTotalPages());
        contractsPageMV.addObject("currentPage", contractsPage.getPageable().getPageNumber());
        contractsPageMV.addObject("clients", clientService.getAllClients());
        return contractsPageMV;
    }

    @PostMapping
    public @ResponseBody
    ResponseModal saveContract(@Valid @RequestBody ContractDTO contractDTO) {
        try {
            Contract contract = new Contract();
            contract.setClient(new Client(contractDTO.getClientId()));
            contract.setDeviceType(contractDTO.getDeviceType());
            contract.setSerialNumber(contractDTO.getSerialNumber());
            contract.setPayed(contractDTO.getPayed());
            contract.setRemain(contractDTO.getRemain());
            contract.setRemainAmount(contractDTO.getRemain());
            contract.setMonthlyInterest(contractDTO.getMonthlyInterest());
            contract.setPaymentDay(contractDTO.getPaymentDay());
            contract.setGuarantorName(contractDTO.getGuarantorName());
            contract.setGuarantorPhone(contractDTO.getGuarantorPhone());
            contract.setEnabled(true);
            contract.setCreationDate(LocalDateTime.now());
            contractService.saveContract(contract);
            return new ResponseModal(true, "تم حفظ العقد بنجاح");
        } catch (Exception e) {
            return new ResponseModal(false, "حدث حطأ,لم تم حفظ العقد");
        }
    }

    @GetMapping("/{contractId}")
    public ModelAndView getContract(@PathVariable Integer contractId) {
        ModelAndView contractsDetailsMV = new ModelAndView("contractDetails");
        Contract contract = contractService.getContract(contractId);
        contractsDetailsMV.addObject("contract", contract);
        return contractsDetailsMV;
    }

    @PostMapping("/{contractId}/clientPay")
    public @ResponseBody
    ResponseModal saveClientPay(@PathVariable Integer contractId, @RequestBody ClientPayDTO clientPayDTO) {
        try {
            Contract contract = contractService.getContract(contractId);
            if (contract == null) {
                return new ResponseModal(false, "هذالعقد غير موجود");
            } else if (contract.getRemainAmount() < clientPayDTO.getAmount()) {
                return new ResponseModal(false, "هذا المبلغ " + clientPayDTO.getAmount() + " اكثر من المبلغ المتبقي");
            }
            ClientPay clientPay = new ClientPay();
            clientPay.setContract(contract);
            clientPay.setAmount(clientPayDTO.getAmount());
            clientPay.setNote(clientPayDTO.getNote());
            clientPay.setDate(LocalDateTime.now());
            clientPayService.saveClientPay(clientPay);
            contract.setRemainAmount(contract.getRemainAmount() - clientPayDTO.getAmount());
            if (contract.getRemainAmount() == 0) {
                contract.setEnabled(false);
            }
            contractService.saveContract(contract);
            return new ResponseModal(true, "تم تحصيل المبلغ بنجاح");
        } catch (Exception e) {
            return new ResponseModal(false, "حدث حطأ,لم تم تحصيل المبلغ");
        }
    }
}
