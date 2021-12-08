package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ClientDTO;
import com.hcoder.paymentsManagement.DTO.ClientSearchDTO;
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

    @GetMapping("/{clientId}")
    public ModelAndView getClient(@PathVariable Integer clientId) {
        Client client = clientService.getClient(clientId);
        ModelAndView clientProfileMV = new ModelAndView("clientProfile");
        clientProfileMV.addObject("client", client);
        return clientProfileMV;
    }

    @GetMapping
    public ModelAndView getClients() {
        Pagination pagination = new Pagination(0, 10);
        ModelAndView paymentDayClientsMV = new ModelAndView("clients");
        Page<Client> clientsPage = clientService.getClients(pagination);
        paymentDayClientsMV.addObject("clients", clientsPage.getContent());
        paymentDayClientsMV.addObject("totalPages", clientsPage.getTotalPages());
        paymentDayClientsMV.addObject("pageSize", clientsPage.getPageable().getPageSize());
        paymentDayClientsMV.addObject("currentPage", clientsPage.getPageable().getPageNumber());
        return paymentDayClientsMV;
    }

    @PostMapping("/search/{page}/{size}")
    public ModelAndView getClients(@RequestBody ClientSearchDTO clientSearchDTO,
                                   @PathVariable Integer page,
                                   @PathVariable Integer size) {
        Pagination pagination = new Pagination(page, size);
        ModelAndView paymentDayClientsMV = new ModelAndView("clients/_clientsResult");
        Page<Client> clientsPage = clientService.searchInClients(clientSearchDTO, pagination);
        paymentDayClientsMV.addObject("clients", clientsPage.getContent());
        paymentDayClientsMV.addObject("totalPages", clientsPage.getTotalPages());
        paymentDayClientsMV.addObject("pageSize", clientsPage.getPageable().getPageSize());
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

    @DeleteMapping("/{clientId}")
    public @ResponseBody
    ResponseModal deleteClient(@PathVariable Integer clientId) {
        try {
            Client client = clientService.getClient(clientId);
            if (client == null) {
                return new ResponseModal(false, "العميل ليس موجود بالفعل");
            } else if (client.getContracts() != null && !client.getContracts().isEmpty()) {
                return new ResponseModal(false, "لا يمكن حذف العميل ,لديه عقود مسجلة");
            }
            clientService.deleteClient(clientId);
            return new ResponseModal(true, "تم حذف العميل بنجاح");
        } catch (Exception e) {
            return new ResponseModal(false, "حدث خطأ ,لم يتم حذف العميل");
        }
    }

    @GetMapping("/paymentDay/{paymentDay}")
    public ModelAndView getClientsByPaymentDay(@PathVariable Integer paymentDay) {
        ModelAndView paymentDayClientsMV = new ModelAndView("paymentDayClients");
        List<Client> clients = clientService.getClientsByPaymentDay(paymentDay);
        paymentDayClientsMV.addObject("clients", clients);
        paymentDayClientsMV.addObject("paymentDay", paymentDay);

        return paymentDayClientsMV;
    }

    @GetMapping("/{clientId}/contracts/paymentDay/{paymentDay}")
    public ModelAndView getClientsByPaymentDay(@PathVariable Integer clientId,
                                               @PathVariable Integer paymentDay) {
        ModelAndView paymentDayClientsMV = new ModelAndView("paymentDayContracts");
        Client client = clientService.getClient(clientId);
        if (client != null) {
            paymentDayClientsMV.addObject("clientName", client.getName());
        }
        List<Contract> contracts = clientService.getClientContracts(clientId, paymentDay);
        paymentDayClientsMV.addObject("contracts", contracts);
        return paymentDayClientsMV;
    }
}
