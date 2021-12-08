<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" dir="rtl">
    <div class="card shadow border-primary">
        <div class="card-header bg-primary">
            <h4 class="card-title text-white pull-right font-weight-bold">
                اقساط يوم
                (${paymentDay == 0 ? 'غير محدد' : paymentDay})
            </h4>
        </div>
        <div class="card-body shadow">
            <div class="table-responsive">
                <table class="table table-sm table-hover table-striped">

                    <thead class="bg-primary shadow text-white"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                    <tr>
                        <th>الاسم</th>
                        <th>التيليفون</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${clients}" var="client">
                        <tr>
                            <td>
                                <a href="/clients/${client.id}/contracts/paymentDay/${paymentDay}">${client.name}</a>
                            </td>
                            <td>
                                    ${client.phone}
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
