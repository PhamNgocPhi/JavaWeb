<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly lịch học" pageHeader="SỬA NGÀY HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <!-- /.panel-body -->

        <div class="formEditGV col-md-6 col-md-offset-3">
            <h3 class="text-center">${message}</h3>
            <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/ngayhoc/${requestScope.nh.getMaNH()}/sua-ngay-hoc.html">
                <div class="form-group">
                    <label for="maNH" class="col-sm-3 control-label">Mã ngày học</label>
                    <div class="col-sm-9">
                        <input type="text" name="maNH" class="form-control" id="maNH" value="${nh.getMaNH()}" readonly="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="ngayHoc" class="col-sm-3 control-label">Giờ học</label>
                    <div class="col-sm-9">
                        <input type="text" name="ngayHoc" class="form-control" id="ngayHoc" value="${nh.getNgayHoc()}" required="">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-primary">chỉnh sửa</button>
                    </div>
                </div>
            </form>
        </div>

    </jsp:attribute>
</p:adminLayout>