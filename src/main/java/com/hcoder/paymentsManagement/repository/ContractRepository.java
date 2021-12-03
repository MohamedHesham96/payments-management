package com.hcoder.paymentsManagement.repository;

import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ContractRepository extends JpaRepository<Contract, Integer> {

    @Query("select sum(c.remainAmount) from Contract c where c.paymentDay = :paymentDay")
    Double sumPaymentDayRemainAmount(Integer paymentDay);
}


