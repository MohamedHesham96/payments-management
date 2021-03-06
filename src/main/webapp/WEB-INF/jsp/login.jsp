<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <c:if test="${backUpSavedMessage != null}">
        <div class="alert alert-success text-center font-weight-bold">
                ${backUpSavedMessage}
        </div>
    </c:if>

    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

    <title>تسجيل الدخول</title>

    <link href="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">


</head>
<body background="/images/background.jpg" style="  background-attachment: fixed;
background-repeat: no-repeat; background-position: center; background-size: cover">

<div class="container ">
    <div class="card border-primary bg-primary"
         style="width: 21rem; margin-left: 400px; margin-top: 150px">
        <form action="/login" method="post">
            <ul class="list-group list-group-flush text-center">
                <li class=" bg-primary  text-light list-group-item p-4">
                    <strong dir="rtl" style="font-size: 40px">

                        4M
                        للتقسيط

                    </strong>
                </li>

                <li class="bg-light list-group-item">
                    <div class="text-center form-group">
                        <label class="font-weight-bold">اسم المستخدم</label> <input
                            type="text" class="text-center form-control font-weight-bold"
                            name="username">

                    </div>
                </li>
                <li class="bg-light list-group-item">

                    <div class="form-group text-center">
                        <label class="font-weight-bold ">كلمة المرور</label> <input
                            name="password" type="password"
                            class="text-center form-control font-weight-bold">
                    </div>
                </li>
                <li class="bg-light list-group-item"><input type="submit"
                                                            class="btn btn-primary font-weight-bold form-control"
                                                            value="تسجيل الدخول"/></li>
            </ul>

        </form>
    </div>
</div>


<div dir="rtl" class="text-center w-100 bg-primary text-white pt-1"
     style="position: fixed; bottom: 0">
    <h4>
        تصميم وتنفيذ شركة - BlueSoft
        - المهندس محمد هشام
        - 01013807084
    </h4>
</div>

</body>