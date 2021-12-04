<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" dir="rtl">

    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title text-primary pull-right">
                العقود
                (${contracts.size()})
            </h4>

            <button class="btn btn-outline-primary font-weight-bold" data-toggle="modal" data-target="#contractModal">
                إضافة عقد
            </button>
        </div>
        <div class="card-body shadow">
            <table class="table table-striped table-hover">

                <thead class="table-striped bg-primary text-white shadow"
                       style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                <tr>
                    <th>اسم العميل</th>
                    <th>نوع الجهاز</th>
                    <th>الرقم التسلسلي</th>
                    <th>اسم الضامن</th>
                    <th>رقم الضامن</th>
                    <th>التاريخ</th>
                    <th>العمليات</th>
                </tr>

                </thead>

                <tbody>
                <c:forEach items="${contracts}" var="contract">
                    <tr>
                        <td>
                            <a href="/clients/${contract.client.id}">${contract.client.name}</a>
                        </td>
                        <td>
                            <a href="/contracts/${contract.id}">${contract.deviceType}</a>
                        </td>
                        <td>
                                ${contract.serialNumber}
                        </td>
                        <td>
                                ${contract.guarantorName}
                        </td>
                        <td>
                                ${contract.guarantorPhone}
                        </td>
                        <td>
                                ${contract.creationDate}
                        </td>
                        <td>
                            <button class="btn btn-sm btn-outline-danger"
                                ${contract.clientPays.size() gt  0 ? 'disabled': ''}
                                    onclick="deleteEntity(${contract.id}, '/contracts')">
                                حذف
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>

        </div>
    </div>
</div>

<jsp:include page="_contractModal.jsp"/>