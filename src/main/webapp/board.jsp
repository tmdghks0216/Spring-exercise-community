<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
<script
	src="https://cdn.ckeditor.com/ckeditor5/11.0.1/classic/ckeditor.js"></script>
<style type="text/css">
</style>
<style>
.ck-editor__editable {
	min-height: 500px;
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

				<!-- Banner -->
				<section id="banner">
					<div class="content">


						<br>

						<form action="board.do" method="post" name="form1">
							
								<div class="bi">
									<div></div>
									<div style="display: inline-block">
										<br> <select name=bcategory id="bcategory"
											style="width: 200px;">
											<option value="">카테고리</option>
											<option ${bcategory=='동호회' ? 'selected' : ''}
												value="동호회">동호회 홍보</option>
											<option ${bcategory=='운동' ? 'selected' : ''} value="운동">개인운동
												구인</option>
											<option ${bcategory=='시설추천' ? 'selected' : ''}
												value="시설추천">시설추천</option>
										</select>
									</div>

									<div style="display: inline-block">

										<select name=bArea id="bArea" style="width: 200px;">
										<option ${bArea== null ? 'selected' : ''} value="" >지역</option>
											<option ${bArea=='전국' ? 'selected' : ''} value="전국">전국</option>
											<option ${bArea=='서울' ? 'selected' : ''} value="서울">서울</option>
											<option ${bArea=='인천' ? 'selected' : ''} value="인천">인천</option>
											<option ${bArea=='경기' ? 'selected' : ''} value="경기">경기</option>
										</select>
									</div>

									

									<div style="display: inline-block">
										<br> <select name=condition id="condition " style="width: 200px;">
										<option 
												value="">성별조건</option>
											<option ${condition=='상관없음' ? 'selected' : ''}
												value="상관없음">남자&여자</option>
											<option ${condition=='남자' ? 'selected' : ''} value="남자">남자만</option>
											<option ${condition=='여자' ? 'selected' : ''} value="여자">여자만</option>

										</select>
									</div>
<br>

								</div>
								<br>
								<br>
								<div class="col-6 col-12-small">
									<input type="checkbox" id="demo-copy" name="event" value="축구">
									<label for="demo-copy">축구</label>
									
								<input type="checkbox" id="demo-copy1" name="event" value="야구">
									<label for="demo-copy1">야구</label>
									
									
									
								<input type="checkbox" id="demo-copy3" name="event" value="헬스">
									<label for="demo-copy3">헬스</label>
									
									<input type="checkbox" id="demo-copy4" name="event" value="배드민턴">
									<label for="demo-copy4">배드민턴</label>
									
								<input type="checkbox" id="demo-copy5" name="event" value="수영">
									<label for="demo-copy5">수영</label>
									
											<input type="checkbox" id="demo-copy6" name="event" value="사이클">
									<label for="demo-copy6">사이클</label>
									
								<input type="checkbox" id="demo-copy7" name="event" value="골프">
									<label for="demo-copy7">골프</label>
									
										
									<input type="checkbox" id="demo-copy8" name="event" value="스키">
									<label for="demo-copy8">스키&보드</label>

								</div>
								<div class="classic">
								<br> <input type="button" value="검색" onclick="ck()" class="button" style="float: right; margin-top:10px;">
							</div>
						</form>
					</div>

				</section>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>Ipsum sed dolor</h2>
					</header>
					<div class="posts">
						<c:forEach var="v" items="${bdata}">
						<article>
							<a href="detail.do?bpk=${v.bpk}" class="image"><img src="img/${v.bPhoto}" alt="" /></a>
							<button class="button" style="float: right; color: green;">${v.status }</button>
						<h4>${v.title}</h4>
							<br><br>
							<ul class="actions">
								<li><button class="button">${v.condition }</button></li>
								<li><button class="button">${v.bArea}</button></li>
								<li><button class="button">${v.event }</button></li>
							</ul>
								<div class="ditailday" style="  font-size:1.1em;">작성자 : ${v.mid }</div>
						<div class="ditailday" style=" float: right; font-size:1.1em;">조회수 : ${v.views }</div>
						<br><br>
						<div class="ditailday" style=" float: right; font-size:1.1em;">모집기간 : ${v.bdate } ~ ${v.period.substring(0, 10)}</div>
						</article>
					</c:forEach>
					</div>
				</section>




				<!-- Section -->


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

	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	45a4ba2681826e6c415ea9f0055fa1e5
&libraries=services"></script>
 <script>


	function ck() {
		
		if ($('#bcategory').val() == "") {
			alert('카테고리를 설정해주세요.');
			$('#bcategory').focus();
			return;
		}
		if ($('#bArea').val() == "") {
			alert('지역을 설정해주세요.');
			$('#evant').focus();
			return;
		}
		
		if ($('#condition').val() == "") {
			alert('성별 조건을 설정해주세요.');
			$('#condition').focus();
			return;
		}
		document.form1.submit();
	}

</script>

</body>

</html>