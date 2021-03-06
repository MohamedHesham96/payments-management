<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h4 class="pull-right"> تنبيهات يوم
    ${paymentDay}
</h4>

<div class="clearfix"></div>
<div class="pull-right">
    <label>عرض</label>
    <select id="pageSize" name="pageSize"
            onchange="changeTableSize('/notifications/paymentDay/${paymentDay}', 'contractsResultDiv', null);">
        <option ${pageSize eq 10 ? 'selected':''} value="10">10</option>
        <option ${pageSize eq 20 ? 'selected':''} value="20">20</option>
        <option ${pageSize eq 50 ? 'selected':''} value="50">50</option>
        <option ${pageSize eq 100 ? 'selected':''} value="100">100</option>
    </select>
    <label>من النتائج</label>
</div>

<div class="table-responsive">
    <table class="table table-sm table-striped table-hover">

        <thead class="table-striped bg-primary text-white shadow"
               style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
        <tr>
            <th>اسم العميل</th>
            <th>نوع الجهاز</th>
            <th>تاريخ اخر قسط</th>
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
                        ${contract.latestPayedMonth}
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<input type="hidden" id="currentPage" name="currentPage"
       value="${currentPage ne null and currentPage ne 0 ? currentPage : 0}"/>

<input type="hidden" id="totalPages" name="totalPages"
       value="${totalPages ne null and totalPages ne 0 ? totalPages : 0}"/>

<label class="btn btn-sm font-weight-bold bg-primary text-white pull-right">
    عرض
    ${totalPages == 0 || totalPages == null ? 0 : currentPage + 1}
    من
    ${totalPages != null ? totalPages : 0}</label>

<div class="clearfix"></div>

<div style="justify-content: center" class="row">

    <button class="btn btn-sm m-1 ${currentPage + 1 == totalPages || totalPages == 0 || totalPages == null ? 'btn-light disabled' : 'btn-primary'}" ${page + 1 == totalPages || totalPages == 0 ? 'disabled' : ''}
            onclick="nextPage('/notifications/paymentDay/${paymentDay}', 'contractsResultDiv', null)">
        التالي
    </button>

    <button class="btn btn-sm m-1
        ${currentPage == 0 || totalPages == 0 || currentPage == null || totalPages == null ? 'btn-light disabled' : 'btn-primary'}"
            onclick="previousPage('/notifications/paymentDay/${paymentDay}', 'contractsResultDiv', null)">
        السابق
    </button>

</div>


