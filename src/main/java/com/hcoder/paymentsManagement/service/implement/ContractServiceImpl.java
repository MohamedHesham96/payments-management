package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.repository.ContractRepository;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    ContractRepository contractRepository;

    @Override
    public Double sumPaymentDayRemainAmountTotal(Integer paymentDay) {
        return contractRepository.sumPaymentDayRemainAmount(paymentDay);
    }
}
