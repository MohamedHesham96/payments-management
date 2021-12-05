<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal fade" id="clientModal" tabindex="-1" role="dialog" aria-labelledby="clientModal"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" dir="rtl">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">إضافة عميل</h5>
            </div>
            <div class="modal-body">
                <form id="clientForm" data-parsley-validate>
                    <div class="form-group">
                        <label class="pull-right">اسم العميل</label>
                        <input name="name" placeholder="اسم العميل"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="change"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">تليفون العميل</label>
                        <input name="phone" placeholder="تليفون العميل"
                               class="form-control text-right"
                               data-parsley-type="digits"
                               data-parsley-minlength="11" data-parsley-maxlength="11"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="postForm('clientForm', '/clients')"
                        class="btn btn-outline-primary">
                    حفظ
                </button>
                <button type="button" class="btn btn-outline-secondary mr-1" data-dismiss="modal">إلغاء</button>
            </div>
        </div>
    </div>
</div>


