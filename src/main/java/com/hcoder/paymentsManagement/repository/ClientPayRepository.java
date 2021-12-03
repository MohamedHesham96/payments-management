package com.hcoder.paymentsManagement.repository;

import com.hcoder.paymentsManagement.entities.ClientPay;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClientPayRepository extends JpaRepository<ClientPay, Integer> {
}


