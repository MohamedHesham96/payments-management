<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal fade" id="clientPayModal" tabindex="-1" role="dialog" aria-labelledby="clientPayModal"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" dir="rtl">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">تحصيل قسط</h5>
            </div>
            <div class="modal-body">
                <form id="clientPayForm" data-parsley-validate>
                    <div class="form-group">
                        <label class="pull-right">المبلغ</label>
                        <input name="amount" placeholder="المبلغ المدفوع"
                               class="form-control text-right" data-parsley-type="number"
                               data-parsley-required="true" data-parsley-trigger="change"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">الملاحظة</label>
                        <textarea name="note" placeholder="ادخل ملاحظتك" class="form-control text-right"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="postForm('clientPayForm', '/contracts/${contractId}/clientPay')"
                        class="btn btn-outline-primary">
                    حفظ
                </button>
                <button type="button" class="btn btn-outline-secondary mr-1" data-dismiss="modal">إلغاء</button>
            </div>
        </div>
    </div>
</div>


