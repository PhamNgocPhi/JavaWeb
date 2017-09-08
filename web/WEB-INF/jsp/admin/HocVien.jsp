<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly hoc vien" pageHeader="DANH SÁCH HỌC VIÊN" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="row">
            
            <div class="col-sm-6 pull-right">
                <div id="dataTables-example_filter" class="dataTables_filter pull-right">
                    <label>Tìm kiếm: 
                        <input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example">
                    </label>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Mã</th>
                            <th>Họ tên</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>Địa chỉ học viên</th>
                            <th>Số điện thoại</th>
                            <th>UserID</th>
                            <th>~</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listHV" items="${listHV}">
                            <tr>
                                <td>${listHV.getMaHV()}</td>
                                <td>${listHV.tenHV}</td>
                                <td><fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${listHV.getNgaySinhHV()}" /></td>
                                <td>
                                    <c:if test="${listHV.getGioiTinhHV() == true}">Nam</c:if> 
                                    <c:if test="${listHV.getGioiTinhHV() == false}">Nữ</c:if> 
                                </td>
                                <td>${listHV.diaChiHV}</td>
                                <td>
                                    ${listHV.getSdtHV()}
                                </td>
                                <td>
                                    ${listHV.getUserID()}
                                </td>
                                <td><a href="${pageContext.request.contextPath}/giaovien/<c:out value="${listHV.maHV}"/>/sua-giao-vien.html" type="button" class="btn btn-primary" id="editGV" >cập nhật</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        
    </jsp:attribute>
</p:adminLayout>