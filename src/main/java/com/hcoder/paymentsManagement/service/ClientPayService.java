package com.hcoder.paymentsManagement.service;

import com.hcoder.paymentsManagement.entities.ClientPay;

public interface ClientPayService {

    ClientPay saveClientPay(ClientPay clientPay);

    ClientPay getClientPay(Integer clientPayId);

    void deleteClientPay(Integer clientPayId);
}
