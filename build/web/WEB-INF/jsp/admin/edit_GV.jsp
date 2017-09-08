<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h3 class="text-center">${message}</h3>
<form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/giaovien/${requestScope.gv.maGV}/sua-giao-vien.html">
    <div class="form-group">
        <label for="maGV" class="col-sm-3 control-label">Mã giáo viên</label>
        <div class="col-sm-9">
            <input type="text" name="id" class="form-control" id="maGV" value="${gv.getMaGV()}" readonly="">
        </div>
    </div>
    <div class="form-group">
        <label for="tenGV" class="col-sm-3 control-label">Họ tên</label>
        <div class="col-sm-9">
            <input type="text" name="name" class="form-control" id="tenGV" value="${gv.getTenGV()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="ngaySinhGV" class="col-sm-3 control-label">Ngày sinh</label>
        <div class="col-sm-9">
            <input type="date"  name="ngaysinh" class="form-control" id="ngaySinhGV" value="${gv.getNgaySinhGV()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label for="sdtGV" class="col-sm-3 control-label">Số điện thoại</label>
        <div class="col-sm-9">
            <input type="text" name="sdt" class="form-control" id="sdtGV" value="${gv.getSdtGV()}" required="">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">giới tính</label>
        <div class="col-sm-9">
            <c:if test="${gv.gioiTinhGV}">
                <label class="radio-inline">
                    <input type="radio" name="gioitinh" id="gioiTinhGV" value="true" checked="true" r> Nam
                </label>
                <label class="radio-inline">
                    <input type="radio" name="gioitinh" id="gioiTinhGV" value="false"> nữ
                </label>
            </c:if>
            <c:if test="${not gv.gioiTinhGV}">
                <label class="radio-inline">
                    <input type="radio" name="gioitinh" id="gioiTinhGV" value="true" > Nam
                </label>
                <label class="radio-inline">
                    <input type="radio" name="gioitinh" id="gioiTinhGV" value="false" checked="true"> nữ
                </label>
            </c:if>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-3 control-label">Tình trạng</label>
        <div class="col-sm-9">
            <c:choose>
                <c:when test="${gv.trangthai eq false}"> 
                    <label class="radio-inline">
                        <input type="radio" name="tinhtrang" id="trangthai" value="true" > Đang dạy
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="tinhtrang" id="trangthai" value="false" checked=""> Đã khóa
                    </label>
                </c:when> 
                <c:otherwise> 
                    <label class="radio-inline">
                        <input type="radio" name="tinhtrang" id="trangthai" value="true" checked=""> Đang dạy
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="tinhtrang" id="trangthai" value="false"> Đã khóa
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

