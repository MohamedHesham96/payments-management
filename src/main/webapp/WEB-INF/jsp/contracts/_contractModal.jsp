<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="modal fade" id="contractModal" tabindex="-1" role="dialog" aria-labelledby="contractModal"
     aria-hidden="true">
    <div class="modal-dialog modal-lgl modal-dialog-centered" role="document">
        <div class="modal-content" dir="rtl">
            <div class="modal-header bg-primary text-white p-2">
                <h4 class="modal-title font-weight-bold">إضافة عقد</h4>
            </div>
            <div class="modal-body pt-1">
                <form id="contractForm" data-parsley-validate>
                    <div>
                        <label class="pull-right">العميل</label>
                        <select name="clientId" class="form-control text-right"
                                data-parsley-required="true" data-parsley-trigger="input">
                            <option value="">-- اختار العميل --</option>
                            <c:forEach items="${clients}" var="client">
                                <option value="${client.id}">${client.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mt-2">
                        <label class="pull-right">نوع الجهاز</label>
                        <input name="deviceType" placeholder="نوع الجهاز"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>

                    <div class="mt-2 mb-2">
                        <label class="pull-right">الرقم التسلسلي</label>
                        <input name="serialNumber" placeholder="الرقم التسلسلي"
                               class="form-control text-right" data-parsley-maxlength="50"
                               data-parsley-required="true" data-parsley-trigger="input"/>
                    </div>
                    <div class="card w-100 m-auto border-primary">
                        <div class="card-header bg-primary text-white text-right pr-2 p-1">
                                <span class="card-title">
                                    حسابات نظام القسط
                                </span>
                        </div>
                        <div class="card-body p-2">
                            <div class="row">
                                <div class="col-6">
                                    <span class="pull-right text-size-15 mb-1">سعر الجهاز</span>
                                    <input id="devicePrice" name="devicePrice"
                                           oninput="updateDevicePriceAfterMonthlyInterest()"
                                           class="form-control form-control-sm text-right" data-parsley-type="number"
                                           data-parsley-required="true" data-parsley-trigger="input"/>
                                </div>

                                <div class="col-6">
                                    <span class="pull-right text-size-15 mb-1">المقدم</span>
                                    <input id="payed" name="payed" placeholder=""
                                           oninput="updateRemainAmount()"
                                           class="form-control form-control-sm text-right"
                                           data-parsley-type="number"
                                           data-parsley-required="true" data-parsley-trigger="input"/>
                                </div>
                            </div>

                            <div class="row mt-1">
                                <div class="col-6">
                                    <span class="pull-right text-size-15 mb-1">عدد الشهور</span>
                                    <select id="monthsNumber" name="monthsNumber"
                                            oninput="updateDevicePriceAfterMonthlyInterest()"
                                            class="form-control form-control-sm text-right"
                                            data-parsley-required="true" data-parsley-trigger="change">
                                        <option value="">-- اختار عدد شهور --</option>
                                        <option value="0">غير محدد</option>
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                        <option value="7">7</option>
                                        <option value="8">8</option>
                                        <option value="9">9</option>
                                    </select>
                                </div>

                                <div class="col-6">
                                    <span class="pull-right text-size-15 mb-1">الفائدة الشهرية</span>
                                    <input id="monthlyInterest" name="monthlyInterest"
                                           oninput="updateDevicePriceAfterMonthlyInterest()"
                                           class="form-control form-control-sm text-right" data-parsley-type="number"
                                           data-parsley-required="true" data-parsley-trigger="input"/>
                                </div>
                            </div>

                            <hr class="bg-primary mb-2">

                            <div class="container mt-1">
                                <div class="row">
                                    <h5 class="pull-right">
                                        الجهاز قسط:
                                        <span id="devicePriceAfterMonthlyInterestSpan"> 0 + 0 * 0 = 0</span>
                                    </h5>
                                </div>

                                <div class="row">
                                    <h5 class="pull-right">
                                        المبلغ المتبقي:
                                        <span id="remainAmountSpan"> 0 - 0 = 0</span>
                                    </h5>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="mt-2">
                        <label class="pull-right">يوم دفع القسط</label>
                        <select name="paymentDay" class="form-control text-right"
                                data-parsley-required="true" data-parsley-trigger="change">
                            <option value="">-- اختار يوم الدفع --</option>
                            <option value="0">غير محدد</option>
                            <option value="5">يوم 5</option>
                            <option value="10">يوم 10</option>
                            <option value="15">يوم 15</option>
                            <option value="20">يوم 20</option>
                            <option value="25">يوم 25</option>
                            <option value="30">يوم 30</option>
                        </select>
                    </div>

                    <div class="row mt-2">
                        <div class="col-6">
                            <label class="pull-right">اسم الضامن</label>
                            <input name="guarantorName" placeholder="اسم الضامن"
                                   class="form-control text-right" data-parsley-maxlength="50"
                                   data-parsley-required="true" data-parsley-trigger="input"/>
                        </div>

                        <div class="col-6">
                            <label class="pull-right">تيليفون الضامن</label>
                            <input name="guarantorPhone" placeholder="تيليفون الضامن"
                                   class="form-control text-right"
                                   data-parsley-type="digits"
                                   data-parsley-minlength="11" data-parsley-maxlength="11"
                                   data-parsley-required="true" data-parsley-trigger="input"/>
                        </div>
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


