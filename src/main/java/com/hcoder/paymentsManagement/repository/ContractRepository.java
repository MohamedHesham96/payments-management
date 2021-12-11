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

    @Query("select sum(c.remainAmount) from Contract c")
    Double sumTotalRemainAmount();

    @Query("select sum(cp.amount) from ClientPay cp")
    Double sumTotalClientPayedAmount();

    @Query("select sum(c.payed) from Contract c")
    Double sumTotalPayedAmount();

    @Query(value = "select * from contract c where c.payment_day = :paymentDay and DATEDIFF(CURDATE(), c.latest_payed_month) > 30", nativeQuery = true)
    Page<Contract> getNotPayedContracts(Integer paymentDay, Pageable pageable);

    @Query(value = "select count(*) from contract c where c.payment_day = :paymentDay and DATEDIFF(CURDATE(), c.latest_payed_month) > 30", nativeQuery = true)
    Integer countLateMonthsContracts(Integer paymentDay);
}


