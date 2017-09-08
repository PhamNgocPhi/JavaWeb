<%@page import="dao.KhoaHocDao"%>
<%@page import="dao.GiaoVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    dao.KhoaHocDao khDao = new KhoaHocDao();
    pageContext.setAttribute("khDao", khDao, PageContext.PAGE_SCOPE);
    
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);
    
    dao.GiaoVienDao gvDao = new GiaoVienDao();
    pageContext.setAttribute("gvDao", gvDao, PageContext.PAGE_SCOPE);
%>
<p:adminLayout title="Trang quan ly lớp học" pageHeader="DANH SÁCH LỚP HỌC" styleAD="dataTablesbootstrap" >
    <jsp:attribute name="contentAD">
        <div class="row">
            <div class="col-sm-6">
                <div class="dataTables_length" id="dataTables-example_length">
                    <label>Hiển thị theo: 
                        <select name="dataTables-example_length" aria-controls="dataTables-example" class="form-control input-sm">
                            <option value="">Tất cả lớp học</option>
                            <option value="2">Lớp học mới mở</option>
                            <option value="3">Lớp học đang học</option>
                            <option value="1">Lớp học đã học xong</option>
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
                            <th>Mã lớp</th>
                            <th>Khóa học</th>
                            <th>Tên lớp</th>
                            <th>Ngày bắt đầu</th>
                            <th>Ngày kết thúc</th>
                            <th>Sĩ số</th>
                            <th>Giáo viên</th>
                            <th>Ca học</th>
                            <th>Ngày học</th>
                            <th>Trạng thái</th>
                            <th>~</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="listLH" items="${listLH}">
                            <tr>
                                <td>${listLH.getMaLH()}</td>
                                <td>${khDao.findKhoaHocByMa(listLH.getMaKH()).getTenKH()}</td>
                                <td>${listLH.getTenLop()}</td>
                                <td>
                                    <fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${listLH.getNgayBD()}" />
                                </td>
                                <td>
                                    <fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${listLH.getNgayKT()}" />
                                </td>
                                <td>${listLH.getSiSo()}</td>
                                <td>${gvDao.findGVById(listLH.getMaGV()).getTenGV()}</td>
                                <td>${chDao.findCaHoc(listLH.getMaCH()).getGioHoc()}</td>
                                <td>${nhDao.findNgayHoc(listLH.getMaNH()).getNgayHoc()}</td>
                                <td>
                                    <c:if test="${listLH.getTrangThai() == '1'}" >Đã học xong</c:if> 
                                    <c:if test="${listLH.getTrangThai() == '2'}" >Mới mở</c:if> 
                                    <c:if test="${listLH.getTrangThai() == '3'}" >Đang học</c:if> 
                                    </td>
    <!--                                <td><a href="${pageContext.request.contextPath}/lophoc/<c:out value="${listLH.getMaLH()}"/>/sua-lop-hoc.html" type="button" class="btn btn-primary" id="editGV" >Cập nhật</a>-->
                                <td>
                                    <button type="button" class="suaLH btn btn-primary" data-toggle="modal" data-target="#ModalLH" data-id="${listLH.getMaLH()}"><i class="fa fa-pencil"></i>  Sửa</button>
                                </td>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- /.table-responsive -->
        </div>
        <div class="modal fade" id="ModalLH" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title text-center" id="myModalLabel">Cập nhật thông tin lớp học</h4>
                    </div>
                    <div class="modal-body" id="modal-editLH">

                    </div>
                </div>
            </div>
        </div>
        <script>
            $(".suaLH").click(function () {
                var id = $(this).attr("data-id");
                $.ajax({
                    url: "sua-lop-hoc.html",
                    type: "get",
                    data: {id: id},
                    dataType: "html",
                    beforSend: function () {
                        //                    $(".img-detail").html('<p>waitting......</p>')
                    },
                    success: function (html) {
                        $("#modal-editLH").html(html);
                    }
                });
            });
        </script>
    </jsp:attribute>
</p:adminLayout>
