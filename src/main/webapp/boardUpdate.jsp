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
<script src="https://cdn.ckeditor.com/ckeditor5/30.0.0/classic/ckeditor.js"></script>
	<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
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

				 <aa:login/>
				</header>

				<!-- Banner -->
				<section id="banner">
					<div class="content">


						<br>

						<form action="boardupdat.do" method="post"  name="form1">
							<div class="mb-4">
								<div class="bi">
									<div>
									<input type="hidden" name="bpk" value="${bdata.bpk}"> 
								<input type="hidden" name="mid" value="${bdata.mid}">
										<c:set var="today" value="<%=new java.util.Date()%>" />
										모집날짜 : <input type="date" name="period" id="period" min="<fmt:formatDate value='${today}' pattern="yyyy-MM-dd"/>">
									
									</div>
									<div style="display: inline-block">
										<br> <select name=bcategory id="bcategory" style="width: 200px;">
											<option value="">카테고리</option>
											<option ${bdata.bcategory=='동호회' ? 'selected' : ''} value="동호회">동호회 홍보</option>
											<option ${bdata.bcategory=='운동' ? 'selected' : ''} value="운동">개인운동 구인</option>
											<option ${bdata.bcategory=='시설추천' ? 'selected' : ''} value="시설추천">시설추천</option>
										</select>
									</div>
								
									<div style="display: inline-block">

										<select name=bArea style="width: 200px;">
											<option ${bdata.bArea=='전국' ? 'selected' : ''} value="전국">전국</option>
											<option ${bdata.bArea=='서울' ? 'selected' : ''} value="서울">서울</option>
											<option ${bdata.bArea=='인천' ? 'selected' : ''} value="인천">인천</option>
											<option ${bdata.bArea=='경기' ? 'selected' : ''} value="경기">경기</option>
										</select>
									</div>
									
									<div style="display: inline-block">

										<select name=event id="event"style="width: 200px;">
											<option value="">운동 종목</option>
											<option  ${bdata.event=='축구' ? 'selected' : ''} value="축구">축구</option>
											<option  ${bdata.event=='야구' ? 'selected' : ''} value="야구">야구</option>
											<option  ${bdata.event=='헬스' ? 'selected' : ''} value="헬스">헬스</option>
											<option  ${bdata.event=='배드민턴' ? 'selected' : ''} value="배드민턴">배드민턴</option>
											<option  ${bdata.event=='클라이밍' ? 'selected' : ''} value="클라이밍">클라이밍</option>
											<option  ${bdata.event=='수영' ? 'selected' : ''} value="수영">수영</option>
											<option  ${bdata.event=='사이클' ? 'selected' : ''} value="사이클">사이클</option>
											<option  ${bdata.event=='골프' ? 'selected' : ''} value="골프">골프</option>
											<option ${bdata.event=='스키' ? 'selected' : ''}  value="스키">스키&보드</option>
											
										</select>
									</div>
									
									<div style="display: inline-block">
										<br> <select name=condition style="width: 200px;">
											<option ${bdata.condition=='상관없음' ? 'selected' : ''} value="상관없음">남자&여자</option>
											<option ${bdata.condition=='남자' ? 'selected' : ''} value="남자">남자만</option>
											<option  ${bdata.condition=='여자' ? 'selected' : ''} value="여자">여자만</option>

										</select>
									</div>

								</div>
								<br> <input class="form-control" name="title" id="title"
									type="text" placeholder="제목" maxlength=30 style="width: 30;" value="${bdata.title }">

								<br>
								<div>
								<textarea name=content id="content" style="height: 600px">${bdata.content}</textarea>
								
							</div>
							</div>
							<br>
							    <div class="mb-3">
                  <input type="button" style="width: 100%; margin-top: 10px;"
                     class="btn btn-success btn-lg px-3"
                     onclick="sample5_execDaumPostcode()" value="주소 검색"><br>
               </div>
               <br>
						  <div class="mb-3">
                
                  <!--
                    <input type="text" class="form-control mt-1" id="subject" name="subject" placeholder="Subject">
                     -->
                  <input readonly="readonly" required type="text" class="form-control mt-1"
                     id="sample5_address" name=badrr value="${bdata.badrr }" ceholder="주소 검색을 이용해주세요.">
                 
               </div>
	<div id="map"
                  style="width: 100%; height: 300px; margin-top: 10px; margin-bottom: 16px; display: none"></div>
							<div class="classic">
								<br> <input type="button" value="등록" onclick="ck()" class="button" style="float: right; margin-top:10px;">
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
	<!-- CKEditor -->
	<script>
	ClassicEditor
	.create( document.querySelector('#editor'),{
		language: "ko",
		ckfinder: {
	        uploadUrl: 'fileupload.do',
	        	withCredentials: true
		}

	})
	.then( editor => {
	    console.log( 'Editor was initialized', editor );
	} )
	.catch( error => {
		console.error( error );
	} );
	</script>
	

 <script>

	function ck() {
		if ($('#title').val() == '') {
			alert('제목을 입력해주세요.');
			$('#title').focus();
			return;
		}
		if ($('#period').val() == '') {
			alert('기간을 입력해주세요.');
			$('#period').focus();
			return;
		}
		if ($('#bcategory').val() == "") {
			alert('카테고리를 입력해주세요.');
			$('#bcategory').focus();
			return;
		}
		if ($('#event').val() == "") {
			alert('운동 종목을 입력해주세요.');
			$('#evant').focus();
			return;
		}
		if ($('#sample5_address').val() == '') {
			alert('주소를 입력해주세요.');
			$('#sample5_address').focus();
			return;
		}
		if ($('.ck-content').text() == '') {
			alert('내용을 입력해주세요.');
			$('.ck-content').focus();
			return;
		}
		document.form1.submit();
	}

</script>
   <script
      src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=	45a4ba2681826e6c415ea9f0055fa1e5
&libraries=services"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = {
         center : new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
         level : 5
      // 지도의 확대 레벨
      };

      //지도를 미리 생성
      var map = new daum.maps.Map(mapContainer, mapOption);
      //주소-좌표 변환 객체를 생성
      var geocoder = new daum.maps.services.Geocoder();
      //마커를 미리 생성
      var marker = new daum.maps.Marker({
         position : new daum.maps.LatLng(37.537187, 127.005476),
         map : map
      });

      function sample5_execDaumPostcode() {
         new daum.Postcode({
            oncomplete : function(data) {
               var addr = data.address; // 최종 주소 변수

               // 주소 정보를 해당 필드에 넣는다.
               document.getElementById("sample5_address").value = addr;
               // 주소로 상세 정보를 검색
               geocoder.addressSearch(data.address, function(results,
                     status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {

                     var result = results[0]; //첫번째 결과의 값을 활용

                     // 해당 주소에 대한 좌표를 받아서
                     var coords = new daum.maps.LatLng(result.y,
                           result.x);
                     // 지도를 보여준다.
                     mapContainer.style.display = "block";
                     map.relayout();
                     // 지도 중심을 변경한다.
                     map.setCenter(coords);
                     // 마커를 결과값으로 받은 위치로 옮긴다.
                     marker.setPosition(coords)
                  }
               });
            }
         }).open();
      }
   </script>
   
</body>

</html>