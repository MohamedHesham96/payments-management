package com.hcoder.paymentsManagement.DTO;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.time.LocalDateTime;

public class ClientDTO {

    private int id;

    @NotNull(message = "يجب ادخل اسم العميل")
    @NotBlank(message = "يجب ادخل الاسم العميل")
    @Size(max = 50, message = "الاسم لا يتعدى ال50 حرف")
    private String name;

    @Pattern(regexp = "^01[0-2|5]{1}[0-9]{8}", message = "رقم العميل غير صحيح")
    @NotNull(message = "يجب ادخل تليفون العميل")
    @NotBlank(message = "يجب ادخل تليفون العميل")
    @Size(min = 11, max = 11, message = "رقم العميل لا يتعدى ولا يقل عن 11 رقم")
    private String phone;

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
