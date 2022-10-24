<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 성연추가) jstl 문자열 자르기 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 성연추가) jstl 문자열 자르기 -->
<!DOCTYPE html>
<html>
<head>
<title>You To You &mdash; Youtuber Management</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="https://fonts.googleapis.com/css?family=Overpass:300,400,500|Dosis:400,700" rel="stylesheet">
<link rel="stylesheet" href="/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/css/animate.css">
<link rel="stylesheet" href="/css/owl.carousel.min.css">
<link rel="stylesheet" href="/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/css/magnific-popup.css">
<link rel="stylesheet" href="/css/aos.css">
<link rel="stylesheet" href="/css/ionicons.min.css">
<link rel="stylesheet" href="/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/css/jquery.timepicker.css">
<link rel="stylesheet" href="/css/flaticon.css">
<link rel="stylesheet" href="/css/icomoon.css">
<link rel="stylesheet" href="/css/fancybox.min.css">
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/style.css">


<!-- 성연추가) 테이블 CSS -->
<style>
table.type03 {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
  text-align: center;
  width: 147px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
  color: #153d73;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;

}
table.type03 td {
  width: 349px;
  padding: 10px;
  vertical-align: top;
  border-right: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
}
</style>
<!-- 성연추가) 테이블 CSS -->


</head>
<body>



<!------Header-------->
<%@ include file="layout/header.jsp"%>
<!------Header-------->


<!-- ==================================================================================== -->
<!-- 배너 시작 -->
	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31">
			<div class="block-30 block-30-sm item" style="background-image: url('/image/banner_payment.jpg');" data-stellar-background-ratio="0.5">
				<div class="container">
					<div class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">결제</h2>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
<!-- 배너 종료 -->	
<!-- ==================================================================================== -->





	<div class="site-section border-top text-center col-lg-12">	
		<br>
		<br>		
		
		<h2>${principal.user.userName}님, 결제가 완료되었습니다.</h2>
		<br>
		
		<h5>ToYou와 함께라면 걱정없죠!~</h5>
	</div>



<%---------------------------------%>
<!---------------------------------->
<!---------------------------------->
<!-----------/auth 지우기----------->
<!---------------------------------->
<form action="/mypage" method="get">
<!---------------------------------->
<!-----------/auth 지우기----------->
<!---------------------------------->
<!---------------------------------->
<%---------------------------------%>
	<div class="site-section section-counter">
		<div class="container">		   			    
			<div class="row">
				<div class="col-lg-12 text-center">
					<table class="type03">
						<tr>
							<th colspan="2">
								<h3 style="color: #153d73;">결제내역조회</h3>
							</th>
						</tr>
						<tr>
							<th scope="row">이름</th>
							<td>${principal.user.userName}</td>
						</tr>
						<tr>
							<th scope="row">결제정보</th>
							<td>
								<c:set var="TextValue" value="${day }"/>
								${fn:substring(TextValue,2,4) }년
								${fn:substring(TextValue,5,7) }월&nbsp;
								<span style="color:red">
									${gradeOfSubscriber}
									<%-- 
									<c:if test='${productNo == "1"}'>STANDARD</c:if>
									<c:if test='${productNo == "2"}'>STARTUP</c:if>
									<c:if test='${productNo == "3"}'>PROFESSIONAL</c:if>
									--%>
								</span>&nbsp;
								1개월
							</td>
						</tr>
						<tr>
							<th scope="row">결제금액</th>
							<td>
								${priceOfSubscriber}
								<%-- 
								<c:if test='${productNo == "1"}'>29,000원</c:if>
								<c:if test='${productNo == "2"}'>59,000원</c:if>
								<c:if test='${productNo == "3"}'>99,000원</c:if>
								--%>
							</td>
						</tr>
						<tr>
							<th scope="row">결제일</th>
							<td>${day }</td>
						</tr>
						<tr>
							<th scope="row">결제수단</th>
							<td>카드</td>
						</tr>
						<tr>
							<th scope="row">구독기간</th>
							<td>
							${day } ~ ${nextday}
							
							</td>
						</tr>
						<tr>
							<th scope="row">다음결제일</th>
							<td>${nextday}</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center">
								<br>
								<div class="form-group">
									<button type="submit" class="btn btn-default">마이페이지</button>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</form>     




<!-- Footer -->
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
<!-- Footer -->


  </body>
</html>