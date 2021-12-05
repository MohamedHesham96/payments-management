package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.entities.ClientPay;
import com.hcoder.paymentsManagement.repository.ClientPayRepository;
import com.hcoder.paymentsManagement.service.ClientPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ClientPayServiceImpl implements ClientPayService {

    @Autowired
    ClientPayRepository clientPayRepository;

    @Override
    public ClientPay saveClientPay(ClientPay clientPay) {
        return clientPayRepository.save(clientPay);
    }

    @Override
    public ClientPay getClientPay(Integer clientPayId) {
        Optional<ClientPay> clientPayOptional = clientPayRepository.findById(clientPayId);
        return clientPayOptional.isPresent() ? clientPayOptional.get() : null;
    }

    @Override
    public void deleteClientPay(Integer clientPayId) {
        clientPayRepository.deleteById(clientPayId);
    }
}
