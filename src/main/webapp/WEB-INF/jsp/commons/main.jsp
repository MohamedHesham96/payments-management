<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: bassem
  Date: ١٣‏/٥‏/٢٠٢٠
  Time: ٩:٠٥ م
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html class="no-js">
<head>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style-ar.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/font-awesome.css"/>">
    <link href="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">
    <script src="<c:url value="/plugins/Jquery/jquery-3.6.0.js"/>"></script>
    <script src="<c:url value="/bootstrap/bootstrap.min.js"/>"></script>
    <link rel="stylesheet" href="<c:url value="/plugins/toastr/toastr.min.css"/>">
    <link rel="script" href="<c:url value="/plugins/toastr/toastr.js"/>">
    <script src="<c:url value="/js/commons.js"/>"></script>
    <script src="<c:url value="/plugins/parsley/parsley.js"/>"></script>
    <script src="<c:url value="/plugins/parsley/ar.js"/>"></script>
    <script src="<c:url value="/plugins/bootbox/bootbox.min.js"/>"></script>
    <script src="<c:url value="/plugins/bootbox/bootbox.locales.min.js"/>"></script>

</head>

<!-- body -->
<body  background="/images/background.jpg" style="  background-attachment: fixed;
background-repeat: no-repeat; background-position: center; background-size: cover">

<tiles:insertAttribute name="header"/>

<tiles:insertAttribute name="main-content"/>

<tiles:insertAttribute name="footer"/>
</div>

<script src="<c:url value="/plugins/toastr/toastr.min.js"/>"></script>
<script src="<c:url value="/plugins/bootbox/bootbox.min.js"/>"></script>
<script src="<c:url value="/plugins/bootbox/bootbox.locales.min.js"/>"></script>

</body>
</html>

