package com.hcoder.paymentsManagement.entities;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "CONTRACT")
public class Contract {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @ManyToOne
    @JoinColumn(name = "client_id")
    private Client client;

    @Column(name = "DEVICE_TYPE")
    private String deviceType;

    @Column(name = "SERIAL_NUMBER")
    private String serialNumber;

    @Column(name = "PAYED")
    private Double payed;

    @Column(name = "REMAIN")
    private Double remain;

    @Column(name = "REMAIN_AMOUNT")
    private Double remainAmount;

    @Column(name = "monthly_interest")
    private String monthlyAmount;

    @Column(name = "PAYMENT_DAY")
    private Integer paymentDay;

    @Column(name = "GUARANTOR_NAME")
    private String guarantorName;

    @Column(name = "guarantor_phone")
    private String guarantorPhone;

    @Column(name = "creation_date")
    private LocalDateTime creationDate;

    @Column(name = "enabled")
    private Boolean enabled;

    @OneToMany(mappedBy = "contract")
    private List<ClientPay> clientPays;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(String serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Double getPayed() {
        return payed;
    }

    public void setPayed(Double payed) {
        this.payed = payed;
    }

    public Double getRemain() {
        return remain;
    }

    public void setRemain(Double remain) {
        this.remain = remain;
    }

    public Double getRemainAmount() {
        return remainAmount;
    }

    public void setRemainAmount(Double remainAmount) {
        this.remainAmount = remainAmount;
    }

    public String getMonthlyAmount() {
        return monthlyAmount;
    }

    public void setMonthlyAmount(String monthlyAmount) {
        this.monthlyAmount = monthlyAmount;
    }

    public Integer getPaymentDay() {
        return paymentDay;
    }

    public void setPaymentDay(Integer paymentDay) {
        this.paymentDay = paymentDay;
    }

    public String getGuarantorName() {
        return guarantorName;
    }

    public void setGuarantorName(String guarantorName) {
        this.guarantorName = guarantorName;
    }

    public String getGuarantorPhone() {
        return guarantorPhone;
    }

    public void setGuarantorPhone(String guarantorPhone) {
        this.guarantorPhone = guarantorPhone;
    }

    public LocalDateTime getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(LocalDateTime creationDate) {
        this.creationDate = creationDate;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<ClientPay> getClientPays() {
        return clientPays;
    }

    public void setClientPays(List<ClientPay> clientPays) {
        this.clientPays = clientPays;
    }
}
