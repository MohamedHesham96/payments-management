<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">

<style>
    .text-size-50 {
        font-size: 25px;
    }

    a:hover {
        text-decoration: none;
    }
</style>

<div class="container mt-0 p-0" dir="rtl">
    <div class="card row shadow shadow-sm border-primary">
        <div class="card-header bg-primary p-2 shadow-sm text-center">
            <h3 class="card-title font-weight-bold text-white">
                الاقساط
            </h3>
        </div>
        <div class="card-body shadow pb-0">
            <div class="row container m-auto" dir="rtl">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary shadow-sm p-0">
                        <div class="card-header  bg-primary text-white shadow-sm shadow-sm">
                            <a href="/clients/paymentDay/5">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 5
                                </h5>
                            </a>
                        </div>

                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay5 ne null ? remainAmountDay5 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary">
                        <a href="/clients/paymentDay/10">
                            <div class="card-header  bg-primary text-white shadow-sm">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 10
                                </h5>
                            </div>
                        </a>
                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay10 ne null ? remainAmountDay10 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary">
                        <div class="card-header  bg-primary text-white shadow-sm">
                            <a href="/clients/paymentDay/15">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 15
                                </h5>
                            </a>
                        </div>

                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay15 ne null ? remainAmountDay15 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row container m-auto" dir="rtl">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary">
                        <div class="card-header  bg-primary text-white shadow-sm">
                            <a href="/clients/paymentDay/20">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 20
                                </h5>
                            </a>
                        </div>
                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay20 ne null ? remainAmountDay20 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary">
                        <div class="card-header  bg-primary text-white shadow-sm">
                            <a href="/clients/paymentDay/25">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 25
                                </h5>
                            </a>
                        </div>

                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay25 ne null ? remainAmountDay25 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm border-primary">
                        <div class="card-header  bg-primary shadow-sm">
                            <a href="/clients/paymentDay/30">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    يوم 30
                                </h5>
                            </a>
                        </div>

                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay30 ne null ? remainAmountDay30 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row container m-auto">
                <div class="col-md-4 col-sm-6 col-xs-12 m-auto">
                    <div class="card shadow-sm border-success">
                        <div class="card-header  bg-success  shadow-sm">
                            <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                اجمالي المدفوع
                            </h5>
                        </div>
                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                ${totalPayedAmount ne null ? totalPayedAmount : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12 m-auto">
                    <div class="card shadow-sm border-primary">
                        <div class="card-header  bg-primary text-white shadow-sm">
                            <a href="/clients/paymentDay/0">
                                <h5 class="card-title font-weight-bold text-white text-size-50 text-center">
                                    غير محدد
                                </h5>
                            </a>
                        </div>
                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                المبلغ المتبقي:
                                ${remainAmountDay0 ne null ? remainAmountDay0 : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 col-xs-12 m-auto">
                    <div class="card shadow-sm border-danger">
                        <div class="card-header bg-danger shadow-sm">
                            <h5 class="card-title font-weight-bold text-white  text-size-50 text-center">
                                اجمالي المتبقي
                            </h5>
                        </div>
                        <div class="card-body">
                            <h6 class="text-center text-size-20">
                                ${totalRemainAmount ne null ? totalRemainAmount : 0.0}
                            </h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>