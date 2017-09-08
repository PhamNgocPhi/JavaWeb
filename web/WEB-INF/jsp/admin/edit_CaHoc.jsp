<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page pageEncoding="UTF-8"contentType="text/html; charset = UTF-8" %>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly lịch học" pageHeader="CẬP NHẬT THÔNG TIN CA HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <!-- /.panel-body -->

        <div class="formEditGV col-md-6 col-md-offset-3">
            <h3 class="text-center">${message}</h3>
            <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/lichhoc/${requestScope.ch.getMaCH()}/sua-ca-hoc.html">
                <div class="form-group">
                    <label for="maCH" class="col-sm-3 control-label">Mã ca học</label>
                    <div class="col-sm-9">
                        <input type="text" name="maCH" class="form-control" id="maCH" value="${ch.getMaCH()}" readonly="">
                    </div>
                </div>
                <div class="form-group">
                    <label for="gioHoc" class="col-sm-3 control-label">Giờ học</label>
                    <div class="col-sm-9">
                        <input type="text" name="gioHoc" class="form-control" id="gioHoc" value="${ch.getGioHoc()}" required="">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                    </div>
                </div>
            </form>
        </div>

    </jsp:attribute>
</p:adminLayout>