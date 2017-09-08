<%-- 
    Document   : index
    Created on : Nov 25, 2016, 2:01:25 PM
    Author     : ThuCuc
--%>

<%@page import="counter.SessionCounter"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    counter.SessionCounter counter = new SessionCounter();
    pageContext.setAttribute("counter", counter, PageContext.PAGE_SCOPE);
%>
<p:adminLayout title="Trang quan ly ngay hoc" pageHeader="DANH SÁCH NGÀY HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="panel-body">
            <div class="row">
                <h3>Đây là trang chủ</h3>
            </div>
            <!-- /.table-responsive -->
        </div>
        <c:set var="counter" value="${session.getAttribute("counter")}"/>
        Number of online user(s): ${counter.getActiveSessionNumber()}
        <!-- /.panel-body -->
    </jsp:attribute>
</p:adminLayout>