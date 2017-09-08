<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="/WEB-INF/tlds/myTags" %>
<p:newtag_file title="trang chu">
    <jsp:attribute name="content">
        <div class="content">
		<div class="banner">
			<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
				<!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<img src="${pageContext.request.contextPath}/templates/images/item1.jpg" alt="ảnh 1" >
						<div class="carousel-caption">
							<p>Khi người khác nghỉ ngơi là<br>cơ hội để bạn tiến tới</p>
						</div>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/templates/images/item2.jpg" alt="ảnh 2" >
						<div class="carousel-caption">
							<p>Uy tín chất lượng</p>
						</div>
					</div>
					<div class="item">
						<img src="${pageContext.request.contextPath}/templates/images/item3.jpg" alt="ảnh 3" >
						<div class="carousel-caption">
							<p>Đảm bảo đầu ra</p>
						</div>
					</div>
				</div>

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
		</div>
		<!-- /endBanner -->
		<div class="LoTrinh">
			<div class="title">
				<h1>Lộ trình học toeic cùng ms.hoa</h1>
				<div class="line"></div>
			</div>
			<div class="listCourse row">
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>Khóa Pre TOEIC</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>Khóa TOEIC A</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>Khóa TOEIC B</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>Khóa TOEIC C</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>Perfect Pronunciation</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class=" top-col-in">
						<a href="#"><img src="${pageContext.request.contextPath}/templates/images/pi.jpg"  alt=""></a>
						<div class="col-grid">
							<h3>TOEIC Speaking & Writing</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.</p>						 
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /endLoTrinh -->
		<div class="Why">
			<div class="title">
				<h1>Tại sao bạn nên chọn ms.hoa</h1>
				<div class="line"></div>
			</div>
			<div class="listReason row">
				<div class="col-md-3">
					<div class="reason">
						<div class="number">
							<span>1</span>
						</div>
						<h4>Đội ngũ sứ giả tràn đầy nhiệt huyết và đam mê</h4>
						<div class="clearfix"> </div>
						<p>Ở Ms Hoa toeic các bạn sẽ được thực hành cùng đội ngũ sứ giả xinh đẹp, tài năng. Các sứ giả không đơn thuần là một người giảng dạy, truyền đạt kiến thức mà còn là người truyền cảm hứng, giúp bạn khám phá Tiếng Anh bằng chính niềm đam mê của mình.</p>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="reason">
						<div class="number">
							<span>2</span>
						</div>
						<h4>PHƯƠNG PHÁP PHẢN XẠ + TRUYỀN CẢM HỨNG</h4>
						<div class="clearfix"> </div>
						<p>Ms Hoa Giao tiếp xây dựng mô hình thực hành tiếng Anh Giao tiếp số 1 Việt Nam với phương pháp Phản xạ kết hợp với Truyền cảm hứng, giúp học viên khám phá vẻ đẹp của Tiếng Anh, từ đó theo đuổi, nuôi dưỡng tình yêu tiếng Anh ngày một lớn hơn.</p>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="reason">
						<div class="number">
							<span>3</span>
						</div>
						<h4>GIÁO TRÌNH CHUYÊN NGHIỆP TỰ BIÊN SOẠN</h4>
						<div class="clearfix"> </div>
						<p>Toàn bộ giáo trình học do chính Ms Hoa biên soạn và thiết kế dựa trên nhu cầu sử dụng tiếng Anh trong giao tiếp hằng ngày cũng như trong môi trường làm việc của bạn. Giáo trình được biên soạn riêng biệt, phù hợp với năng lực của từng học viên.</p>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="reason">
						<div class="number">
							<span>4</span>
						</div>
						<h4>Được tham gia các hoạt động ngoại khóa</h4>
						<div class="clearfix"> </div>
						<p>Với mỗi khóa học, Ms Hoa tặng bạn tài khoản online với các bài tập chỉ dành riêng cho học viên. Với hình thức kết hợp học online và offline, bạn không chỉ đạt mục tiêu đặt ra mà còn học tiếng Anh với đam mê và thực sự yêu thích.</p>
					</div>
				</div> <!-- item -->
			</div>
		</div>
		<!-- /endWhy -->
		<div class="listTeacher">
			<div class="title">
				<h1>Đội ngũ giáo viên tại ms.hoa</h1>
				<div class="line"></div>
			</div>
			<div class="imgTeacher row">
				<div class="col-md-3">
					<div class="itemTecher">
						<a href="#">
							<div class="img"><img src="${pageContext.request.contextPath}/templates/images/31.jpg" alt="img"></div>
							<div class="info">
								<h4>Nguyen Van Abc</h4>
								<p>Description goes here</p>
							</div>
						</a>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="itemTecher">
						<a href="#">
							<div class="img"><img src="${pageContext.request.contextPath}/templates/images/33.jpg" alt="img"></div>
							<div class="info">
								<h4>Nguyen Van Abc</h4>
								<p>Description goes here</p>
							</div>
						</a>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="itemTecher">
						<a href="#">
							<div class="img"><img src="${pageContext.request.contextPath}/templates/images/32.jpg" alt="img"></div>
							<div class="info">
								<h4>Nguyen Van Abc</h4>
								<p>Description goes here</p>
							</div>
						</a>
					</div>
				</div> <!-- item -->
				<div class="col-md-3">
					<div class="itemTecher">
						<a href="#">
							<div class="img"><img src="${pageContext.request.contextPath}/templates/images/34.jpg" alt="img"></div>
							<div class="info">
								<h4>Nguyen Van Abc</h4>
								<p>Description goes here</p>
							</div>
						</a>
					</div>
				</div> <!-- item -->

			</div>
		</div>
		<!-- /end listTeacher -->
		<div class="content-bot row">
			<div class="col-md-8 col-md-offset-2">
				<h1 class="text-center">Khi người khác nghỉ ngơi là cơ hội để bạn tiến tới!</h1>
				<button class="btn btnLogin btn-lg">Click để bắt đầu hành trình tiếng anh cùng MS.HOA</button>
			</div>
		</div>
	</div>
        </jsp:attribute>
</p:newtag_file>
