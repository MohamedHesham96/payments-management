<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" dir="rtl">

    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title text-primary pull-right font-weight-bold">
                اقساط يوم
                (${paymentDay})
                -
                للعميل
                (${clientName})
            </h4>
        </div>
        <div class="card-body shadow">
            <div class="table-responsive" style="max-height: 550px">
                <table class="table table-sm table-striped table-hover">

                    <thead class="table-striped bg-primary text-white shadow"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">
                    <tr>
                        <th>نوع الجهاز</th>
                        <th>الرقم التسلسلي</th>
                        <th>اسم الضامن</th>
                        <th>رقم الضامن</th>
                        <th>التاريخ</th>
                    </tr>

                    </thead>

                    <tbody>
                    <c:forEach items="${contracts}" var="contract">
                        <tr>
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
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
