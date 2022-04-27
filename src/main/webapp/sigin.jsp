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
<script src="https://unpkg.com/systemjs@0.21.5/dist/system.js"></script>
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
				<header id="header">

					<aa:login />
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">

						<hr class="tm-hr-primary tm-mb-55">
						<h2 id="Header">회원가입</h2>
						<br>

						<form action="signUp.do" method="post"
							class="fset mb-5 tm-comment-form" name="form1">
							<div class="mb-4">

								<p class="signupt">
									아이디  <span id="idError" class="error"></span>

								</p>
								<input class="form-control" name="mid" id="mid" type="text"
									placeholder="ID" maxlength=15 style="width: 30;"> <br>

								

							</div>
							<br>
							<div class="mb-4">

								<p class="signupt" id="pwHeader">
									비밀번호 <span id="pwError" class="error"></span>
								</p>
								<input class="form-control check" name="password" id="password"
									type="password" placeholder="password" maxlength=20>
							</div>
							<br>
							<div class="mb-4">

								<p class="signupt">
									비밀번호 확인 <span id="pw2Error" class="error"></span>
								</p>
								<input class="form-control check" name="pw2" id="pw2"
									type="password" placeholder="password" maxlength=20>
							</div>
							<br>
							<div class="mb-4">

								<p class="signupt">
									이&nbsp;름 <span id="nameError" class="error"></span>
								</p>
								<input class="form-control check" name="name" id="name"
									type="text" placeholder="NAME" maxlength=20>
							</div>
							<br>
							<div class="mb-4">

								<p class="signupt">성별</p>
								<select name=sex style="width: 200px;">
									<option value="남자">남자</option>
									<option value="여자">여자</option>

								</select>
							</div>
							<br>
							<div class="mb-3">
								<label for="inputsubject">휴대폰인증</label> <input type="text"
									class="form-control mt-1" id="phone" name="phone"
									placeholder="(-) 없이 번호를 입력하세요." required> <span
									id="phoneError" class="error"></span>  <br><br>
								<input type="text" class="form-control mt-1" id="phonecheck"
									name="phonecheck" placeholder="SMS 인증코드를 입력하세요." required>
								<span id="pcError" class="error"></span>
								<br> <input
									type="button" class="form-control mt-1" id="send-sms"
									name="send-sms" value="문자 인증" disabled="disabled">
							</div>
							<br>
							<div class="mb-4">

								<p class="signupt">희망 지역</p>
								<select name=Hope_Area style="width: 200px;">
									<option value="전국">전국</option>
									<option value="서울">서울</option>
									<option value="인천">인천</option>
									<option value="경기">경기</option>
								</select>
							</div>
							<br> <br>
							<div class="col-12">
										 	<input type="button" value="가입하기" onclick="signin_check()" class="button" style="float: right; margin-top:10px;">
										</div>
						</form>
					</div>

				</section>

				<!-- Section -->




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
	

	<script type="text/javascript">
     
      document.getElementById("password").addEventListener("focusout", pwCheck);
      document.getElementById("pw2").addEventListener("focusout", pw2Check);
      document.getElementById("phone").addEventListener("focusout",phoneCheck);
      document.getElementById("name").addEventListener("focusout", nameCheck);
     

      function nameCheck() {

         var pattern_num = /[0-9]/;
         var pattern_spc = /[~!@#$%^&*()_+|<>?:{}]/;
         var n_RegExp = /^[가-힣]{2,15}$/;

     
      
         if (document.getElementById("name").value.indexOf(" ") >= 0
               || !n_RegExp.test(document.getElementById("name").value)
              ) {
            document.getElementById("nameError").innerHTML = "한글만 사용가능합니다.";
            document.getElementById("name").value = "";
         } else if (document.getElementById("name").value === "") {
            document.getElementById("nameError").innerHTML = "필수 정보입니다.";
         } else {
            document.getElementById("nameError").innerHTML = "";
         }
      }

      function pwCheck() {

         var pwPattern = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;

         if (document.getElementById("password").value === "") {
            document.getElementById("pwError").innerHTML = "필수 정보입니다.";
         } else if (!pwPattern.test(document.getElementById("password").value)) {
            document.getElementById("pwError").innerHTML = "8~16자 영문 대 소문자, 숫자, 특수문자를 사용하세요.";
            document.getElementById("password").value = "";
         } else {
            document.getElementById("pwError").innerHTML = "";
            document.getElementById("pw2").value = "";
         }
      }

      function pw2Check() {

         if (document.getElementById("pw2").value === "") {
            document.getElementById("pw2Error").innerHTML = "필수 정보입니다.";
         } else if (document.getElementById("pw2").value !== document
               .getElementById("password").value) {
            document.getElementById("pw2Error").innerHTML = "비밀번호가 일치하지 않습니다.";
            document.getElementById("pw2").value = "";
         } else {
            document.getElementById("pw2Error").innerHTML = "";
         }
      }

      function phoneCheck() {

         var isPhoneNum = /^(?=.*[0-9]).{11}$/;
         ;

         if (document.getElementById("phone").value === "") {
            document.getElementById("phoneError").innerHTML = "필수 정보입니다.";
            document.getElementById("send-sms").setAttribute( 'disabled', 'disabled' );
         } else if (!isPhoneNum.test(document.getElementById("phone").value)) {
            document.getElementById("phoneError").innerHTML = "형식에 맞지 않는 번호입니다.";
            document.getElementById("send-sms").setAttribute( 'disabled', 'disabled' );
         } else {
            document.getElementById("phoneError").innerHTML = "";
            document.getElementById("send-sms").removeAttribute("disabled");
         }
      }



   </script>
   
   <script type="text/javascript">
   $("#mid").on("focusout", function() {

      var mid = $(this).val();
      

      $.ajax({
         type : "post",
         url : "idck.do",
         data : {
            "mid" : mid
         },
        
         success : function(res) {
            
            if($("#mid").val() == ""){
               $("#idError").text("필수 정보입니다.");
            } else {
               if (res == "true") {
                  $("#idError").text("사용 가능한 아이디입니다.");
                  $("#idError").css("color", "green");
               }  else {
                  $("#idError").text("이미 사용중인 아이디 입니다.");
                  $("#idError").css("color", "red");
                  $("#mid").val('');
               }
            }
            
         }
        
      });
   });
</script>

<script type="text/javascript">
      var keyCode = null;
      $("#send-sms").on("click", function() {

         var phNum = $("#phone").val();
         
         $.ajax({
            type : "POST",
            url : "phoneck.do",
            data : {
               "phone" : phNum
            },
          
            success : function(res) {
            	 console.log("문자 전송 완료" + res);
             if(res=="a"){
               
            	 alert("인증코드 전송에 실패하였습니다 다시 이용해주세요!");
            } else {
            	keyCode=res;
            	 console.log("문자 전송 완료" + keyCode);
                 alert("인증코드를 보냈습니다. 문자를 확인해주세요!");
            }
            }
         });
      });

      $("#phonecheck").on("focusout", function() {

         var input = $(this).val();
         
         if($("#phone").attr("readonly") == "readonly"){
            $("#pcError").text("이미 인증을 완료하였습니다.");
         }
         else{
            
            if ($("#phonecheck").val() == "") {
               $("#pcError").text("인증 필수");
            } else{
               if (input != keyCode) {
                  $("#pcError").text("인증번호 불일치 재인증 요망");
                  $("#phonecheck").val('');
               } else {
                  $("#pcError").text("인증 성공");
                  $("#pcError").css("color", "green");
                  $("#phonecheck").attr("readonly", "readonly");
                  $("#phone").attr("readonly", "readonly");
               }
            }
            
         }
         
         
      });
   </script>
   	<script type="text/javascript">
	function signin_check() {
		var mid = document.getElementById("mid");
		 var pw = document.getElementById("password");
         var pw2 = document.getElementById("pw2");
         var name = document.getElementById("name");
         var phone = document.getElementById("phone");
         var phonecheck = document.getElementById("phonecheck");
       		
         if (mid.value == "") {
             alert("아이디를 입력하세요.");
             mid.focus();
             return false; 
          }
         if (name.value == "") {
             alert("이름을 입력하세요.");
             name.focus();
             return false; 
          }
         if (pw.value == "") {
             alert("비밀번호을 입력하세요.");
             pw.focus();
             return false; 
          }
         if (pw2.value == "") {
             alert("비밀번호 재입력을 입력하세요.");
             pw2.focus();
             return false; 
          }
         
         if (phone.value == "") {
             alert("휴대폰번호을 입력하세요.");
             phone.focus();
             return false; 
          }
         
         if (phonecheck.value == "") {
             alert("휴대폰번호 인증을 진행해주세요.");
             phonecheck.focus();
             return false; 
          }
		$.ajax({ 
			type: "POST",
			url: "memck.do",
			data: {
				"name" : $("#name").val(),
				"phone" : $("#phone").val()
			},
			success: function(res) { 
				if (res == "true") {  
					alert("회원이 되신걸 환영합니다!");
					document.form1.submit();
				} else {
					alert("이미 존재하는 회원입니다.");
					 location.href = 'sigin.jsp';

					
				}
				
			}	
		});
	}
	
	</script>
</body>
</html>