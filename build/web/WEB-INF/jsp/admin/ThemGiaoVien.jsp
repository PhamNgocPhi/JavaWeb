<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly giao vien" pageHeader="THÊM GIÁO VIÊN" styleAD="themgiaovien" >
    <jsp:attribute name="contentAD" >
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form id="formCreat" name="createGV" method="POST" action="${pageContext.request.contextPath}/giaovien/them-giao-vien.html" onsubmit="">
                    <h3 class=""text-center>${message}</h3>
                    <div class="form-group">
                        <label for="hoTen">Họ tên</label>
                        <p class="txtError pull-right" id="Erhoten"></p>
                        <input type="text" name="hoten" class="form-control" id="hoTen" placeholder="Họ Tên" required="">
                    </div>
                    <div class="form-group">
                        <label for="ngaysinh">Ngày sinh</label>
                        <input type="date" name="ngaysinh" class="form-control" id="ngaysinh" name="ngaysinh"  required="">
                    </div>
                    <div class="form-group">
                        <label id="gioitinh">Giới tính</label>
                        <label class="radio-inline">
                            <input type="radio" name="gioitinh" id="optionsRadiosInline1" value="true" >Nam
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gioitinh" id="optionsRadiosInline2" value="false">Nữ
                        </label>
                    </div>
                    <div class="form-group">
                        <label for="soDienThoai">Số điện thoại</label>
                        <input type="text" name="sdt" class="form-control" id="soDienThoai" placeholder="Số điện thoại" required="">
                    </div>
                    <div class="form-group">
                        <label for="emailHV">Địa chỉ email</label>
                        <input type="email" name="email" class="form-control " id="emailHV" placeholder="Email" required="">
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="text" class="form-control" id="password" name="pass" placeholder="Password" required="">
                    </div>                
                    
                    <button type="submit" class="btn btn-block btn-lg btn-primary">THÊM GIÁO VIÊN</button>
                </form>
            </div>
<!--            <div class="col-md-4">
                <h4 class="text-center">Thông tin giáo viên vừa thêm</h4>
            </div>-->

        </div>
    </jsp:attribute>
</p:adminLayout>