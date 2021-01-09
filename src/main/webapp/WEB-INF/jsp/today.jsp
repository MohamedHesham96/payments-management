<%@page import="org.apache.taglibs.standard.tag.common.xml.IfTag"%>
<%@page import="com.hcoder.clothingstoremanagement.entity.Incoming"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">

<title>اليوم | <%=LocalDate.now().toString()%></title>

<link href="webjars/bootstrap/4.4.1/css/bootstrap.min.css"
	rel="stylesheet">

<script type="text/javascript">
	function myFunc() {

		var submitBtn = getElementById("submitBtn");

		submitBtn.disabled = false;
	}

	function showToggle() {

		var x = document.getElementById("gainTotalDiv");
		if (x.style.display === "none") {
			x.style.display = "block";
		} else {
			x.style.display = "none";
		}
	}
</script>
</head>
<body onunload="myFunc();" background="images/wall6.jpg"
	style="background-attachment: fixed; background-repeat: no-repeat; background-size: cover;">

	<%@ include file="header.jsp"%>



	<div style="text-align: right;" class="col-12">

		<div class="card bg-secondary text-white float-right"
			onclick="showToggle();" style="width: 18rem;">
			<div class="card-header text-white font-weight-bold text-center"
				style="color: #c4c4c4">الحسابات</div>
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


		<form action="add-bills-list" method="POST">

			<div class="row mt-4">
				<div dir='rtl' class="col-lg-12 col-md-8">
					<div class="table-responsive">
						<table class=" table table-striped table-dark ">
							<thead class="thead-inverse ">
								<tr>
									<th>الكمية</th>
									<th>الصنف</th>
									<th>السعر</th>
									<th>المبلغ المدفوع</th>
									<th>العميل</th>
								</tr>
							</thead>

							<tbody>
								<%
									for (int i = 0; i < 3; i++) {
								%>
								<tr>

									<td><input name="quantity" class="form-control"
										style="text-align: center; width: 100%; height: 100%;"></td>

									<td><select name="itemId" style="width: 200px"
										class="text-center form-control" name="testselect">
											<option value="-1">--- اختر الصنف ---</option>
											<c:forEach var="tempItem" items="${warehouseItems}">

												<c:if test="${tempItem.quantity > 0}">

													<option value="${tempItem.id}">${tempItem.item}</option>

												</c:if>


											</c:forEach>

									</select></td>

									<td><input name="piecePrice"
										class="text-center form-control"
										style="width: 100%; height: 100%;"></td>


									<td><input name="payed" class="text-center form-control"
										style="width: 100%; height: 100%;"></td>

									<td><select name="clientId" style="width: 200px;"
										class="text-center form-control  mb-2 col-xs-3"
										name="clientId">
											<option value="-1">غير محدد</option>

											<c:forEach var="tempItem" items="${clientsList}">

												<option value="${tempItem.id}">${tempItem.name}</option>


											</c:forEach>

									</select></td>


								</tr>
								<%
									}
								%>
								<tr style="text-align: center;">
									<td colspan="5"><input id="submitBtn" type="submit"
										value="أضافة للفواتير"
										class="w-100 btn badge-info font-weight-bold text-center"
										onclick="this.parentNode.submit(); this.disabled=true; "
										style="width: 100%; height: 50px;"></td>

								</tr>

							</tbody>

						</table>
					</div>
				</div>
			</div>

		</form>

		<div dir='rtl' class="w-100">
			<div class="shadow"
				style="position: relative; height: 400px; overflow: auto;">
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
					<tbody>

						<c:forEach var="tempItem" items="${items}">
							<tr>
								<td>${tempItem.item}</td>
								<td>${tempItem.quantity}</td>
								<td>${tempItem.tradePrice}</td>
								<td>${tempItem.piecePrice}</td>
								<td>${tempItem.client.name}</td>

								<td style="width: 160px"><a
									style="height: 30px; font-size: 14px;"
									class="btn btn-danger text-wight
										font-weight-bold"
									onclick="return confirm('هل انت متأكد من حذف هذا الصنف ؟')"
									href="delete-bill?id=${tempItem.id}">حذف</a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>