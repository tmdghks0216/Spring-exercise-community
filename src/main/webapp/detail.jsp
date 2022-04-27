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
<style type="text/css">
.ditailName {
	float: left;
}

.ditailday {
	float: : right;
}
img{
width: auto; 
height: auto;
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

				<!-- Content -->
				<section>
					<header class="main">


						<c:choose>
							<c:when test="${id==bdata.mid}">
							
								<div class="report" id="report" style="float: right; margin-left: 10px;">
									
									<a href="dletboard.do?bpk=${bdata.bpk }" class="button">삭제하기</a>
								</div>
								
								<div class="report" id="report" style="float: right;">
									<a href="boardupdatview.do?bpk=${bdata.bpk }" class="button">수정하기</a>
									</div>
							</c:when>

							<c:otherwise>
								<div class="report" id="report" style="float: right;">
									<a href="report.do?mid=${bdata.mid }" class="button">신고하기</a>
								</div>
							</c:otherwise>
						</c:choose>

						<div>
							<h1>${bdata.title}</h1>
						</div>

					</header>
					<div>
						<div class="ditailName" style="float: right;">
							<h5 style="font-size: 1.3em;">작성자 : ${bdata.mid}</h5>
						</div>
						<br>
						<br>
						<div class="ditailday" style="float: right; font-size: 1.1em;">모집기간
							: ${bdata.bdate } ~ ${bdata.period.substring(0, 10)}</div>
					</div>
					<br>
					
				</section>
				<section>
					<p>${bdata.content }</p>



				</section>
				<section>
				<br>
						<div class="ditailday" style="float: right; font-size: 1.1em;">
						<h3>장소 : ${bdata.badrr }</h3>
					</div>
				 <div>
            <div id="map" style="width: 100%; height: 350px; flex-grow: 1;"></div>
         </div>
				
				</section>
				<section>
					<div>
						<h5 class="mtext-113 cl2 p-b-12">댓글</h5>


						<form action="replyup.do" method="post">
							<input type="hidden" name="bpk" value="${bdata.bpk}"> <input
								type="hidden" name="mid" value="${id}">
							<c:choose>
								<c:when test="${id != null}">
									<div class="bor19 m-b-20">
										<%-- 로그인상태일때, 댓글작성 가능 --%>
										<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
											style="resize: none;" name="msg"
											placeholder="댓글 내용을 작성해보세요. (최대 33자)" required maxlength="33"></textarea>
									</div>



									<input type="submit" value="댓글 등록"
										class="flex-c-m stext-101 cl0 size-125 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-40">
									<hr class="m-b-40">
								</c:when>
								<c:otherwise>
									<div class="bor19 m-b-20">
										<%-- 비로그인상태일때, 댓글작성 불가능 --%>
										<textarea class="stext-111 cl2 plh3 size-124 p-lr-18 p-tb-15"
											name="ctext" style="resize: none;"
											placeholder="로그인 후 작성 가능합니다." disabled></textarea>
									</div>
								</c:otherwise>
							</c:choose>


						</form>
					</div>

					<!-- 댓글목록 -->

					<div class="p-t-32 p-l-20" id="commentWrap"
						style="border: dotted 1px gray;">



						<c:forEach var="v" items="${datas}">
							<!-- 							지금 로그인 된 아이디와 작성 id가 같으면, -->
							<c:if test="${id ==v.mid}">
								<a style="float: right;"
									href="replydelete.do?bpk=${v.bpk}&rpk=${v.rpk}">삭제</a>
							</c:if>
							<!-- 							글내용, 작성자 | 작성일자 -->
							<p>${v.msg}</p>
							<p class="fs-11">작성자: ${v.mid} &nbsp; | &nbsp; 작성일:
								${v.rdate}</p>
							<hr>
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
      $("#report").on("click", function() {
         if(${mid != null}) {
            alert('신고요청 확인!!');
         }
      });
   </script>
    <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45a4ba2681826e6c415ea9f0055fa1e5&libraries=services"></script>
   <script>
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
      mapOption = {
         center : new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
         level : 6
      // 지도의 확대 레벨
      };

      // 지도를 생성합니다    
      var map = new kakao.maps.Map(mapContainer, mapOption);

      // 주소-좌표 변환 객체를 생성합니다
      var geocoder = new kakao.maps.services.Geocoder();

      var address = " ${bdata.badrr}";
      geocoder
            .addressSearch(
                  address,
                  function(result, status) {

                     // 정상적으로 검색이 완료됐으면 
                     if (status === kakao.maps.services.Status.OK) {

                        var coords = new kakao.maps.LatLng(result[0].y,
                              result[0].x);

                        // 결과값으로 받은 위치를 마커로 표시합니다
                        var marker = new kakao.maps.Marker({
                           map : map,
                           position : coords
                        });

                        // 인포윈도우로 장소에 대한 설명을 표시합니다
                        var infowindow = new kakao.maps.InfoWindow(
                              {
                                 content : '<div style="width:150px;text-align:center;padding:6px 0;">모집위치</div>'
                              });
                        infowindow.open(map, marker);

                        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                        map.setCenter(coords);
                     }

                   
                  });
   </script>
</body>
</html>