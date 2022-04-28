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
<head>
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

.swiper-container{
width: 1100px;
height: 500px;
overflow:hidden;
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
	overflow:hidden;
	
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
				
           <aa:login/>
				</header>

				<!-- Banner -->
				<section id="banner">
					
						<header class="major" style="flex: auto;" >
										<h3>나의 정보</h3>
									</header>
									<br>
										
									<div class="row gtr-uniform" style="width: 800px;">
										<div class="col-6 col-12-xsmall">
											아이디<input type="text" name="mid" id="mid" value="${data.mid}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											이름<input type="text" name="name" id="name" value="${data.name}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											희망 지역<input type="text" name="hope_Area" id="hope_Area" value="${data.hope_Area}" readonly="readonly" />
										</div>
										<div class="col-6 col-12-xsmall">
											휴대폰 번호<input type="text" name="phone" id="phone" value="${data.phone}" readonly="readonly" />
										</div>
										
										<!-- 버튼 -->
										<div class="col-12">
											
											<ul class="actions">
							<li><a href="deletmem.do" class="button big">탈퇴하기</a></li>
						<li><a  class="button big" onclick="updatePw()">비밀번호 변경</a></li>
								</ul>
														
							
						
								
										</div>
									</div>
									
				</section>

				<!-- Section -->
				<section >
				<div>
						<header class="major">
						<h3>내가 작성한글</h3>
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
function updatePw() {
	var ret = window.open('updatePw.jsp', '비밀번호 변경하기', 'width=700, height=500');
}
</script>
</body>
</html>