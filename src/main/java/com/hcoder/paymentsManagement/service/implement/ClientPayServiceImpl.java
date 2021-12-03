package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.entities.ClientPay;
import com.hcoder.paymentsManagement.repository.ClientPayRepository;
import com.hcoder.paymentsManagement.service.ClientPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ClientPayServiceImpl implements ClientPayService {

    @Autowired
    ClientPayRepository clientPayRepository;

    @Override
    public ClientPay saveClientPay(ClientPay clientPay) {
        return clientPayRepository.save(clientPay);
    }
}
