<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<table
        class="table table-bordered table-striped table-dark table-sm">

    <thead class="thead-inverse bg-secondary shadow"
           style="position: -webkit-sticky; position: sticky; top: 0; z-index: 2;">

    <tr>
        <th>الاسم</th>
        <th>التيليفون</th>
    </tr>

    </thead>

    <tbody>
    <c:forEach items="${clients}" var="client">
        <tr>
            <td>
                    ${client.name}
            </td>
            <td>
                    ${client.phone}
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>