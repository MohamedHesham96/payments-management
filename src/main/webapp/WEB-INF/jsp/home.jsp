<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">
<div style="text-align: right;" class="container ">

    <div onclick="showToggle();"
         class=" col-xs-6 card bg-secondary text-white"
         style="width: 18rem; margin-left: 820px;">
        <div class="card-header text-white font-weight-bold text-center"
             style="color: #c4c4c4">الحسابات
        </div>
        <ul id="gainTotalDiv" style="display: none;"
            class="list-group list-group-flush">
            <li class="bg-dark list-group-item">

                <button dir="rtl" style="text-align: right;" type="button"
                        class="w-100 btn bg-info text-white font-weight-bold text-center">
                    اجمالي الربح <span style="margin-right: 20px;"
                                       class="w-50 badge badge-light text-center"> ${gainTotal}
							جنيه</span>
                </button>
            </li>
            <li class="bg-dark list-group-item">

                <button dir="rtl" style="text-align: right;" type="button"
                        class="w-100 btn bg-info text-white   font-weight-bold text-center">
                    المصاريف <span style="margin-right: 33px;"
                                   class="w-50 badge badge-light text-center">${spendingTotal}
							جنيه</span>
                </button>
            </li>
            <li class="bg-dark list-group-item">

                <button dir="rtl" style="text-align: right;" type="button"
                        class="w-100 btn bg-success  font-weight-bold text-center text-white">
                    صافي الربح <span style="margin-right: 25px;"
                                     class="w-50 badge badge-light text-center "> ${total} جنيه</span>
                </button>
            </li>

        </ul>
    </div>

    <br> <br> <br> <br> <br> <br> <br>
    <br> <br>

    <div class="row mt-3">
        <div dir='rtl' class="col-lg-12 col-md-8">
            <div class="shadow mb-4"
                 style="position: relative; height: 530px; overflow: auto;">

                <table
                        class="table table-bordered table-striped table-dark table-sm">

                    <thead class="thead-inverse bg-secondary table-bordered shadow"
                           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">

                    <tr>
                        <th>الصنف</th>
                        <th>الكيمة</th>
                        <th>السعر تجاري</th>
                        <th>سعر القطعه</th>
                        <th>اسم العميل</th>
                        <th>العملية</th>

                    </tr>
                    </thead>

                    <tbody class="font-weight-bold">

                    <c:forEach var="tempItem" items="${items}">
                        <tr>
                            <td class="col-2 pt-2">${tempItem.item}</td>
                            <td class="col-1 pt-2">${tempItem.quantity}</td>
                            <td class="col-1 pt-2">${tempItem.tradePrice}</td>
                            <td class="col-1 pt-2">${tempItem.piecePrice}</td>
                            <td class="col-2 pt-2">${tempItem.client.name}</td>

                            <td class="col-1"><a
                                    class="btn btn-danger btn-sm font-weight-bold"
                                    onclick="return confirm('هل انت متأكد من حذف هذا الصنف ؟')"
                                    href="delete-bill?id=${tempItem.id}">حذف</a></td>
                        </tr>
                    </c:forEach>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
