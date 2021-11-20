package com.hcoder.clothingstoremanagement.entities;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "CLIENT")
public class Client {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int id;

    @Column(name = "NAME")
    String name;

    @Column(name = "PHONE")
    String phone;

    @Column(name = "CREATION_DATE")
    LocalDateTime creationDate;

    @OneToMany(mappedBy = "client")
    List<ClientPay> clientPays;

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

    public List<ClientPay> getClientPays() {
        return clientPays;
    }

    public void setClientPays(List<ClientPay> clientPays) {
        this.clientPays = clientPays;
    }
}
