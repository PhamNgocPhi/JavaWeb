<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly lịch học" pageHeader="THÊM NGÀY HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <!-- /.panel-body -->

        <div class="formEditGV col-md-6 col-md-offset-3">
            <h3 class="text-center">${message}</h3>
            <form class="form-horizontal" method="POST" action="${pageContext.request.contextPath}/ngayhoc/them-ngay-hoc.html">
                <div class="form-group">
                    <label for="ngayHoc" class="col-sm-3 control-label">ngày học</label>
                    <div class="col-sm-9">
                        <input type="text" name="ngayHoc" class="form-control" id="gioHoc" placeholder="thứ 3,5,7" required="">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-9">
                        <button type="submit" class="btn btn-primary">thêm ngày học</button>
                    </div>
                </div>
            </form>
        </div>

    </jsp:attribute>
</p:adminLayout>