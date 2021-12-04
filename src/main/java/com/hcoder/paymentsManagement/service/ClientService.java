package com.hcoder.paymentsManagement.service;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import org.springframework.data.domain.Page;

import java.util.List;

public interface ClientService {

    Page<Client> getClientsByPaymentDay(Integer paymentDay, Pagination pagination);

    List<Contract> getClientContracts(Integer clientId, Integer paymentDay);

    Page<Client> getClients(Pagination pagination);

    Client saveClient(Client client);

    void deleteClient(Integer clientId);

    Client getClient(Integer clientId);
}
