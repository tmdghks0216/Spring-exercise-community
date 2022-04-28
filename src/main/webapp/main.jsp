<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head >
<title>운동하자!</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>
<style type="text/css">
.swiper-container {
	width: 1100px;
	height: 500px;
	overflow: hidden;
}

.swiper-slide {
	text-align: center;
	display: flex; /* 내용을 중앙정렬 하기위해 flex 사용 */
	align-items: center; /* 위아래 기준 중앙정렬 */
	justify-content: center; /* 좌우 기준 중앙정렬 */
	background-color: #fff;
	border: 5px solid silver;
	border-radius: 5px;
	box-shadow: 0 0 10px silver inset;
	box-sizing: border-box; /* 이 설정을 하지 않으면 슬라이드드가 틀어짐 */
	overflow: hidden;
}
.button1{
background:#6e7772; 
border:none;
 color: white;


}

</style>
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Main -->
		<div id="main">
			<div class="inner">

				<!-- Header -->
				<header id="header">

					<aa:login />
				</header>

			
				

				<!-- Section -->



				<section>
					<!-- 					swiper슬라이더 메인컨테이너 -->
					<div class="swiper-container">
						<div class="swiper-wrapper">
							<div class="swiper-slide">
								<a href="main.do?event=축구"><img src="img/축구.png" width="250"  height="250" > </a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=야구"><img src="img/야구.png"  width="250"  height="250" ></a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=골프"><img src="img/골프.png" width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=클라이밍"><img src="img/클라이밍.png"  width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
							<a href="main.do?event=배드민턴">	<img src="img/배드민턴.png"  width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=수영"><img src="img/수영.png"  width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=헬스"><img src="img/헬스.png"  width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
							<a href="main.do?event=스키">	<img src="img/스키.png"  width="250"  height="250" /></a>
							</div>
							<div class="swiper-slide">
								<a href="main.do?event=사이클"><img src="img/사이클.png"  width="250"  height="250"/></a>
							</div>

						</div>

						네비게이션
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>

						페이징
						<div class="swiper-pagination"></div>
					</div>

				</section>
				<!-- Section -->
				<section>
					<header class="major">
						<h2>게시물</h2>
					</header>
					<div class="posts">
						<c:forEach var="v" items="${bdata}">
						<c:choose>
										<c:when test="${v.status  == '모집완료'}">
					<article>
								<a href="detail.do?bpk=${v.bpk}" class="image"><img
									src="img/${v.bPhoto}" alt="" /></a>
								<button class="button primary" style="float: right; background:#6e7772; color: white;" >${v.status }</button>
								<h4>${v.title}</h4>
								<br>
								<br>
								<ul class="actions">
									<c:choose>
										<c:when test="${v.condition == '상관없음'}">

										</c:when>
										<c:otherwise>
											<li><button class="button primary" style="background:#6e7772; border:none; color: white;">${v.condition }</button></li>
										</c:otherwise>
									</c:choose>

									<li><button class="button primary" style="background:#6e7772;">${v.bArea}</button></li>
									<li><button class="button primary"style="background:#6e7772;">${v.event }</button></li>
								</ul>
								<div class="ditailday" style="font-size: 1.1em;">작성자 :
									${v.mid }</div>
								<div class="ditailday" style="float: right; font-size: 1.1em;">조회수
									: ${v.views }</div>
								<br>
								<br>
								<div class="ditailday" style="float: right; font-size: 1.1em;">모집기간
									: <fmt:formatDate pattern="yyyy-MM-dd" value="${v.bdate }"/> ~ ${v.period.substring(0, 10)}</div>
							</article>
										</c:when>
										<c:otherwise>
											
												<article>
								<a href="detail.do?bpk=${v.bpk}" class="image"><img
									src="img/${v.bPhoto}" alt="" /></a>
								<button class="button" style="float: right; background: ">${v.status }</button>
								<h4>${v.title}</h4>
								<br>
								<br>
								<ul class="actions">
									<c:choose>
										<c:when test="${v.condition == '상관없음'}">

										</c:when>
										<c:otherwise>
											<li><button class="button">${v.condition }</button></li>
										</c:otherwise>
									</c:choose>

									<li><button class="button">${v.bArea}</button></li>
									<li><button class="button">${v.event }</button></li>
								</ul>
								<div class="ditailday" style="font-size: 1.1em;">작성자 :
									${v.mid }</div>
								<div class="ditailday" style="float: right; font-size: 1.1em;">조회수
									: ${v.views }</div>
								<br>
								<br>
								<div class="ditailday" style="float: right; font-size: 1.1em;">모집기간
									: <fmt:formatDate pattern="yyyy-MM-dd" value="${v.bdate }"/> ~ ${v.period.substring(0, 10)}</div>
							</article>
											
											
										</c:otherwise>
									</c:choose>
						
					
						</c:forEach>
					</div>
				</section>

			</div>
		</div>

		<!-- Sidebar -->
		<aa:sideber />
	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {

			var mySwiper = new Swiper('.swiper-container', {
				slidesPerView : 4,
				slidesPerGroup : 2,
				observer : true,
				observeParents : true,
				spaceBetween : 24,
				navigation : {
					nextEl : '.swiper-button-next',
					prevEl : '.swiper-button-prev',
				},
				breakpoints : {
					1280 : {
						slidesPerView : 3,
						slidesPerGroup : 3,
					},
					720 : {
						slidesPerView : 1,
						slidesPerGroup : 1,
					}
				}
			});

		});
	</script>
</body>
</html>