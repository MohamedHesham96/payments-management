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

        <jsp:include page="_clientsSearch.jsp"/>

        <div class="card-body shadow">

            <div id="paymentDayClientsResultDiv">
                <jsp:include page="_paymentDayClientsResult.jsp"/>
            </div>

        </div>
    </div>
</div>
