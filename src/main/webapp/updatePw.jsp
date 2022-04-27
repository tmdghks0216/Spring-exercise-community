<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag"%>
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
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />


<link rel="stylesheet" href="assets/css/main.css" />
<link rel="icon" href="/images/road-trip.png">
<style type="text/css">
.error {
	color: red;
	font-size: 12px;
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
				<header id="header" style="padding-top: 30px;">
					<strong class="logo" style="color: #3d4449;">운동하자!</strong>
				</header>

				<!-- Section -->
				<section style="padding-top: 35px;">
					<header class="major">
						<h3>비밀번호 변경하기</h3>
					</header>
					<form action="main.jsp" name="form1" method="post">
						<div class="row gtr-uniform" style="width: 600px;">
							<div class="col-6 col-12-xsmall">
								새 비밀번호<input type="password" name="password" id="password"
									placeholder="새 비밀번호 입력" />

							</div>
							<br>
							<div class="col-6 col-12-xsmall">
								비밀번호 확인<input type="password" name="password2" id="password2"
									placeholder="비밀번호 확인" />

							</div>
							<span id="pwError" class="error"></span>
							<!-- Break -->
							<div class="col-12">
								<ul class="actions">
									<li><input type="button" value="확인" onclick="pwck()"
										class="primary" /></li>
								</ul>
							</div>

						</div>
					</form>
				</section>
			</div>
		</div>
	</div>

	<!-- Scripts -->
	<script src="/assets/js/jquery.min.js"></script>
	<script src="/assets/js/browser.min.js"></script>
	<script src="/assets/js/breakpoints.min.js"></script>
	<script src="/assets/js/util.js"></script>
	<script src="/assets/js/main.js"></script>
	<script src="/assets/js/jquery-3.6.0.min.js"></script>
	<script src="/assets/js/validation.js"></script>
</body>
<script type="text/javascript">
	 document.getElementById("password").addEventListener("focusout", pwCheck);
     document.getElementById("password2").addEventListener("focusout", pw2Check);
     
	 function pwCheck() {

         var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

         if (document.getElementById("password").value === "") {
            document.getElementById("pwError").innerHTML = "필수 정보입니다.";
         } else if (!pwPattern.test(document.getElementById("password").value)) {
            document.getElementById("pwError").innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            document.getElementById("password").value = "";
         } else {
            document.getElementById("pwError").innerHTML = "";
            document.getElementById("password2").value = "";
         }
      }
	

	</script>
<script type="text/javascript">
	function pwck() {
		var p1 = document.getElementById('password').value;
	      var p2 = document.getElementById('password2').value;
		if (p1 === '') {
			alert('비밀번호을 입력해주세요.');
			$('#password').focus();
			return;
		}
		if (p2 === '') {
			alert('비밀번호 재입력 부분을 입력해주세요.');
			$('#password2').focus();
			return;
		}
		if (p1 !== p2) {
			alert('비밀번호와 비밀번호 재입력분이 일치하지 않습니다.');
			$('#password2').focus();
			return;
		}
		
		
		$.ajax({ 
			type: "POST",
			url: "updatePw.do",
			data: {
				password : $("#password").val()
			},
			success: function(res) { 
				if (res == "a") {  
					alert("성공적으로 변경되었습니다.");
					window.close();
				} else {
					alert("비밀번호 변경에 실패하였습니다. 확인 후 다시 시도해주세요.");
					$("#password").text("");
					$("#password2").text("");
				}
				
			}	
		});
	}
	
	</script>
</html>