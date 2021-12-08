package com.hcoder.paymentsManagement.service;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Contract;
import org.springframework.data.domain.Page;

public interface ContractService {

    Contract saveContract(Contract contract);

    Double sumPaymentDayRemainAmountTotal(Integer paymentDay);

    Contract getContract(Integer contractId);

    Page<Contract> getContracts(Pagination pagination);

    void deleteContract(Integer contractId);

    Double sumTotalRemainAmount();

    Double sumTotalPayedAmount();
}
