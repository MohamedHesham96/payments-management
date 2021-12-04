<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div class="modal fade" id="contractModal" tabindex="-1" role="dialog" aria-labelledby="contractModal"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content" dir="rtl">
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title">إضافة عقد</h5>
            </div>
            <div class="modal-body">
                <form id="contractForm" data-parsley-validate>
                    <div class="form-group">
                        <label class="pull-right">العميل</label>
                        <select name="clientId" class="form-control text-right"
                                data-parsley-required="true" data-parsley-trigger="input">
                            <option value="">-- اختار العميل --</option>
                            <c:forEach items="${clients}" var="client">
                                <option value="${client.id}">${client.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">نوع الجهاز</label>
                        <input name="deviceType" placeholder="نوع الجهاز"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">الرقم التسلسلي</label>
                        <input name="serialNumber" placeholder="الرقم التسلسلي"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">المبلغ المدفوع</label>
                        <input name="payed" placeholder="المبلغ المدفوع"
                               class="form-control text-right" data-parsley-type="number"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">باقي المبلغ</label>
                        <input name="remain" placeholder="باقي المبلغ"
                               class="form-control text-right" data-parsley-type="number"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">الفائدة الشهرية</label>
                        <input name="monthlyInterest" placeholder="الفائدة الشهرية"
                               class="form-control text-right" data-parsley-type="number"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>


                    <div class="form-group">
                        <label class="pull-right">يوم دفع القسط</label>
                        <select name="paymentDay" class="form-control text-right"
                                data-parsley-required="true" data-parsley-trigger="change">
                            <option value="">-- اختار يوم الدفع --</option>
                            <option value="0">غير محدد</option>
                            <option value="5"> يوم 5</option>
                            <option value="10"> يوم 10</option>
                            <option value="15"> يوم 15</option>
                            <option value="20"> يوم 20</option>
                            <option value="25"> يوم 25</option>
                            <option value="30"> يوم 30</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">اسم الضامن</label>
                        <input name="guarantorName" placeholder="اسم الضامن"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="form-group">
                        <label class="pull-right">تيليفون الضامن</label>
                        <input name="guarantorPhone" placeholder="تيليفون الضامن"
                               class="form-control text-right" data-parsley-maxlength="11"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" onclick="postForm('contractForm', '/contracts')"
                        class="btn btn-outline-primary">
                    حفظ
                </button>
                <button type="button" class="btn btn-outline-secondary mr-1" data-dismiss="modal">إلغاء</button>
            </div>
        </div>
    </div>
</div>


