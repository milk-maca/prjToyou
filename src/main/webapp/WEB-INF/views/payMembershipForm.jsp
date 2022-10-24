<%@page import="org.springframework.web.bind.annotation.RequestAttribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		
		<h2>ToYou에서 이루세요, 당신의 꿈!</h2>
		<br>
		
		<h5>탁월한 선택이십니다!</h5>
	</div>



<form action="/payGoGO" method="post">
	<div class="site-section section-counter">
		<div class="container">
			<div class="block-48">			   			    
			    <div class="row">
					<!-- 이름 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">이름</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">${principal.user.userName}</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 이름 종료 -->
				    <!-- 이메일 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">이메일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">${principal.user.userEmail}</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 이메일 종료 -->	
				    <!-- 선택등급 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">선택등급</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
										<p style="color:red">${gradeOfSubscriber}</p>
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 선택등급 종료 -->
				    <!-- 결제금액 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">결제금액</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">${priceOfSubscriber}</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 결제금액 종료 -->				  
				</div>
  		    	<div class="row">
				    <!-- 카드종류 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">카드종류</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
											<select style="width:120px;height:35px;text-align:center;" required>
												<option selected disabled hidden value="">&nbsp;</option>
												<option>현대카드</option>
												<option>국민카드</option>
												<option>롯데카드</option>
												<option>신한카드</option>
												<option>기타</option>
											</select>
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 카드종류 종료 -->
				    <!-- 카드번호 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">카드번호</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
											<!-- 숫자만 입력가능한 옵션 추가 -->
											<input type="text" required maxlength="4" size="3" style = "text-align:center;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">-
											<input type="text" required maxlength="4" size="3" style = "text-align:center;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">-
											<!-- 비밀번호 자동 완성기능 해제 옵션 추가 -->
											<input type="password" required maxlength="4" size="2.5" style = "text-align:center;" autocomplete="new-password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">-
											<input type="text" required maxlength="4" size="3" style = "text-align:center;" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 카드번호 종료 -->
				    <!-- 유효기간 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">유효기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
											MM&nbsp;:&nbsp;
											<select style="width:50px;height:35px;text-align:center;" required>
												<option selected disabled hidden value="">&nbsp;</option>
												<option>01</option>
												<option>02</option>
												<option>03</option>
												<option>04</option>
												<option>05</option>
												<option>06</option>
												<option>07</option>
												<option>08</option>
												<option>09</option>
												<option>10</option>
												<option>11</option>
												<option>12</option>
											</select>
											&nbsp;&nbsp;/&nbsp;&nbsp; 
											YY&nbsp;:&nbsp;
											<select style="width:50px;height:35px;text-align:center;" required>
												<option selected disabled hidden value="">&nbsp;</option>
												<option>21</option>
												<option>22</option>
												<option>23</option>
												<option>24</option>
												<option>25</option>
												<option>26</option>
												<option>27</option>
												<option>28</option>
											</select>
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- 유효기간 종료 -->
				    <!-- CVC 시작 -->
						<div class="col-sm-3 text-center">
							<table class="table table-sm col-md-1 text-center">
								<thead class="thead-dark">
									<tr>
										<th scope="col">CVC</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="row">
											<!-- 숫자만 입력가능 + 비밀번호 자동완성기능 해제 -->
											<input type="password" required maxlength="3" size="3" style = "text-align:center;" autocomplete="new-password" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*?)\..*/g, '$1');">
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					<!-- CVC 종료 -->				  
 				</div>
  		    	<div class="row"> 
					<!-- 결제버튼 시작 -->	
						<div class="col-sm-12 text-center">
				        	<table class="table-sm col-md-12 text-center">
			 					<tbody>
			 						<tr>
										<td class="text-center">
	        								<div class="form-group">
	        									
		        								<c:if test='${gradeOfSubscriber == Name1}'>
		        									<input type="hidden" name="productNo" value="1" onchange="this.value = parseInt(this.value);">
		        								</c:if>
												<c:if test='${gradeOfSubscriber == Name2}'>
													<input type="hidden" name="productNo" value="2" onchange="this.value = parseInt(this.value);">
												</c:if>
												<c:if test='${gradeOfSubscriber == Name3}'>
													<input type="hidden" name="productNo" value="3" onchange="this.value = parseInt(this.value);">
												</c:if>
												
												<input type="hidden" value="${gradeOfSubscriber}" name="gradeOfSubscriber">
												<input type="hidden" value="${priceOfSubscriber}" name="priceOfSubscriber">
	        								
	        									<input type="hidden" name="userNo" value="${principal.user.userNo}" onchange="this.value = parseInt(this.value);">
	        									<button type="submit" class="btn btn-default">결제하기</button>
	        								
	        								</div>
			       						</td>
									</tr>
								</tbody>
				        	</table>	        
				        </div>
					<!-- 결제버튼 종료 -->
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