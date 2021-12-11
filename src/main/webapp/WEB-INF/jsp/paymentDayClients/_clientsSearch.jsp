<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="mt-3">
    <form id="clientSearchForm" class="col-7 form-inline"
          onsubmit="changeTableSize('/clients/paymentDay/${paymentDay}', 'paymentDayClientsResultDiv', 'clientSearchForm')">
        <label for="clientName" class="pull-right">البحث باسم العميل: </label>
        <input id="clientName" name="clientName" placeholder="ادخل اسم العميل"
               class="form-control col-6 pull-right text-right mr-1">

        <button class="btn btn-outline-primary col-2 mr-2"
                type="submit">
            بحث
        </button>
    </form>
</div>


