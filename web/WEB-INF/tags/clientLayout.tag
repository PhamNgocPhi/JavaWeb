<%@tag description="put the tag description here" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="title"%>
<%@attribute name="css"%>
<%@attribute name="clietjs" %>
<%@attribute name="content" fragment="true" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>${title}</title>
        <link href="${pageContext.request.contextPath}/templates/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/templates/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/templates/css/style.css" rel="stylesheet" type="text/css" />
        <link href="${pageContext.request.contextPath}/templates/css/${css}.css" rel="stylesheet" type="text/css" />
        
         
    </head>
    <body>
        <div class="header">
            <div class="container">
                <div class="col-md-3">
                    <a href="${pageContext.request.contextPath}/home.html"><img src="${pageContext.request.contextPath}/templates/images/logo.jpg"></a>
                </div>
                <div class="col-md-7 search">
                    <div class="s-bar">
                        <form>
                            <input type="text" value="Nhập từ khóa tìm kiếm" onfocus="this.value = '';" onblur="if (this.value == '') {
                                        this.value = 'Nhập từ khóa tìm kiếm';
                                    }">
                            <input type="submit"  value="Tìm kiếm"/>
                        </form>
                    </div>
                </div>
                <div class="col-md-2">
         
                    <c:if test="${sessionScope.userSession == null}">
                        <a type="button" href="${pageContext.request.contextPath}/user/dang-nhap-va-dang-ky.html" class="btn btnLogin pull-right"><i class="fa fa-user" aria-hidden="true"></i>Đăng Nhập</a>
                    </c:if>
                    <c:if test="${sessionScope.userSession != null}">
                        <div class="dropdown taiKhoan">
                            <p class="dropdown-toggle " data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><c:out value="${userSession.getEmail()}"/><span class="caret"></span></p>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/home/trang-ca-nhan.html">Trang cá nhân</a></li>
                                <li><a href="${pageContext.request.contextPath}/user/logout.html">Đăng xuất</a></li>
                            </ul>
                        </div>
                    </c:if>
                </div>
            </div>
        </div>
        <!-- /endHeader -->
        <div class="header-bot">
            <div class="container">
                <ul class="list-inline">
                    <li><a href="${pageContext.request.contextPath}/home.html">Trang chủ</a></li>
                    <li><a href="#">về chúng tôi</a></li>
                    <li><a href="${pageContext.request.contextPath}/home/doi-ngu-su-gia.html">đội ngũ sứ giả</a></li>
                    <li><a href="khoahoc.html">Khóa học</a></li>
                    <li><a href="${pageContext.request.contextPath}/dang-ky-hoc.html">Đăng ký học</a></li>
                    <li><a href="${pageContext.request.contextPath}/home/cam-nhan-cua-hoc-vien.html">Cảm nhận học viên</a></li>
                    <li><a href="#">Tài liệu</a></li>
                </ul>
            </div>
        </div>
        <!-- /end header-bot -->
        <jsp:invoke fragment="content" />
        <!-- /endContent -->
        <div class="footer">
            <img src="${pageContext.request.contextPath}/templates/images/logo-bot.jpg" alt="logo bottom">
            <div class="clearfix"></div>
            <div class="column container">
                <div class="row">
                    <div class="col-md-4">
                        <h1>MS.HOA TOEIC</h1>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis a necessitatibus, aut accusamus. Cum adipisci ullam alias enim culpa, quae deleniti placeat provident, ipsum error officiis! Debitis cumque quae id.</p>
                    </div>
                    <div class="col-md-4 sign-gd-two">
                        <h4 class="text-center">Địa chỉ</h4>
                        <ul>
                            <li><i class="glyphicon glyphicon-map-marker" aria-hidden="true"></i>Address : 1234 Hoàng Quốc Việt <span>Hà Nội</span></li>
                            <li><i class="glyphicon glyphicon-envelope" aria-hidden="true"></i>Email : <a href="mailto:info@example.com">info@example.com</a></li>
                            <li><i class="glyphicon glyphicon-earphone" aria-hidden="true"></i>Phone : 01234 567 567</li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h1>Liên kết mạng xã hội</h1>

                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Debitis a necessitatibus, aut accusamus. Cum adipisci ullam alias enim culpa, quae deleniti placeat provident, ipsum error officiis! Debitis cumque quae id.</p>
                    </div>
                </div>
            </div>
            <div class="footer-bot">
                <h4 class="text-center"><b>Copyright <span class="glyphicon glyphicon-copyright-mark"></span> 2015 Ms.Hoa All Rights Reserved</b></h4>
            </div>
        </div>
        <!-- /endFooter -->
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/jquery-3.1.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/style.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/templates/js/${clietjs}.js"></script>
    </body>
</html>