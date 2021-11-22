package com.hcoder.paymentsManagement.repository;

import com.hcoder.paymentsManagement.entities.Client;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {

    @Query("select distinct c.client from Contract c where c.paymentDay = :paymentDay")
    Page<Client> getClientByPaymentDay(Integer paymentDay, Pageable pageable);
}


