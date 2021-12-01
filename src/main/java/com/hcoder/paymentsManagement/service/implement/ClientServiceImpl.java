package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.repository.ClientRepository;
import com.hcoder.paymentsManagement.service.ClientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClientServiceImpl implements ClientService {

    @Autowired
    ClientRepository clientRepository;

    public Page<Client> getClientsByPaymentDay(Integer paymentDay, Pagination pagination) {

        Pageable pageable = PageRequest.of(pagination.getPage(), pagination.getSize());
        return clientRepository.getClientByPaymentDay(paymentDay, pageable);
    }

    @Override
    public List<Contract> getClientContracts(Integer clientId, Integer paymentDay) {
        return clientRepository.getClientContracts(clientId, paymentDay);
    }
}
