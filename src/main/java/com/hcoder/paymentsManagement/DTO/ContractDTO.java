package com.hcoder.paymentsManagement.DTO;

import javax.validation.constraints.*;
import java.time.LocalDateTime;

public class ContractDTO {

    private int id;

    @NotNull(message = "يجب اختيار العميل")
    private Integer clientId;

    @NotNull(message = "يجب ادخال نوع الجهاز")
    @NotBlank(message = "يجب ادخال نوع الجهاز")
    @Size(max = 100, message = "نوع الجهاز لا يتعدى ال50 حرف")
    private String deviceType;

    @NotNull(message = "يجب ادخال نوع الجهاز")
    @NotBlank(message = "يجب ادخال نوع الجهاز")
    @Size(max = 100, message = "الرقم التسلسلي لا يتعدى ال50 حرف")
    private String serialNumber;

    @NotNull(message = "يجب ادخال سعر الجهاز")
    private Double devicePrice;

    @NotNull(message = "يجب ادخال المبلغ المدفوع")
    private Double payed;

    private Double remain;

    private Double remainAmount;

    @NotNull(message = "يجب ادخال عدد شهور الدفع")
    @Max(value = 9, message = "عدد الشهور لا تتعدى ال9 شهور")
    @Min(value = 0, message = "عدد الشهور لا يمكن ان تكون بالسالب")
    private Integer monthsNumber;

    @NotNull(message = "يجب ادخال الفائدة الشهرية")
    private Double monthlyInterest;

    @NotNull(message = "يجب ادخال يوم دفع القسط")
    private Integer paymentDay;

    @NotNull(message = "يجب ادخال اسم الضامن")
    @NotBlank(message = "يجب ادخال اسم الضامن")
    private String guarantorName;

    @NotNull(message = "يجب ادخال تيليفون الضامن")
    @NotBlank(message = "يجب ادخال تيليفون الضامن")
    @Size(min = 11, max = 11, message = "رقم الضامن لا يتعدى ولا يقل عن 11 رقم")
    @Pattern(regexp = "^01[0-2|5]{1}[0-9]{8}", message = "رقم العميل غير صحيح")
    private String guarantorPhone;

    private LocalDateTime creationDate;

    private boolean enabled;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Integer getClientId() {
        return clientId;
    }

    public void setClientId(Integer clientId) {
        this.clientId = clientId;
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

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
