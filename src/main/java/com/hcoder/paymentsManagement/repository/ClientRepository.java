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

    @Query("select distinct c.client from Contract c where c.paymentDay = :paymentDay and c.enabled = true")
    List<Client> getClientByPaymentDay(Integer paymentDay);

    @Query("select c from Contract c where c.client.id = :clientId and c.paymentDay = :paymentDay and c.enabled = true")
    List<Contract> getClientContracts(Integer clientId, Integer paymentDay);

    @Query("select c from Client c where " +
            "(c.name is null or c.name like concat('%', :clientName, '%'))")
    Page<Client> findClients(String clientName, Pageable pageable);
}


