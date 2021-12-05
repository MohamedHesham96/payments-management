<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="container" dir="rtl">

    <div class="card shadow">
        <div class="card-header">
            <h4 class="card-title text-primary pull-right">
                العقود
            </h4>

            <button class="btn btn-outline-primary font-weight-bold" data-toggle="modal" data-target="#contractModal"
                    onclick="clearForm('contractForm')">
                إضافة عقد
            </button>
        </div>
        <div id="contractsResultDiv" class="card-body shadow">
            <jsp:include page="_contractsResult.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="_contractModal.jsp"/>

<script src="<c:url value="/js/contracts.js"/>"></script>
