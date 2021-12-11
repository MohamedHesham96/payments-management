<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.sql.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="w-100 mr-5" dir="rtl">
    <div class="row ">
        <div class="card border-primary col-3 ml-4 p-0 shadow">
            <div class="card-header w-100 bg-primary text-white">
                <h5 class="card-title text-center m-auto font-weight-bold">
                    تفاصيل العقد
                </h5>
            </div>
            <div class="card-body p-0">
                <ul class="list-group list-group-flush p-0">
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">اسم العميل:</span>
                        <span class="pull-right mr-1"><a
                                href="/clients/${contract.client.id}">${contract.client.name}</a></span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">نوع الجهاز:</span>
                        <span class="pull-right mr-1">${contract.deviceType}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">الرقم التسلسلي:</span>
                        <span class="pull-right mr-1">${contract.serialNumber}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">سعر الجهاز الأصلي:</span>
                        <span class="pull-right mr-1">${contract.devicePrice}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">سعر الجهاز قسط:</span>
                        <span class="pull-right mr-1">${contract.devicePriceAfterInterest}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">المقدم:</span>
                        <span class="pull-right mr-1">${contract.payed}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">المتبقي وقت الدفع:</span>
                        <span class="pull-right mr-1">${contract.remain}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">المتبقي حتى الآن:</span>
                        <span class="pull-right mr-1">${contract.remainAmount}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">عدد شهور الدفع:</span>
                        <span class="pull-right mr-1">${contract.monthsNumber}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">الفائدة الشهرية:</span>
                        <span class="pull-right mr-1">${contract.monthlyInterest}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">يوم الدفع:</span>
                        <span class="pull-right mr-1">${contract.paymentDay == 0 ? 'غير محدد' : contract.paymentDay}</span>
                    </li>
                    <c:if test="${contract.paymentDay != 0}">
                        <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                            <span class="pull-right"> تاريخ اخر قسط مدفوع:</span>
                            <span class="pull-right mr-1">${contract.latestPayedMonth}</span>
                        </li>
                    </c:if>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">اسم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorName}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">رقم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorPhone}</span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0">
                        <span class="pull-right">التاريخ:</span>
                        <span class="pull-right mr-1">
                                 <fmt:parseDate value="${contract.creationDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                var="creationDate"/>
                                <fmt:formatDate value="${creationDate}" pattern="yyyy/MM/dd hh:mm a"/>
                        </span>
                    </li>
                    <li class="list-group-item list-group-item-action text-size-19 font-weight-bold pt-2 pb-2 pr-1 pl-0
                     ${contract.enabled ? "bg-danger-light" : "bg-success-light"}">
                        <span class="pull-right">الحالة:</span>
                        <span class="pull-right mr-1">${contract.enabled ? "مفتوح" : "منتهي"}</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-8 p-0 shadow bg-white" style="height:100%">
            <div class="table-responsive" style="max-height: 675px">
                <table class="table table-sm table-primary table-striped table-hover">
                    <thead class="table-striped bg-primary text-white shadow"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                    <tr>
                        <th class="col-1">المبلغ</th>
                        <th class="col-2">التاريخ</th>
                        <th class="col-3">الملاحظة</th>
                        <th class="col-1">العمليات</th>
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
                            <td>
                                <button class="btn btn-sm btn-outline-danger"
                                        onclick="deleteEntity(${clientPay.id}, '/clientPays')">
                                    حذف
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
            <c:if test="${contract.enabled}">
                <div class="row m-auto">
                    <button class="btn btn-primary w-25 m-auto"
                            data-toggle="modal" data-target="#clientPayModal" onclick="clearForm('clientPayForm')">
                        تحصيل مبلغ
                    </button>
                </div>
                <c:if test="${contract.paymentDay ne 0}">
                    <div class="row m-auto pt-2 pb-2">
                        <button class="btn btn-sm btn-outline-primary w-25 m-auto"
                                data-toggle="modal" data-target="#latestPayedMonthModal">
                            تحديث تاريخ اخر قسط مدفوع
                        </button>
                    </div>
                </c:if>
                <div class="clearfix"></div>
            </c:if>

            <c:if test="${!contract.enabled}">
                <div class="alert alert-success text-center">
                    هذا العقد منتهي
                </div>
            </c:if>
        </div>
    </div>
</div>

<jsp:include page="_clientPayModal.jsp"/>
<jsp:include page="_latestPayedMonthModal.jsp"/>
