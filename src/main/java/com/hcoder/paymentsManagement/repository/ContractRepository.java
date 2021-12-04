package com.hcoder.paymentsManagement.repository;

import com.hcoder.paymentsManagement.entities.Contract;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ContractRepository extends JpaRepository<Contract, Integer> {

    @Query("select sum(c.remainAmount) from Contract c where c.paymentDay = :paymentDay")
    Double sumPaymentDayRemainAmount(Integer paymentDay);

    @Query("select c from Contract c" +
            " order by case when (c.enabled = true) then 1 else 2 end")
    Page<Contract> findAll(Pageable pageable);
}


