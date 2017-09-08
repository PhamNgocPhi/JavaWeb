<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>

<p:adminLayout title="Trang quan ly khóa học" pageHeader="DANH SÁCH KHÓA HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="dataTables-example_length">
                    <label>Hiển thị theo: 
                        <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                            <option value="10">Tất cả khóa học</option>
                            <option value="25">Khóa học đang mở</option>
                            <option value="50">Khóa học đang khóa</option>
                        </select>
                    </label>
                </div>
            </div>
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
                            <th>Mã khóa học</th>
                            <th>Tên khóa học</th>
                            <th>Số buổi</th>
                            <th>Học phí</th>
                            <th>Mô tả</th>
                            <th>Trạng thái</th>
                            <th>~</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listKH" items="${listKH}">
                            <tr>
                                <td id="maKH">${listKH.getMaKH()}</td>
                                <td>${listKH.tenKH}</td>
                                <td>${listKH.getSoBuoi()}</td>
                                <td>
                                    <fmt:formatNumber type="number" maxFractionDigits="3" value="${listKH.getHocPhi()}"/>
                                </td>
                                <td>${listKH.getMoTa()}</td>
                                <td>
                                    <c:if test="${listKH.getTrangThai() == true}">Đang mở</c:if> 
                                    <c:if test="${listKH.getTrangThai() == false}">Đã khóa</c:if> 
                                </td>
                                <td> 
                                        <button type="button" class="suaKH btn btn-primary" data-toggle="modal" data-target="#ModalKH" data-id="${listKH.getMaKH()}"><i class="fa fa-pencil"></i>  Sửa</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <div class="modal fade" id="ModalKH" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title text-center" id="myModalLabel">Cập nhật thông tin khóa học</h4>
                    </div>
                    <div class="modal-body" id="modal-editKH">

                    </div>
                </div>
            </div>
        </div>
        <script>
            $(".suaKH").click(function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: "sua-khoa-hoc.html",
                    type: "get",
                    data: {id: id},
                    dataType: "html",
                    beforSend: function () {
                    },
                    success: function (html) {
                        $("#modal-editKH").html(html);
                        
                    }
                });
            });
        </script>
    </jsp:attribute>
</p:adminLayout>