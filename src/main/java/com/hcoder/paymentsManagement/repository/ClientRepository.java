package com.hcoder.paymentsManagement.repository;

import com.hcoder.paymentsManagement.entities.Client;
import com.hcoder.paymentsManagement.entities.Contract;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClientRepository extends JpaRepository<Client, Integer> {

    @Query("select distinct c.client from Contract c where c.paymentDay = :paymentDay")
    Page<Client> getClientByPaymentDay(Integer paymentDay, Pageable pageable);

    @Query("select c from Contract c where c.client.id = :clientId and c.paymentDay = :paymentDay")
    List<Contract> getClientContracts(Integer clientId, Integer paymentDay);
}


