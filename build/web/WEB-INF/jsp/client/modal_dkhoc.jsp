<%@page import="dao.KhoaHocDao"%>
<%@page import="dao.HocVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);

    dao.HocVienDao hvDao = new HocVienDao();
    pageContext.setAttribute("hvDao", hvDao, PageContext.PAGE_SCOPE);
    
    dao.KhoaHocDao khDao = new KhoaHocDao();
    pageContext.setAttribute("khDao", khDao, PageContext.PAGE_SCOPE);
%>
<div class="col-md-6 ttLop">
    <div class="hienthi">
        <p class="text-center">Thông tin lớp học đã đăng ký</p>
    </div>
    <form class="form-horizontal">
        <div class="form-group">
            <label for="inputKhoahoc" class="col-sm-4 control-label">Khóa Học</label>
            <div class="col-sm-8">
                <p id="khoahoc" class="form-control-static">${khDao.findKhoaHocByMa(lop.getMaKH()).getTenKH()}</p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputLophoc" class="col-sm-4 control-label">Lớp Học</label>
            <div class="col-sm-8">
                <p id="tenLop" class="form-control-static">${lop.getTenLop()}</p>
            </div>
        </div>
        <div class="form-group">
            <label for="inputThoigian" class="col-sm-4 control-label">Thời gian học</label>
            <div class="col-sm-8">
                <p id="lichHoc" class="form-control-static">${chDao.findCaHoc(lop.getMaCH()).getGioHoc()}, ${nhDao.findNgayHoc(lop.getMaNH()).getNgayHoc()}</p>
            </div>
        </div>
        <div class="form-group">
            <label for="sobuoi" class="col-sm-4 control-label">Số buổi học</label>
            <div class="col-sm-8">
                <p id="so" class="form-control-static">${khDao.findKhoaHocByMa(lop.getMaKH()).getSoBuoi()}</p>
            </div>
        </div>
        <div class="form-group">
            <label for="ngaybd" class="col-sm-4 control-label">Ngày khai giảng</label>
            <div class="col-sm-8">
                <p id="ngayKG" class="form-control-static"><fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${lop.getNgayBD()}" /></p>
            </div>
        </div>
        <div class="form-group">
            <label for="hocphi" class="col-sm-4 control-label">Học phí</label>
            <div class="col-sm-8">
                <p id="hocphi" class="form-control-static"><fmt:formatNumber type="number" maxFractionDigits="3" value="${khDao.findKhoaHocByMa(lop.getMaKH()).getHocPhi()}"/></p>
            </div>
        </div>

    </form>
</div>
<div class="col-md-6">
    <div class="hienthi">
        <p class="text-center">Thông tin cá nhân</p>
    </div>
    <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/dang-ky-hoc/loadModal.html">
        <input type="number" name="maHV" class="form-control hidden" value="${sessionScope.userSession.getUserId()}">
        <input type="number" name="maLH" class="form-control hidden" value="${lop.getMaLH()}">
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-4 control-label">Họ tên</label>
            <div class="col-sm-8">
                <input type="text" name="hoten" class="form-control" id="inputEmail3" value="${hvDao.findByUserID(sessionScope.userSession.getUserId()).getTenHV()}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-4 control-label">Email</label>
            <div class="col-sm-8">
                <input type="email" name="email" class="form-control" id="inputEmail3" readonly="" value="${sessionScope.userSession.getEmail()}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputSDT" class="col-sm-4 control-label">Số điện thoại</label>
            <div class="col-sm-8">
                <input type="text" name="sdt" class="form-control" readonly="" id="inputSDT" value="0${hvDao.findByUserID(sessionScope.userSession.getUserId()).getSdtHV()}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputngaysinh" class="col-sm-4 control-label">Ngày sinh</label>
            <div class="col-sm-8">
                <input type="date" name="ngaysinh" class="form-control" id="inputngaysinh" value="${hvDao.findByUserID(sessionScope.userSession.getUserId()).getNgaySinhHV()}">
            </div>
        </div>
        <div class="form-group">
            <label for="inputdiachi" class="col-sm-4 control-label" value="${hvDao.findByUserID(sessionScope.userSession.getUserId()).getDiaChiHV()}">Địa chỉ</label>
            <div class="col-sm-8">
                <textarea name="diachi" class="form-control" rows="3"></textarea>
            </div>
        </div>
        <button type="submit" class="btn btn-primary pull-right">Đăng ký học</button>
    </form>
</div>