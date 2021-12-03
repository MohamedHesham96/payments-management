<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container col-10 m-auto" dir="rtl">
    <div class="row ">
        <div class="card col-3 ml-4 p-0 shadow">
            <div class="card-header w-100 bg-primary text-white">
                <h5 class="card-title text-center m-auto">
                    تفاصيل العقد
                </h5>
            </div>
            <div class="card-body p-0">
                <ul class="list-group p-0">
                    <li class="list-group-item">
                        <span class="pull-right">نوع الجهاز:</span>
                        <span class="pull-right mr-1">${contract.deviceType}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">الرقم التسلسلي:</span>
                        <span class="pull-right mr-1">${contract.serialNumber}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">المبلع المدفوع:</span>
                        <span class="pull-right mr-1">${contract.payed}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">المتبقي:</span>
                        <span class="pull-right mr-1">${contract.remain}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">الباقي من الاجمالي:</span>
                        <span class="pull-right mr-1">${contract.remainAmount}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">الفائدة الشهرية:</span>
                        <span class="pull-right mr-1">${contract.monthlyAmount}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">يوم الدفع:</span>
                        <span class="pull-right mr-1">${contract.paymentDay}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">اسم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorName}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">رقم الضامن:</span>
                        <span class="pull-right mr-1">${contract.guarantorPhone}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">التاريخ:</span>
                        <span class="pull-right mr-1">${contract.creationDate}</span>
                    </li>
                    <li class="list-group-item">
                        <span class="pull-right">الحالة:</span>
                        <span class="pull-right mr-1">${contract.enabled ? "منتهي" : "مفتوح"}</span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="col-8 p-0 shadow">
            <table class="table table-striped table-hover">
                <thead class="table-striped bg-primary text-white shadow"
                       style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                <tr>
                    <th>المبلغ</th>
                    <th>التاريخ</th>
                    <th>الملاحظة</th>
                </tr>

                </thead>
                <tbody>
                <c:forEach items="${contract.clientPays}" var="clientPay">
                    <tr>
                        <td>
                                ${clientPay.amount}
                        </td>
                        <td>
                                ${clientPay.date}
                        </td>
                        <td>
                                ${clientPay.note}
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
