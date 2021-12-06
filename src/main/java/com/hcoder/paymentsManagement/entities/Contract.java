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

    @Column(name = "device_type")
    private String deviceType;

    @Column(name = "serial_number")
    private String serialNumber;

    @Column(name = "device_price")
    private Double devicePrice;

    @Column(name = "device_price_after_interest")
    private Double devicePriceAfterInterest;

    @Column(name = "payed")
    private Double payed;

    @Column(name = "remain")
    private Double remain;

    @Column(name = "remain_amount")
    private Double remainAmount;

    @Column(name = "months_number")
    private Integer monthsNumber;

    @Column(name = "monthly_interest")
    private Double monthlyInterest;

    @Column(name = "payment_day")
    private Integer paymentDay;

    @Column(name = "guarantor_name")
    private String guarantorName;

    @Column(name = "guarantor_phone")
    private String guarantorPhone;

    @Column(name = "creation_date")
    private LocalDateTime creationDate;

    @Column(name = "enabled")
    private Boolean enabled;

    @OneToMany(mappedBy = "contract")
    @OrderBy("date desc")
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

    public Double getDevicePrice() {
        return devicePrice;
    }

    public void setDevicePrice(Double devicePrice) {
        this.devicePrice = devicePrice;
    }

    public Double getDevicePriceAfterInterest() {
        return devicePriceAfterInterest;
    }

    public void setDevicePriceAfterInterest(Double devicePriceAfterInterest) {
        this.devicePriceAfterInterest = devicePriceAfterInterest;
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

    public Integer getMonthsNumber() {
        return monthsNumber;
    }

    public void setMonthsNumber(Integer monthsNumber) {
        this.monthsNumber = monthsNumber;
    }

    public Double getMonthlyInterest() {
        return monthlyInterest;
    }

    public void setMonthlyInterest(Double monthlyInterest) {
        this.monthlyInterest = monthlyInterest;
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
