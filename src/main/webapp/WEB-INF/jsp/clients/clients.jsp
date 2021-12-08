<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container" dir="rtl">
    <div class="card shadow border-primary">
        <div class="card-header bg-primary">
            <h4 class="card-title text-white pull-right font-weight-bold"> العملاء
                (${(clients.size())})
            </h4>
            <button class="btn btn-light font-weight-bold" data-toggle="modal" data-target="#clientModal"
                    onclick="clearForm('clientForm')">
                إضافة عميل
            </button>
        </div>
        <div id="clientsResultDiv" class="card-body shadow">
            <jsp:include page="_clientsResult.jsp"/>
        </div>
    </div>
</div>

<jsp:include page="_clientModal.jsp"/>