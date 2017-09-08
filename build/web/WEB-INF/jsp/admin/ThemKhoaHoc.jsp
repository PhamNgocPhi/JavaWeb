<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly khoa hoc" pageHeader="THÊM KHÓA HỌC" styleAD="themgiaovien" >
    <jsp:attribute name="contentAD" >
        <div class="row">
            <div class="col-md-6 col-md-offset-3">
                <form id="formCreat" name="createGV" method="POST" action="${pageContext.request.contextPath}/khoahoc/them-khoa-hoc.html" onsubmit="">
                    <h3 class=""text-center>${message}</h3>
                    <div class="form-group">
                        <label for="tenKH">Tên khóa học</label>
                        <p class="txtError pull-right" id="Erhoten"></p>
                        <input type="text" name="tenKH" class="form-control" id="tenKH" placeholder="Tên khóa học" required="">
                    </div>
                    <div class="form-group">
                        <label for="soBuoi">Số buổi</label>
                        <input type="number" name="soBuoi" class="form-control" id="soBuoi" required="">
                    </div>
                    <div class="form-group">
                        <label for="hocPhi">Học phí</label>
                        <input type="number" name="hocPhi" class="form-control" id="hocPhi" required="">
                    </div>
                    <div class="form-group">
                        <label for="moTa">Mô tả</label>
                        <textarea rows="3" type="text" name="moTa" class="form-control" id="moTa" placeholder="Mô tả về khóa học" required=""></textarea>
                    </div>               
                    
                    <button type="submit" class="btn btn-block btn-lg btn-primary">Thêm khóa học</button>
                </form>
            </div>
<!--            <div class="col-md-4">
                <h4 class="text-center">Thông tin giáo viên vừa thêm</h4>
            </div>-->

        </div>
    </jsp:attribute>
</p:adminLayout>