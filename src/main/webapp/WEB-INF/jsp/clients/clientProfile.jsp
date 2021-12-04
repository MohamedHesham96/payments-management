<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container col-10 m-auto" dir="rtl">
    <div class="row ">

        <div class="card col-3 ml-4 p-0 shadow">
            <div class="card-header w-100 bg-primary text-white">
                <h5 class="card-title text-center m-auto">
                    تفاصيل العميل
                </h5>
            </div>
            <div class="card-body p-0">
                <ul class="list-group list-group-flush p-0">
                    <li class="list-group-item list-group-item-action">
                        <span class="pull-right">اسم العميل:</span>
                        <span class="pull-right mr-1">${client.name}</span>
                    </li>
                    <li class="list-group-item list-group-item-action">
                        <span class="pull-right">رقم العميل:</span>
                        <span class="pull-right mr-1">${client.phone}</span>
                    </li>
                    <li class="list-group-item list-group-item-action">
                        <span class="pull-right">التاريخ:</span>
                        <span class="pull-right mr-1">
                                 <fmt:parseDate value="${client.creationDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                                var="creationDate"/>
                                <fmt:formatDate value="${creationDate}" pattern="yyyy/MM/dd hh:mm a"/>
                        </span>
                    </li>
                </ul>
            </div>
        </div>

        <div class="card col-8 p-0 shadow">
            <div class="card-header">
                <h4 class="card-title text-primary pull-right">
                    عقود العميل
                    (${client.contracts.size()})
                </h4>
            </div>
            <div class="card-body">
                <table class="table table-striped table-hover">
                    <thead class="table-striped bg-primary text-white shadow"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                    <tr>
                        <th>نوع الجهاز</th>
                        <th>اسم الضامن</th>
                        <th>رقم الضامن</th>
                        <th>الحالة</th>
                        <th>التاريخ</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${client.contracts}" var="contract">
                        <tr>
                            <td>
                                <a href="/contracts/${contract.id}">${contract.deviceType}</a>
                            </td>
                            <td>
                                    ${contract.guarantorName}
                            </td>
                            <td>
                                    ${contract.guarantorPhone}
                            </td>
                            <td class="${contract.enabled ? "text-danger" : "text-success"}">
                                    ${contract.enabled ? "مفتوح" : "منتهي"}
                            </td>
                            <td>
                                    ${contract.creationDate}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>