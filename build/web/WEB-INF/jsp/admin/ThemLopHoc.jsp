<%@page import="model.GiaoVienModel"%>
<%@page import="java.util.List"%>
<%@page import="dao.GiaoVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);

    dao.GiaoVienDao gvDao = new GiaoVienDao();
    pageContext.setAttribute("gvDao", gvDao, PageContext.PAGE_SCOPE);

%>
<p:adminLayout title="Trang quản lý lớp học" pageHeader="THÊM LỚP HỌC" styleAD="themlophoc" >
    <jsp:attribute name="contentAD" >
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form id="form-horizontal" method="POST" action="${pageContext.request.contextPath}/lophoc/them-lop-hoc.html" onsubmit="">
                    <h3 class=""text-center>${message}</h3>
                    <div class="form-group">
                        <label for="tenKH">Tên lớp học</label>                  
                        <input type="text" name="tenLop" class="form-control" id="tenLop" placeholder="Tên lớp học" value="" required="">
                    </div>
                    <div class="form-group">
                        <label>Khóa học</label>

                        <select id="disabledSelect" class="form-control" name="maKH">
                            <c:forEach var="kh" items="${listKH}" >
                                <option value="${kh.getMaKH()}">${kh.getTenKH()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="ngayBD">Ngày bắt đầu</label>
                        <input type="date"  name="ngayBD" class="form-control" id="ngayBD"  value="" required="">
                    </div>
                    <div class="form-group">
                        <label for="maCH">Ca học</label>
                        <select id="disabledSelect" class="form-control" name="maCH">
                            <c:forEach var="ch" items="${listCH}" >
                                <option value="${ch.getMaCH()}">${ch.getGioHoc()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="maNH">Ngày học</label>
                        <select id="disabledSelect" class="form-control" name="maNH">
                            <c:forEach var="nh" items="${listNH}" >
                                <option value="${nh.getMaNH()}">${nh.getNgayHoc()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary btn-block">THÊM LỚP HỌC</button>
                    </div>
            </div>

        </form>
    </div>
</div>
</jsp:attribute>
</p:adminLayout>

