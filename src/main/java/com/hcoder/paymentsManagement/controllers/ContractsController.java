package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.*;
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
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
        ModelAndView contractsPageMV = new ModelAndView("contracts");
        Pagination pagination = new Pagination(0, 10);
        Page<Contract> contractsPage = contractService.getContracts(pagination);
        contractsPageMV.addObject("contracts", contractsPage.getContent());
        contractsPageMV.addObject("totalPages", contractsPage.getTotalPages());
        contractsPageMV.addObject("pageSize", contractsPage.getPageable().getPageSize());
        contractsPageMV.addObject("currentPage", contractsPage.getPageable().getPageNumber());
        contractsPageMV.addObject("clients", clientService.getAllClients());
        return contractsPageMV;
    }

    @GetMapping("/search/{page}/{size}")
    public @ResponseBody
    ModelAndView getContracts(@PathVariable Integer page,
                              @PathVariable Integer size) {
        ModelAndView contractsPageMV = new ModelAndView("contracts/_contractsResult");
        Pagination pagination = new Pagination(page, size);
        Page<Contract> contractsPage = contractService.getContracts(pagination);
        contractsPageMV.addObject("contracts", contractsPage.getContent());
        contractsPageMV.addObject("totalPages", contractsPage.getTotalPages());
        contractsPageMV.addObject("pageSize", contractsPage.getPageable().getPageSize());
        contractsPageMV.addObject("currentPage", contractsPage.getPageable().getPageNumber());
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
            contract.setDevicePrice(contractDTO.getDevicePrice());
            Double devicePriceAfterInterest = contractDTO.getDevicePrice()
                    + contractDTO.getMonthsNumber()
                    * contractDTO.getMonthlyInterest();
            if (devicePriceAfterInterest < contractDTO.getPayed()) {
                return new ResponseModal(false, "???????????? ???????? ???? ?????? ????????????");
            }
            contract.setDevicePriceAfterInterest(devicePriceAfterInterest);
            contract.setPayed(contractDTO.getPayed());
            contract.setRemain(devicePriceAfterInterest - contractDTO.getPayed());
            contract.setRemainAmount(contract.getRemain());
            contract.setMonthsNumber(contractDTO.getMonthsNumber());
            contract.setMonthlyInterest(contractDTO.getMonthlyInterest());
            contract.setPaymentDay(contractDTO.getPaymentDay());
            contract.setGuarantorName(contractDTO.getGuarantorName());
            contract.setGuarantorPhone(contractDTO.getGuarantorPhone());
            contract.setEnabled(devicePriceAfterInterest != contractDTO.getPayed());
            contract.setCreationDate(LocalDateTime.now());
            contract.setLatestPayedMonth(LocalDate.now());
            contractService.saveContract(contract);
            return new ResponseModal(true, "???? ?????? ?????????? ??????????");
        } catch (Exception e) {
            return new ResponseModal(false, "?????? ??????,???? ???? ?????? ??????????");
        }
    }

    @GetMapping("/{contractId}")
    public ModelAndView getContract(@PathVariable Integer contractId) {
        ModelAndView contractsDetailsMV = new ModelAndView("contractDetails");
        Contract contract = contractService.getContract(contractId);
        List<LocalDate> paymentDates = new ArrayList<>();
        LocalDate contractCreationDate = contract.getCreationDate().toLocalDate();
        Integer contractPaymentDay = contract.getPaymentDay();
        paymentDates.add(contractCreationDate);
        if (contractCreationDate.getDayOfMonth() <= contractPaymentDay && contractPaymentDay != 0) {
            paymentDates.add(contractCreationDate.withDayOfMonth(contractPaymentDay));
        }
        if (contractPaymentDay != 0) {
            for (int i = 1; i < contract.getMonthsNumber(); i++) {
                paymentDates.add(contractCreationDate.plusMonths(i).withDayOfMonth(contractPaymentDay));
            }
        }

        contractsDetailsMV.addObject("contract", contract);
        contractsDetailsMV.addObject("paymentDates", paymentDates);
        return contractsDetailsMV;
    }

    @PostMapping("/{contractId}/clientPay")
    public @ResponseBody
    ResponseModal saveClientPay(@PathVariable Integer contractId, @RequestBody ClientPayDTO clientPayDTO) {
        try {
            Contract contract = contractService.getContract(contractId);
            if (contract == null) {
                return new ResponseModal(false, "?????????????? ?????? ??????????");
            } else if (contract.getRemainAmount() < clientPayDTO.getAmount()) {
                return new ResponseModal(false, "?????? ???????????? " + clientPayDTO.getAmount() + " ???????? ???? ???????????? ??????????????");
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
            return new ResponseModal(true, "???? ?????????? ???????????? ??????????");
        } catch (Exception e) {
            return new ResponseModal(false, "?????? ??????,???? ???? ?????????? ????????????");
        }
    }

    @DeleteMapping("/{contractId}")
    public @ResponseBody
    ResponseModal deleteContract(@PathVariable Integer contractId) {
        try {
            Contract contract = contractService.getContract(contractId);
            if (contract == null) {
                return new ResponseModal(false, "?????????? ?????? ?????????? ????????????");
            } else if (contract.getClientPays() != null && !contract.getClientPays().isEmpty()) {
                return new ResponseModal(false, "???? ???????? ?????? ?????????? ,???????? ?????????? ????????????");
            }
            contractService.deleteContract(contractId);
            return new ResponseModal(true, "???? ?????? ?????????? ??????????");
        } catch (Exception e) {
            return new ResponseModal(false, "?????? ?????? ,???? ?????? ?????? ??????????");
        }
    }

    @PostMapping("/{contractId}/latestPayedMonth")
    public @ResponseBody
    ResponseModal updateContractLatestPayedMonth(@PathVariable Integer contractId, @Valid @RequestBody ContractLatestPayedMonthDTO latestPayedMonthDTO) {
        try {
            Contract contract = contractService.getContract(contractId);
            if (contract == null) {
                return new ResponseModal(false, "?????????????? ?????? ??????????");
            } else if (latestPayedMonthDTO.getLatestPayedMonth() == null) {
                return new ResponseModal(false, "?????? ?????????? ?????????? ?????? ?????? ???? ????????");
            }
            String latestPayedMonthString = latestPayedMonthDTO.getLatestPayedMonth();
            LocalDate latestPayedMonthDate = LocalDate.parse(latestPayedMonthString);
            contract.setLatestPayedMonth(latestPayedMonthDate);
            contractService.saveContract(contract);
            updateContractLatestPayedMonth();
            return new ResponseModal(true, "???? ?????? ?????????? ??????????");
        } catch (Exception e) {
            return new ResponseModal(false, "?????? ??????,???? ???? ?????? ??????????");
        }
    }
}
