<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>

<h3 class="text-center">${message}</h3>
<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/khoahoc/${requestScope.kh.maKH}/sua-khoa-hoc.html">
    <div class="form-group">
        <label for="maKH" class="col-sm-3 control-label">Mã khóa học</label>
        <div class="col-sm-9">
            <input type="text" name="id" class="form-control" id="maKH" value="${kh.getMaKH()}" readonly="">
        </div>
    </div>
    <div class="form-group">
        <label for="tenKH" class="col-sm-3 control-label">Tên khóa học</label>
        <div class="col-sm-9">
            <input type="text" name="tenKH" class="form-control" id="tenKH" value="${kh.getTenKH()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="sobuoi" class="col-sm-3 control-label">Số buổi</label>
        <div class="col-sm-9">
            <input type="number"  name="soBuoi" class="form-control" id="sobuoi" value="${kh.getSoBuoi()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="hocPhi" class="col-sm-3 control-label">Học phí</label>
        <div class="col-sm-9">
            <input type="number" name="hocPhi" class="form-control" id="hocPhi" value="${kh.getHocPhi()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="moTa" class="col-sm-3 control-label">Mô tả</label>
        <div class="col-sm-9">
            <textarea rows="3"  type="text" name="moTa" class="form-control" id="moTa" required=""><c:out value="${kh.moTa}" /></textarea>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">Trạng thái</label>
        <div class="col-sm-9">
            <c:choose>
                <c:when test="${kh.getTrangThai() eq false}"> 
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="true" > Đang mở
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="false" checked=""> Đã khóa
                    </label>
                </c:when> 
                <c:otherwise> 
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="true" checked=""> Đang mở
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="trangThai" id="trangthai" value="false"> Đã khóa
                    </label>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <button type="submit" class="btn btn-primary">Cập nhật</button>
        </div>
    </div>
</form>
