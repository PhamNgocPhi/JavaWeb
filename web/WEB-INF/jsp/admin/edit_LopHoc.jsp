<%@page import="dao.KhoaHocDao"%>
<%@page import="dao.GiaoVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    dao.KhoaHocDao khDao = new KhoaHocDao();
    pageContext.setAttribute("khDao", khDao, PageContext.PAGE_SCOPE);
    
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);
    
    dao.GiaoVienDao gvDao = new GiaoVienDao();
    pageContext.setAttribute("gvDao", gvDao, PageContext.PAGE_SCOPE);
%>

<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/lophoc/${requestScope.lh.getMaLH()}/sua-lop-hoc.html">
    <h3 class=""text-center>${message}</h3>
    <div class="form-group">
        <label for="maKH" class="col-sm-3 control-label">Mã lớp học</label>
        <div class="col-sm-7">
            <input type="number" name="id" class="form-control" id="maLH" value="${lh.getMaLH()}" readonly=""/>
        </div>
    </div>
    <div class="form-group">
        <label for="tenKH" class="col-sm-3 control-label">Tên lớp học</label>  
        <div class="col-sm-7">
            <input type="text" name="tenLop" class="form-control" id="tenLop" placeholder="Tên lớp học" value="${lh.getTenLop()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="maKH" class="col-sm-3 control-label">Khóa học</label>
        <div class="col-sm-7">
            <select id="disabledSelect" class="form-control" name="maKH">
                <option value="${lh.getMaKH()}">${khDao.findKhoaHocByMa(lh.getMaKH()).getTenKH()}</option>
                <c:forEach var="kh" items="${listKH}" >
                    <option value="${kh.getMaKH()}">${kh.getTenKH()}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="ngayBD" class="col-sm-3 control-label">Ngày BD</label>
        <div class="col-sm-7">
            <input type="date"  name="ngayBD" class="form-control" id="ngayBD"  value="${lh.getNgayBD()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="ngayKT" class="col-sm-3 control-label">Ngày KT</label>

        <div class="col-sm-7">
            <input type="date"  name="ngayKT" class="form-control" id="ngayKT" value="${lh.getNgayKT()}">
        </div>
    </div>
    <div class="form-group">
        <label for="maGV" class="col-sm-3 control-label">Giáo viên</label>
        <div class="col-sm-7">
            <select id="disabledSelect" class="form-control" name="maGV">
                <option value="${lh.getMaGV()}">${gvDao.findGVById(lh.getMaGV()).getTenGV()}</option>
                <c:forEach var="gv" items="${listGV}" >
                    <option value="${gv.getMaGV()}">${gv.getTenGV()}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="maCH" class="col-sm-3 control-label">Ca học</label>
        <div class="col-sm-7">
            <select id="disabledSelect" class="form-control" name="maCH">
                <option value="${lh.getMaCH()}">${chDao.findCaHoc(lh.getMaCH()).getGioHoc()}</option>
                <c:forEach var="ch" items="${listCH}" >
                    <option value="${ch.getMaCH()}">${ch.getGioHoc()}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="maNH" class="col-sm-3 control-label">Ngày học</label>
        <div class="col-sm-7">
            <select id="disabledSelect" class="form-control" name="maNH">
                <option value="${lh.getMaNH()}">${nhDao.findNgayHoc(lh.getMaNH()).getNgayHoc()}</option>
                <c:forEach var="nh" items="${listNH}" >
                    <option value="${nh.getMaNH()}">${nh.getNgayHoc()}</option>
                </c:forEach>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label for="trangThai" class="col-sm-3 control-label">Tình trạng</label>
        <div class="col-sm-7">

            <c:choose>
                <c:when test="${lh.getTrangThai() == '1'}"> 
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="1" checked=""> Đã học xong
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="2" > Mới mở
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="3"> Đang học
                    </label>
                </c:when> 
                <c:when test="${lh.getTrangThai() == '2'}"> 
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="1" > Đã học xong
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="2" checked=""> Mới mở
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="3"> Đang học
                    </label>
                </c:when> 
                <c:when test="${lh.getTrangThai() == '3'}"> 
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="1" > Đã học xong
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="2"> Mới mở
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="3" checked=""> Đang học
                    </label>
                </c:when> 
            </c:choose>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </div>
</form>