package com.hcoder.paymentsManagement.service.implement;

import com.hcoder.paymentsManagement.DTO.Pagination;
import com.hcoder.paymentsManagement.entities.Contract;
import com.hcoder.paymentsManagement.repository.ContractRepository;
import com.hcoder.paymentsManagement.service.ContractService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class ContractServiceImpl implements ContractService {

    @Autowired
    ContractRepository contractRepository;

    @Override
    public Contract saveContract(Contract contract) {
        return contractRepository.save(contract);
    }

    @Override
    public Double sumPaymentDayRemainAmountTotal(Integer paymentDay) {
        return contractRepository.sumPaymentDayRemainAmount(paymentDay);
    }

    @Override
    public Contract getContract(Integer contractId) {
        Optional<Contract> contractOptional = contractRepository.findById(contractId);
        return contractOptional.orElse(null);
    }

    @Override
    public Page<Contract> getContracts(Pagination pagination) {
        Pageable pageable = PageRequest.of(pagination.getPage(), pagination.getSize(), Sort.by("creationDate").descending());
        return contractRepository.findAll(pageable);
    }

    @Override
    public void deleteContract(Integer contractId) {
        contractRepository.deleteById(contractId);
    }

    @Override
    public Double sumTotalRemainAmount() {
        return contractRepository.sumTotalRemainAmount();
    }

    @Override
    public Double sumTotalPayedAmount() {
        return contractRepository.sumTotalPayedAmount();
    }
}
