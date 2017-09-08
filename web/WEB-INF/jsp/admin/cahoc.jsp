<%-- 
    Document   : cahoc
    Created on : Nov 23, 2016, 9:46:11 PM
    Author     : ThuCuc
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly ca hoc" pageHeader="DANH SÁCH CA HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="panel-body ">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Mã ca học</th>
                                    <th>Giờ học</th>
                                    <th>~</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listCH}" var="listCH" >
                                    <tr>
                                        <td>${listCH.getMaCH()}</td>
                                        <td>${listCH.getGioHoc()}</td>
                                        <td><a href="${pageContext.request.contextPath}/cahoc/<c:out value="${listCH.getMaCH()}"/>/sua-ca-hoc.html" type="button" class="btn btn-primary" id="editGV" ><i class="fa fa-pencil"></i>  Sửa</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->
    </jsp:attribute>
</p:adminLayout>