<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">

<style>
    .text-size-50 {
        font-size: 35px;
    }
    a:hover{
        text-decoration: none;
    }
</style>

<div class=" container mt-5" dir="rtl">

    <div class="card row shadow">
        <div class="card-header shadow-sm text-center">
            <h2 class="card-title text-primary">
                الاقساط
            </h2>
        </div>
        <div class="card-body shadow">
            <div class="row container m-auto" dir="rtl">
                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card shadow-sm">
                        <div class="card-header shadow-sm shadow-sm">
                            <a href="/clients/5">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 5
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay5 ne null ? remainAmountDay5 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="card-header shadow-sm">
                            <a href="/clients/10" class="text">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 10
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay10 ne null ? remainAmountDay10 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="card-header shadow-sm">
                            <a href="/clients/15">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 15
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay15 ne null ? remainAmountDay15 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>
            </div>

            <br>

            <div class="row container m-auto" dir="rtl">

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="card-header shadow-sm">
                            <a href="/clients/20">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 20
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay20 ne null ? remainAmountDay20 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="card-header shadow-sm">
                            <a href="/clients/25">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 25
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay25 ne null ? remainAmountDay25 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-sm-6 col-xs-12">
                    <div class="card">
                        <div class="card-header shadow-sm">
                            <a href="/clients/30">
                                <h5 class="card-title text-size-50 text-center">
                                    يوم 30
                                </h5>
                            </a>
                            <hr>
                            <h5 class="text-center">
                                المبلغ المتبقي:
                                ${remainAmountDay30 ne null ? remainAmountDay30 : 0.0}
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>