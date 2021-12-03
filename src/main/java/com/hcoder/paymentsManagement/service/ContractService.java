package com.hcoder.paymentsManagement.service;

import com.hcoder.paymentsManagement.entities.Contract;

public interface ContractService {

    Contract saveContract(Contract contract);

    Double sumPaymentDayRemainAmountTotal(Integer paymentDay);

    Contract getContract(Integer contractId);
}
