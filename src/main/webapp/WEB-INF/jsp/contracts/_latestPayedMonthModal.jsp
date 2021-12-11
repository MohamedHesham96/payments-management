<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal fade" id="latestPayedMonthModal" tabindex="-1" role="dialog" aria-labelledby="latestPayedMonthModal"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" dir="rtl">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title font-weight-bold">تحديث تاريخ اخر قسط</h5>
            </div>
            <div class="modal-body">
                <form id="latestPayedMonthForm" data-parsley-validate>
                    <div class="form-group">
                        <label class="pull-right">تاريخ اخر قسط مدفوع</label>
                        <select id="latestPayedMonth" name="latestPayedMonth"
                                class="form-control text-right"
                                data-parsley-required="true" data-parsley-trigger="change">
                            <option value="">-- اختار تاريخ اخر قسط تم دفعه --</option>
                            <c:forEach items="${paymentDates}" var="paymentDate">
                                <option>${paymentDate}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button class="btn btn-outline-primary col-2"
                        onclick="postForm('latestPayedMonthForm', '/contracts/${contract.id}/latestPayedMonth')">
                    حفظ
                </button>
                <button type="button" class="btn btn-outline-secondary mr-1" data-dismiss="modal">إلغاء</button>
            </div>
        </div>
    </div>
</div>