<%@page import="dao.KhoaHocDao"%>
<%@page import="dao.LopHocDao"%>
<%@page import="dao.DangKyHocDao"%>
<%@page import="dao.HocVienDao"%>
<%@page import="dao.NgayHocDao"%>
<%@page import="dao.CaHocDao"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%
    dao.CaHocDao chDao = new CaHocDao();
    pageContext.setAttribute("chDao", chDao, PageContext.PAGE_SCOPE);

    LopHocDao lhDao = new LopHocDao();
    pageContext.setAttribute("lhDao", lhDao, PageContext.PAGE_SCOPE);

    dao.NgayHocDao nhDao = new NgayHocDao();
    pageContext.setAttribute("nhDao", nhDao, PageContext.PAGE_SCOPE);

    dao.HocVienDao hvDao = new HocVienDao();
    pageContext.setAttribute("hvDao", hvDao, PageContext.PAGE_SCOPE);

    dao.DangKyHocDao dkhDao = new DangKyHocDao();
    pageContext.setAttribute("dkhDao", dkhDao, PageContext.PAGE_SCOPE);

    dao.KhoaHocDao khDao = new KhoaHocDao();
    pageContext.setAttribute("khDao", khDao, PageContext.PAGE_SCOPE);
%>
<p:newtag_file title="dang ky hoc" css="dangky" clietjs="dangkyhoc">
    <jsp:attribute name="content">

        <div class="content-dangky container">
            <div class="title">
                <h1>Lịch học tại Ms.Hoa Toeic</h1>
                <div class="line"></div>
            </div>
            <div class="lichhoc">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Khóa học</th>
                            <th>Lớp</th>
                            <th>Ca học</th>
                            <th>Ngày học</th>
                            <th>Ngày khai giảng</th>
                            <th>Học phí</th>
                            <th>Đăng ký</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <c:forEach var="listMaKH" items="${listMaKH}">
                                <td rowspan="${lhDao.findLopByTTKhoaHoc(listMaKH, "2").size()+1}">${khDao.findKhoaHocByMa(listMaKH).getTenKH()}</td>
                                <c:set var="trangThai" value="2"></c:set>
                                <c:forEach var="listLH" items="${lhDao.findLopByTTKhoaHoc(listMaKH, trangThai.toString())}" >
                                <tr>
                                    <td>${listLH.tenLop}</td>
                                    <td>${chDao.findCaHoc(listLH.getMaCH()).getGioHoc()}</td>
                                    <td>${nhDao.findNgayHoc(listLH.getMaNH()).getNgayHoc()}</td>
                                    <td><fmt:formatDate type="date" pattern="dd-MM-YYYY" value="${listLH.ngayBD}" /></td>
                                    <td>
                                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${khDao.findKhoaHocByMa(listMaKH).getHocPhi()}"/>
                                    </td>
                                    <td> 
                                        <c:choose>
                                            <c:when test="${sessionScope.userSession == null}">
                                                <p>vui lòng <a href="${pageContext.request.contextPath}/user/dang-nhap-va-dang-ky.html">Đăng Nhập</a> để được đăng ký học</p>
                                            </c:when>
                                            <c:otherwise>
                                                <c:choose>
                                                    <c:when test="${hvDao.findByUserID(sessionScope.userSession.getUserId()).getMaHV() eq dkhDao.findByMaHV(sessionScope.userSession.getUserId()).getMaHV()}">
                                                        <c:choose>
                                                            <c:when test="${dkhDao.findByMaHV(sessionScope.userSession.getUserId()).getMaLH() eq listLH.getMaLH()}">
                                                                <p>Bạn đã đăng ký lớp học này</p>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <p>Bạn chi được đăng ký 1 lớp học</p>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-success btnDangKyHoc" data-toggle="modal" data-id="${listLH.getMaLH()}" data-target="#ModalDK">Đăng ký học</button>
                                                    </c:otherwise>
                                                </c:choose>

                                            </c:otherwise> 
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:forEach>
                        </tr> <!-- 1 line -->
                    </tbody>
                </table>
            </div>
            <div class="pop-up">
                <!-- Modal -->
                <div class="modal fade bs-example-modal-lg" id="ModalDK" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog modal-lg" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title text-center" id="myModalLabel">Thông tin đăng ký học</h4>
                            </div>
                            <div class="modal-body">
                                <div class="row">
                                    <div class="hienThi">
                                        <p class="text-center">Để đăng ký học, bạn vui lòng kiểm tra và điền đầy đủ các thông tin dưới đây</p>
                                        <br>
                                    </div>
                                    <div id="modalData">

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </jsp:attribute>
</p:newtag_file>