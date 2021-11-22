package com.hcoder.paymentsManagement.service;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Client;
import org.springframework.data.domain.Page;

public interface ClientService {
    Page<Client> getClientsByPaymentDay(Integer paymentDay, Pagination pagination);
}
