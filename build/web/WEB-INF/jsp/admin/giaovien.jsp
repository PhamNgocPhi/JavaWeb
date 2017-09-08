<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:adminLayout title="Trang quan ly giao vien" pageHeader="DANH SÁCH GIÁO VIÊN" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="dataTables-example_length">
                    <label>Hiển thị theo: 
                        <select id="mySelect" name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                            <option value="">Tất cả giáo viên</option>
                            <option value="true">Giáo viên đang giảng dạy</option>
                            <option value="false">Giáo viên đang nghỉ</option>
                        </select>
                    </label>
                </div>
            </div>
            <script>
                $('#mySelect').change(function () {
                    var val = $("#mySelect option:selected").text();
                    
                })
            </script>
            <div class="col-sm-6">
                <div id="dataTables-example_filter" class="dataTables_filter pull-right">
                    <label>Tìm kiếm: 
                        <input type="search" class="form-control input-sm" placeholder="" aria-controls="dataTables-example">
                    </label>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Mã giáo viên</th>
                            <th>Họ tên</th>
                            <th>Ngày sinh</th>
                            <th>Giới tính</th>
                            <th>Số điện thoại</th>
                            <th>Trạng thái</th>
                            <th>~</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listGV" items="${listGV}">
                            <tr>
                                <td id="maGV">${listGV.getMaGV()}</td>
                                <td>${listGV.tenGV}</td>
                                <td><fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${listGV.getNgaySinhGV()}" /></td>
                                <td>
                                    <c:if test="${listGV.getGioiTinhGV() == true}">Nam</c:if> 
                                    <c:if test="${listGV.getGioiTinhGV() == false}">Nữ</c:if> 
                                    </td>
                                    <td>${listGV.getSdtGV()}</td>
                                <td>
                                    <c:if test="${listGV.getTrangthai() == true}">Đang dạy</c:if> 
                                    <c:if test="${listGV.getTrangthai() == false}">Đã khóa</c:if> 
                                    </td>
                                    <td>
                                        <button type="button" class="suaGV btn btn-primary" data-toggle="modal" data-target="#ModalGV" data-id="${listGV.getMaGV()}"><i class="fa fa-pencil"></i>  Sửa</button>
                                </td>
<!--                                    <td><a href="${pageContext.request.contextPath}/giaovien/<c:out value="${listGV.maGV}"/>/sua-giao-vien.html" type="button" class="btn btn-primary" id="editGV" >cập nhật</a></td>-->
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.panel-body -->

        <div class="modal fade" id="ModalGV" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title text-center" id="myModalLabel">Cập nhật thông tin giáo viên</h4>
                    </div>
                    <div class="modal-body" id="modal-editGV">

                    </div>
                </div>
            </div>
        </div>
        <script>
            $(".suaGV").click(function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: "giaovien/sua-giao-vien.html",
                    type: "get",
                    data: {id: id},
                    dataType: "html",
                    beforSend: function () {
                        //                    $(".img-detail").html('<p>waitting......</p>')
                    },
                    success: function (html) {
                        $("#modal-editGV").html(html);
                    }
                });
            });
        </script>
    </jsp:attribute>
</p:adminLayout>