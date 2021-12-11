<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<linkhref
="<c:url value="/bootstrap/bootstrap.min.css"/>" rel="stylesheet">

<style>
    {
        font-size: 25px
    ;
    }

    a:hover {
        text-decoration: none;
    }
</style>

<div class="container mt-0 p-0">
    <div class="card shadow shadow-sm border-primary">
        <div class="card-header bg-primary p-2 shadow-sm text-center">
            <h4 class="card-title text-white">
                التنبيهات
            </h4>
        </div>
        <div class="row w-100 mt-2">
            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay5 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/5', 'contractsResultDiv', 0, 10);">
                    <h4 class="p-0">
                        يوم 5
                        <span class="badge badge-light">
                            ${lateContractsDay5}
                        </span>
                    </h4>
                </button>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay10 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/10', 'contractsResultDiv', 0, 10);">
                    <h4 class="p-0">
                        يوم 10
                        <span class="badge badge-light">
                            ${lateContractsDay10}
                        </span>
                    </h4>
                </button>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay15 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/15', 'contractsResultDiv', 0, 10);">
                    <h4 class="p-0">
                        يوم 15
                        <span class="badge badge-light">
                            ${lateContractsDay15}
                        </span>
                    </h4>
                </button>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay20 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/20', 'contractsResultDiv', 0, 10);">
                    <h4 class="p-0">
                        يوم 20
                        <span class="badge badge-light">
                            ${lateContractsDay20}
                        </span>
                    </h4>
                </button>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay25 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/25', 'contractsResultDiv', 0, 10);">
                    <h4 class="p-0">
                        يوم 25
                        <span class="badge badge-light">
                            ${lateContractsDay25}
                        </span>
                    </h4>
                </button>
            </div>

            <div class="col-md-2 col-sm-6 col-xs-12 m-auto p-0">
                <button class="btn text-white ${lateContractsDay30 == 0 ? "bg-success" : "bg-danger"}"
                        href="/notifications"
                        onclick="loadTable('/notifications/paymentDay/30', 'contractsResultDiv', 0,10);">
                    <h4 class="p-0">
                        يوم 30
                        <span class="badge badge-light">
                            ${lateContractsDay30}
                        </span>
                    </h4>
                </button>
            </div>
        </div>
        <div id="contractsResultDiv" class="card-body">
            <jsp:include page="_contractsResult.jsp"/>
        </div>
    </div>
</div>