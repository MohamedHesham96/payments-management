package com.hcoder.paymentsManagement.controllers;

import com.hcoder.paymentsManagement.DTO.ResponseModal;
import com.hcoder.paymentsManagement.entities.ClientPay;
import com.hcoder.paymentsManagement.service.ClientPayService;
import com.hcoder.paymentsManagement.service.ClientService;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.time.LocalDate;

@Controller
@RequestMapping("/clientPays")
public class ClientPaysController extends BaseController {

    @Autowired
    ContractService contractService;

    @Autowired
    ClientPayService clientPayService;

    @Autowired
    ClientService clientService;

    @DeleteMapping("/{clientPayId}")
    public @ResponseBody
    ResponseModal deleteClientPay(@PathVariable Integer clientPayId) {
        try {
            ClientPay clientPay = clientPayService.getClientPay(clientPayId);
            if (clientPay == null) {
                return new ResponseModal(false, "هذا التحصيل ليس موجود بالفعل");
            } else if (clientPay.getDate().toLocalDate().isBefore(LocalDate.now())) {
                return new ResponseModal(false, "هذا التحصيل مر عليه اكثر من يوم");
            }
            clientPayService.deleteClientPay(clientPayId);
            return new ResponseModal(true, "تم حذف العقد بنجاح");
        } catch (Exception e) {
            return new ResponseModal(false, "حدث خطأ ,لم يتم حذف العقد");
        }
    }
}
