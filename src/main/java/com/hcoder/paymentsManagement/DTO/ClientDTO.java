package com.hcoder.paymentsManagement.DTO;

import com.googlecode.jmapper.annotations.JMap;

import java.time.LocalDateTime;

public class ClientDTO {

    @JMap
    private int id;
    @JMap
    private String name;
    @JMap
    private String phone;
    @JMap
    private LocalDateTime creationDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public LocalDateTime getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(LocalDateTime creationDate) {
        this.creationDate = creationDate;
    }
}
