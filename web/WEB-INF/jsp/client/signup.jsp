<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags/form" %>
<p:newtag_file title="dang nhap hoac dang ky" css="login">
    <jsp:attribute name="content">
        <div class="content-login">
            <h2 class="text-center">Ms Hoa TOEIC, nơi chắp cánh ước mơ và khơi dậy tình yêu ngôn ngữ</h2>
            <div class="form-login">
                <ul class="tabGroup">
                    <li class="tab text-center active">
                        <a href="#login">Đăng nhập</a>
                    </li>
                    <li class="tab text-center">
                        <a href="#signup">Đăng ký</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="login">
                        <form id="login" method="POST" action="${pageContext.request.contextPath}/user/login.html" onsubmit="return checkLogin()" >
                            <h4 class="text-center">${message}</h4>
                            <div class="form-group">
                                <label for="email">Địa chỉ email</label>
                                <p id="errorEmail" class="pull-right"></p>
                                <input type="email" class="form-control input-lg" name="email" id="email" placeholder="Email" onblur="javascript:checkLogin();" />
                            </div>
                            <div class="form-group">
                                <label for="pass">Mật khẩu</label>
                                <input type="password" class="form-control input-lg" name="pass" id="pass" placeholder="Password"/>
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox"> Ghi nhớ tài khoản
                                </label>
                                <a href="#" class="pull-right">Bạn quên mật khẩu?</a>
                            </div>
                            <input class="hidden" name="command" value="dangnhap" readonly="true">
                            <button type="submit" class="btn btn-block btn-lg btnLogin">Đăng Nhập</button>
                        </form>
                    </div>
                    <div id="signup">
                        <form id="signupForm" method="POST" action="${pageContext.request.contextPath}/user/dang-ky-tai-khoan.html" onsubmit="return formSigup())" >
                            <h4 class="text-center">${message}</h4>
                            <div class="form-group">
                                <label for="hoTen">Họ tên</label>
                                <p class="txtError pull-right" id="Erhoten"></p>
                                <input type="text" class="form-control input-lg" name="hoten" id="hoTen" placeholder="Họ Tên" required="">
                            </div>
                            <div class="form-group">
                                <label for="emailHV">Email address</label>
                                <p id="errorEmailHV" class="pull-right"></p>
                                <input type="email" class="form-control input-lg" name="email" id="emailHV" placeholder="Email" required="" onblur="javascript:checkEmailSignup()">
                            </div>
                            <div class="form-group">
                                <label for="password">Mật khẩu</label>
                                <input type="password" class="form-control input-lg" id="passwordHV" name="pass" placeholder="Password" required="">
                            </div>
                            <div class="form-group">
                                <label for="ConfirmPassword">Nhập lại mật khẩu</label>
                                <p id="errorConfirm" class="pull-right"></p>
                                <input type="password" class="form-control input-lg" id="ConfirmPasswordHV" name="ConfirmPassword" placeholder="Nhập lại mật khẩu" onblur="javascript:checkPassSignup()" required="">
                            </div>
                            <div class="form-group">
                                <label for="soDienThoai">Số điện thoại</label>
                                <input type="number" min="number" class="form-control input-lg" id="soDienThoai" name="sdt" placeholder="Số điện thoại" required="">
                            </div>
                            <div class="checkbox">
                                <label>
                                    <input type="checkbox" checked> Tôi đã đọc và đồng ý với các <a href="#"><b>điều khoản</b></a> của trang web.
                                    </labe>
                            </div>
                            <div class="form-group">
                                <label for="ConfirmPassword">capcha</label>
                                <p id="" class="pull-right">${messageCapcha}</p>
                                <img id="captcha_id" name="imgCaptcha" src="captcha.jpg">
                                <a href="javascript:;"
                                   title="change captcha text"
                                   onclick="document.getElementById('captcha_id').src = 'captcha.jpg?' + Math.random();  return false">
                                    <img src="images/refresh.png" />
                                </a>
                            </div>
                            <div class="form-group">
                                <label for="capcha">Nhập mã capcha</label>
                                <input type="text" class="form-control input-lg" name="capcha" placeholder="mã capcha" required="">
                            </div>
                            <button type="submit" class="btn btn-block btn-lg btnLogin">Đăng Ký</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- /end content-login -->
    </jsp:attribute>
</p:newtag_file>