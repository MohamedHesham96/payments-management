package com.hcoder.paymentsManagement;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = {"com.hcoder.paymentsManagement"})
@SpringBootApplication
public class PaymentsManagementApplication {

    public static void main(String[] args) {
        SpringApplication.run(PaymentsManagementApplication.class, args);
    }
}
