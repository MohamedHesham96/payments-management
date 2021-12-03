package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ClientDTO;
import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.DTO.ResponseModal;
import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.List;

@Controller
@RequestMapping("/clients")
public class ClientsController extends BaseController {

    @Autowired
    ClientService clientService;

    @GetMapping
    public ModelAndView getClients() {
        Pagination pagination = new Pagination(0, 10);
        ModelAndView paymentDayClientsMV = new ModelAndView("clients");
        Page<Client> clientsPage = clientService.getClients(pagination);
        paymentDayClientsMV.addObject("clients", clientsPage.getContent());
        paymentDayClientsMV.addObject("total", clientsPage.getTotalPages());
        paymentDayClientsMV.addObject("currentPage", clientsPage.getPageable().getPageNumber());
        return paymentDayClientsMV;
    }

    @PostMapping
    public @ResponseBody
    ResponseModal saveClient(@Valid @RequestBody ClientDTO clientDTO) {
        try {
            Client client = new Client();
            client.setName(clientDTO.getName());
            client.setPhone(clientDTO.getPhone());
            client.setCreationDate(LocalDateTime.now());
            clientService.saveClient(client);
            return new ResponseModal(true, "تم حفظ العميل بنجاح");
        } catch (Exception e) {
            return new ResponseModal(false, "حدث خطأ ,لم يتم حفظ العميل");
        }
    }

    @GetMapping("/{paymentDay}")
    public ModelAndView getClientsByPaymentDay(@PathVariable Integer paymentDay) {
        Pagination pagination = new Pagination(0, 10);
        ModelAndView paymentDayClientsMV = new ModelAndView("paymentDayClients");
        Page<Client> clientsPage = clientService.getClientsByPaymentDay(paymentDay, pagination);

        paymentDayClientsMV.addObject("clients", clientsPage.getContent());
        paymentDayClientsMV.addObject("total", clientsPage.getTotalPages());
        paymentDayClientsMV.addObject("currentPage", clientsPage.getPageable().getPageNumber());
        paymentDayClientsMV.addObject("paymentDay", paymentDay);

        return paymentDayClientsMV;
    }

    @GetMapping("/{clientId}/contracts/paymentDay/{paymentDay}")
    public ModelAndView getClientsByPaymentDay(@PathVariable Integer clientId,
                                               @PathVariable Integer paymentDay) {

        ModelAndView paymentDayClientsMV = new ModelAndView("contracts");
        List<Contract> contracts = clientService.getClientContracts(clientId, paymentDay);

        paymentDayClientsMV.addObject("contracts", contracts);

        return paymentDayClientsMV;
    }
}
