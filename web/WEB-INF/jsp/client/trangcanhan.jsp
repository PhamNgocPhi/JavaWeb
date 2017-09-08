<%@page import="dao.KhoaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="dao.LopHocDao"%>
<%@page import="dao.DangKyHocDao"%>
<%@page import="dao.HocVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);

    dao.HocVienDao hvDao = new HocVienDao();
    pageContext.setAttribute("hvDao", hvDao, PageContext.PAGE_SCOPE);

    dao.DangKyHocDao dkhDao = new DangKyHocDao();
    pageContext.setAttribute("dkhDao", dkhDao, PageContext.PAGE_SCOPE);

    dao.LopHocDao lhDao = new LopHocDao();
    pageContext.setAttribute("lhDao", lhDao, PageContext.PAGE_SCOPE);

    dao.KhoaHocDao khDao = new KhoaHocDao();
    pageContext.setAttribute("khDao", khDao, PageContext.PAGE_SCOPE);
%>
<p:newtag_file title="Trang cá nhân" css="trangcanhan" clietjs="trangCaNhan">
    <jsp:attribute name="content">
        <c:set var="userID" value="${sessionScope.userSession.getUserId()}"></c:set>
        <c:set var="dangKy" value="${dkhDao.findByMaHV(userID)}"></c:set>
        <c:set var="maLop" value="${dangKy.getMaLH()}"></c:set>
        <c:set var="lopHoc" value="${lhDao.findLopById(maLop)}"></c:set>
            <div class="content-canhan container">
                <div class="ttCanhan">
                    <p>
                        <b>Họ tên: </b>
                    ${hvDao.findByUserID(sessionScope.userSession.getUserId()).getTenHV()}
                </p>
                <p>
                    <b>Địa chỉ email: </b>
                    ${sessionScope.userSession.getEmail()}
                </p>
                <p>
                    <b>Số điện thoại: </b>
                    0${hvDao.findByUserID(sessionScope.userSession.getUserId()).getSdtHV()}
                </p>
                <p>
                    <b>Ngày sinh: </b>
                    ${hvDao.findByUserID(sessionScope.userSession.getUserId()).getNgaySinhHV()}
                </p>
                <p>
                    <b>Địa chỉ: </b>
                    ${hvDao.findByUserID(sessionScope.userSession.getUserId()).getDiaChiHV()}
                </p>

                <p><b>Lớp mới đăng ký</b></p>
                <c:choose>
                    <c:when test="${maLop == null}">
                        Bạn chưa đăng ký lớp học nào <br>
                    </c:when>
                    <c:otherwise>
                        <table class="table table-bordered table-responsive">
                            <thead>
                                <tr>
                                    <th>Khóa học</th>
                                    <th>Lớp</th>
                                    <th>Thời gian học</th>
                                    <th>Ngày khai giảng</th>
                                    <th>~</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="${dangKy.getMaLH()}">
                                    <td>${khDao.findKhoaHocByMa(lopHoc.getMaKH()).getTenKH()}</td>
                                    <td>${lopHoc.getTenLop()}</td>
                                    <td>${chDao.findCaHoc(lopHoc.getMaCH()).getGioHoc()}, ${nhDao.findNgayHoc(lopHoc.getMaNH()).getNgayHoc()}</td>
                                    <td><fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${lopHoc.ngayBD}" /></td>
                                    <td>
                                        <c:if test="${dangKy.getDongTien() == true}">
                                            <p>đã đóng học phí</p>
                                        </c:if>
                                        <c:if test="${dangKy.getDongTien() == false}">
                                            <button class="btn btn-danger" data-toggle="modal" data-target="#ModalHuyDK">Hủy <i class="fa fa-trash-o"></i></button>
                                            </c:if>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </c:otherwise>
                </c:choose>
                
                <a href="#">Đổi mật khẩu</a>
                <br>
                <a href="#">Đăng xuất</a>
            </div>
            <div class="pop-up">
                <!-- Modal -->
                <div class="modal fade" id="ModalHuyDK" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title text-center" id="myModalLabel">Xác nhận hủy đăng ký</h4>
                            </div>
                            <div class="modal-body">
                                <p class="text-center">Bạn có chắc muốn hủy đăng ký học?</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger btnHuy" data-id="${dangKy.getMaLH()}" >Hủy đăng ký</button>
                                <button type="button" class="btn btn-primary" data-dismiss="modal">close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </jsp:attribute>
</p:newtag_file>