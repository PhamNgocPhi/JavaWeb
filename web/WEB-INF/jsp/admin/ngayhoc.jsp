<%-- 
    Document   : ngayhoc
    Created on : Nov 23, 2016, 9:56:58 PM
    Author     : ThuCuc
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly ngay hoc" pageHeader="DANH SÁCH NGÀY HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6 col-md-offset-3">
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>Mã ngày học</th>
                                    <th>Ngày học</th>
                                    <th>~</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${listNH}" var="listNH" >
                                    <tr>
                                        <td>${listNH.getMaNH()}</td>
                                        <td>${listNH.getNgayHoc()}</td>
                                        <td><a href="${pageContext.request.contextPath}/ngayhoc/<c:out value="${listNH.getMaNH()}"/>/sua-ngay-hoc.html" type="button" class="btn btn-primary" id="editGV" ><i class="fa fa-pencil"></i>  Sửa</a></td>
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