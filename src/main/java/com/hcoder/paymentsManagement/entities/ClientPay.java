package com.hcoder.paymentsManagement.entities;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "CLIENT_PAY")
public class ClientPay {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Integer id;

    @Column(name = "AMOUNT")
    Double amount;

    @Column(name = "DATE")
    LocalDateTime date;

    @Column(name = "NOTE")
    String note;

    @ManyToOne
    @JoinColumn(name = "CLIENT_ID")
    Client client;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public LocalDateTime getDate() {
        return date;
    }

    public void setDate(LocalDateTime date) {
        this.date = date;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }
}