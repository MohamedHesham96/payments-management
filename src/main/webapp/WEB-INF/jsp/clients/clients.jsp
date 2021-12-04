<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" dir="rtl">
    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title text-primary pull-right">
                العملاء
                (${(clients.size())})
            </h4>

            <button class="btn btn-outline-primary font-weight-bold" data-toggle="modal" data-target="#clientModal">
                إضافة عميل
            </button>
        </div>
        <div class="card-body shadow">
            <table class="table table-hover table-striped">

                <thead class="bg-primary shadow text-white"
                       style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                <tr>
                    <th>الاسم</th>
                    <th>التيليفون</th>
                    <th>تاريخ التسجيل</th>
                    <th>العمليات</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${clients}" var="client">
                    <tr>
                        <td>
                            <a href="/clients/${client.id}">${client.name}</a>
                        </td>
                        <td>
                                ${client.phone}
                        </td>
                        <td>
                            <fmt:parseDate value="${client.creationDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"
                                           var="creationDate"/>
                            <fmt:formatDate value="${creationDate}" pattern="yyyy/MM/dd hh:mm a"/>
                        </td>
                        <td>
                            <button class="btn btn-sm btn-outline-danger"
                                ${client.contracts.size() gt  0 ? 'disabled': ''}
                                    onclick="deleteEntity(${client.id}, '/clients')">
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

<jsp:include page="_clientModal.jsp"/>