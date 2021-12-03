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

<nav style="box-shadow: 0 8px 10px -1px rgba(0, 0, 0, 0.9);" dir="rtl"
     class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top scrolling-navbar">
    <a class="navbar-brand font-weight-bold" style="font-size: 30px"
       href="#">4M
        للتقسيط</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

            <li style="margin: 5px;" class="">
            <a class="btn bg-success text-white font-weight-bold"
                    style="padding: 10px;" href="/clients">
                العملاء
            </a>
            </li>


            <li style="margin-left: 5px; margin-right: 5px">
                <h1 class="text-white ">|</h1>
            </li>

            <li style="margin: 5px;" class=""><a
                    class="btn bg-light text-dark font-weight-bold"
                    style="padding: 10px;" href="/home">الرئيسية | <%=LocalDate.now().toString()%>
            </a></li>


            <li style="margin-left: 5px; margin-right: 5px">
                <h1 class="text-white ">|</h1>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/5">يوم 5</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/10">يوم 10</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/15">يوم 15</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/20">يوم 20</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/25">يوم 25</a>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-primary text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="/clients/30">يوم 30</a>
            </li>

            <li style="margin-left: 5px; margin-right: 5px">
                <h1 class="text-white">|</h1>
            </li>

            <li style="margin: 5px;"><a
                    class="btn bg-danger text-white font-weight-bold "
                    style="padding: 10px; width: 100px" href="logout">خروج</a></li>

        </ul>

    </div>
</nav>
<br>
<br>
<br>
<br>
