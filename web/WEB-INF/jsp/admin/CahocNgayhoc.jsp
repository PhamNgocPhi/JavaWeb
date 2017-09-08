<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly ca hoc va ngay hoc" pageHeader="DANH SÁCH CA HỌC VÀ NGÀY HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="panel-body">
            <div class="row">
                <div class="col-md-6">
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
                                        <td><a href="${pageContext.request.contextPath}/lichhoc/<c:out value="${listCH.getMaCH()}"/>/sua-ca-hoc.html" type="button" class="btn btn-primary" id="editGV" >cập nhật</a></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-md-6">
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
                                        <td><a href="${pageContext.request.contextPath}/lichhoc/<c:out value="${listNH.getMaNH()}"/>/sua-ngay-hoc.html" type="button" class="btn btn-primary" id="editGV" >cập nhật</a></td>
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