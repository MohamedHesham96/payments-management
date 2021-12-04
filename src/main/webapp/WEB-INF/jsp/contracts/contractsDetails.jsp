<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container col-10 m-auto" dir="rtl">
    <div class="row ">
        <div class="card col-3 ml-4 p-0 shadow">
            <div class="card-header w-100 bg-primary text-white">
                <h5 class="card-title text-center m-auto">
                    تفاصيل العقد
                </h5>
            </div>
            <div class="card-body p-0">
                <ul class="list-group list-group-flush p-0">
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">نوع الجهاز:</span>
                        <span class="pull-right mr-1">${contract.deviceType}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">الرقم التسلسلي:</span>
                        <span class="pull-right mr-1">${contract.serialNumber}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">سعر الجهاز الأصلي:</span>
                        <span class="pull-right mr-1">${contract.devicePrice}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">سعر الجهاز قسط:</span>
                        <span class="pull-right mr-1">${contract.devicePriceAfterInterest}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">المبلغ المدفوع:</span>
                        <span class="pull-right mr-1">${contract.payed}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">المتبقي وقت الدفع:</span>
                        <span class="pull-right mr-1">${contract.remain}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">الباقي من الإجمالي:</span>
                        <span class="pull-right mr-1 bg-danger text-white pl-1 pr-1">${contract.remainAmount}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">الفائدة الشهرية:</span>
                        <span class="pull-right mr-1">${contract.monthlyInterest}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">يوم الدفع:</span>
                        <span class="pull-right mr-1">${contract.paymentDay}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">اسم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorName}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">رقم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorPhone}</span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">التاريخ:</span>
                        <span class="pull-right mr-1">
                                 <fmt:parseDate value="${contract.creationDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                var="creationDate"/>
                                <fmt:formatDate value="${creationDate}" pattern="yyyy/MM/dd hh:mm a"/>
                        </span>
                    </li>
                    <li class="list-group-item list-group-item-action font-weight-bold text-size-15 p-2">
                        <span class="pull-right">الحالة:</span>
                        <span class="pull-right mr-1">${contract.enabled ? "مفتوح" : "منتهي"}</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-8 p-0 shadow" style="height:100%">

            <div class="table-responsive" style="max-height: 550px">
                <table class="table table-striped table-hover">
                    <thead class="table-striped bg-primary text-white shadow"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                    <tr>
                        <th class="col-1">المبلغ</th>
                        <th class="col-2">التاريخ</th>
                        <th class="col-3">الملاحظة</th>
                    </tr>

                    </thead>
                    <tbody>
                    <c:forEach items="${contract.clientPays}" var="clientPay">
                        <tr>
                            <td>
                                    ${clientPay.amount}
                            </td>
                            <td>
                                <fmt:parseDate value="${clientPay.date}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                               var="clinetPayDate"/>
                                <fmt:formatDate value="${clinetPayDate}" pattern="yyyy/MM/dd hh:mm a"/>
                            </td>
                            <td>
                                    ${clientPay.note}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <c:if test="${contract.enabled}">
                <button class="btn btn-outline-primary pull-right w-100"
                        data-toggle="modal" data-target="#clientPayModal">
                    تحصيل مبلغ
                </button>
            </c:if>

            <c:if test="${!contract.enabled}">
                <div class="alert alert-success text-center">
                    هذا العقد منتهي
                </div>
            </c:if>

            <%--            <c:if test="${contract.enabled}">--%>
            <%--                <button class="btn btn-outline-primary pull-right w-100"--%>
            <%--                        data-toggle="modal" data-target="#clientPayModal">--%>
            <%--                    تحصيل مبلغ--%>
            <%--                </button>--%>
            <%--            </c:if>--%>

            <%--            <c:if test="${!contract.enabled}">--%>
            <%--                <button class="btn btn-outline-success pull-right w-100">--%>
            <%--                    تفعيل العقد--%>
            <%--                </button>--%>
            <%--            </c:if>--%>
        </div>
    </div>
</div>

<jsp:include page="_clientPayModal.jsp"/>