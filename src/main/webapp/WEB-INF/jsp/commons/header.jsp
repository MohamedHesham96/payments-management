<%@page import="java.time.LocalDate" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%
    if (session.getAttribute("username") == null) {
%>

<jsp:forward page="../login.jsp"/>

<%
    }
%>

<nav style="box-shadow: 0 8px 8px -1px rgba(0, 0, 0, 0.9);" dir="rtl"
     class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top scrolling-navbar">
    <a class="navbar-brand font-weight-bold" style="font-size: 25px"
       href="#">4M
        للتقسيط
        <small class="text-size-15">
            (فرع حسان فون)
        </small>
    </a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li style="margin: 5px;" class="">
                <a class="btn btn-sm text bg-light text-dark font-weight-bold"
                        style="padding: 8px;" href="/home">
                    الرئيسية
                </a>
            </li>


            <li style="margin-left: 5px; margin-right: 5px">
                <h2 class="text-white ">|</h2>
            </li>

            <li style="margin: 5px;" class="">
                <a class="btn btn-sm text font-weight-bold <%= Integer.parseInt(session.getAttribute("totalLateContracts").toString()) == 0 ? "bg-success" : "bg-danger"%>"
                   style="padding: 8px;" href="/notifications">
                    <span class="badge badge-light font-weight-bold">
                        <%= session.getAttribute("totalLateContracts") %>
                    </span>
                </a>
            </li>

            <li style="margin: 5px;" class="">
                <a class="btn btn-sm text bg-success text-white font-weight-bold"
                   style="padding: 8px;" href="/clients">
                    العملاء
                </a>
            </li>

            <li style="margin: 5px;" class="">
                <a class="btn btn-sm text bg-success text-white font-weight-bold"
                   style="padding: 8px;" href="/contracts">
                    العقود
                </a>
            </li>

            <li style="margin-left: 5px; margin-right: 5px">
                <h2 class="text-white ">|</h2>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/5">يوم 5</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/10">يوم 10</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/15">يوم 15</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/20">يوم 20</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/25">يوم 25</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/30">يوم 30</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-primary text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/clients/paymentDay/0">غير محدد</a>
            </li>

            <li style="margin-left: 5px; margin-right: 5px">
                <h2 class="text-white">|</h2>
            </li>

            <li style="margin: 5px;"><a
                    class="btn btn-sm text bg-danger text-white font-weight-bold "
                    style="padding: 8px; width: 100px" href="/logout">خروج</a></li>
        </ul>
    </div>
</nav>
<br>
<br>
<br>
<br>
