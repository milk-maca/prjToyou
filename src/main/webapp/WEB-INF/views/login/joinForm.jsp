<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>You To You &mdash; Youtuber Management 로그인</title>
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
<%@ include file="../layout/header.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->

  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('/image/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading mb-5">회원가입</h2>
        <!-- <p style="display: inline-block;"><a href="https://vimeo.com/channels/staffpicks/93951774"  data-fancybox class="ftco-play-video d-flex"><span class="play-icon-wrap align-self-center mr-4"><span class="ion-ios-play"></span></span> <span class="align-self-center">Watch Video</span></a></p> -->           
        <!-- 메인 중앙 검색창
               <div class="input-group">
                   <input type="text" class="form-control" placeholder="검색어를 입력하세요">
                   <span class="input-group-btn">
                   <button class="btn btn-secondary" type="button">검색</button>
                   </span>
              </div> END 메인 중앙 검색창 -->
             </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  
  
  
   <!-- 회원가입 시작 --> 

<div class="container">
<!-- <br>  <p class="text-center">More bootstrap 4 components on <a href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com</a></p>
<hr>
 -->


<div class="card bg-light mt-5">
<article class="card-body mx-auto" style="max-width: 1000px;">
	<h4 class="card-title mt-3 text-center">Create Account</h4>
	<p class="text-center">Get started with your free account</p>
	<p>
		<a href="https://kauth.kakao.com/oauth/authorize?client_id=9678b56f9afb8f96a880f7b1bdaee036&redirect_uri=http://localhost:8003/auth/kakao/callback&response_type=code" class="btn btn-block btn-twitter"> <i class="fab fa-twitter"></i>   Login via kakao</a>
	</p>
	<p class="divider-text">
        <span class="bg-light">OR</span>
    </p>
    <c:choose>
    <c:when test="${empty kakaoUser}">
		<form>
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				</div>
		  	    	<input class="form-control" name="userId" id="userId"  placeholder="ID" type="text">
		        	<input type="button" class="btn btn-primary btn-block" value="확인" id="idCheck"  style="width: 50px;"/>
		    </div> <!-- form-group// -->
		    <div id="idConfirmText">
		    </div>
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <input class="form-control" name="userPassword" id="userPassword"  placeholder="Create password" type="password">
		    </div>
		    <div id="pwConfirmText">
		    </div> <!-- form-group// -->
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <input class="form-control" name="passwdCheck" id="passwdCheck"  placeholder="Repeat password" type="password">
		    </div>
		    <div id="pwConfirmText2">
		    </div> <!-- form-group// -->                                      
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <input class="form-control" name="userName" id="userName"  placeholder="Name" type="text">
		    </div> 
		     <div id="userNameConfirmText">
		    </div>                                     
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userEmail" id="userEmail" placeholder="Email address" type="email">
		    </div>
		     <div id="userEmailConfirmText">
		    </div>
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userChannelLink" id="userChannelLink" placeholder="Your Youtube" type="search">
		        <input type="button" class="btn btn-primary btn-block" id="searchMyChennel"  style="width: 50px;" value="검색" />
		    </div>
		    <div id="chResult">
		    </div>
		     <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <select class="custom-select" aria-label="Default select example" id="userChannelCategory" style="width:90%;">
		        	<option value="0">select category</option>
		        	<option value="1">영화 & 애니메이션</option>
		        	<option value="2">자동차 & 오토바이</option>
		        	<option value="10">음악</option>
		        	<option value="17">스포츠</option>
		        	<option value="19">여행 & 이벤트</option>
		        	<option value="20">게임</option>	        
		        	<option value="22">인물 & 블로그</option>	        
		        	<option value="23">유머</option>	        
		        	<option value="24">가족 엔터테이먼트</option>	        
		        	<option value="25">뉴스 & 정치</option>	        
		        	<option value="26">노하우 & 스타일</option>	        
		        	<option value="27">교육</option>	        
		        	<option value="28">과학 & 기술</option>	        
		        	<option value="29">비영리 & 사회운동</option>	             
		        </select>
		    </div> <!-- form-group// -->  
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userRolemodelLink" id="userRolemodelLink" placeholder="Your Role Model" type="text">
		        <input type="button" class="btn btn-primary btn-block" id="searchRoleChennel"  style="width: 50px;" value="검색" />
		    </div>
		    <div id="chRoleResult">
		    </div>
		    
	
		    <!--  <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
				</div>
				<select class="custom-select" style="max-width: 120px;">
				    <option selected="">+971</option>
				    <option value="1">+972</option>
				    <option value="2">+198</option>
				    <option value="3">+701</option>
				</select>
		    	<input name="" class="form-control" placeholder="Phone number" type="text">
		    </div> --> 
		    <!-- form-group// -->
		    <!--
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
				</div>
				<select class="form-control">
					<option selected=""> Select job type</option>
					<option>Designer</option>
					<option>Manager</option>
					<option>Accaunting</option>
				</select>
			</div>--> 
			<!-- form-group end.// --> 
		    
		    <div class="form-group">
		        <input type="button" id="signupBtn" class="btn btn-primary btn-block" value="Create Account"> 
		    </div> <!-- form-group// -->      
		    <p class="text-center">Have an account? <a href="">Log In</a> </p>                                                                 
		</form>
	</c:when>
	
	<c:otherwise>
		<form>
		<input type="hidden" value="${kakaoUser.oauth }" id="oauth" name="oauth">
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				</div>
		  	    	<input class="form-control" name="userId" id="userId"  placeholder="ID" type="text" value="${kakaoUser.userId }" disabled="disabled">
		        	<input type="button" class="btn btn-primary btn-block" value="확인" id="idCheck"  style="width: 50px;"/>
		    </div> <!-- form-group// -->
		        <input class="form-control" name="userPassword" id="userPassword"  placeholder="Create password" type="hidden" value ="${kakaoUser.userPassword }">
		        <input class="form-control" name="passwdCheck" id="passwdCheck"  placeholder="Repeat password" type="hidden" value ="${kakaoUser.userPassword }">             
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <input class="form-control" name="userName" id="userName"  placeholder="Name" type="text" value="${kakaoUser.userName }">
		    </div> <!-- form-group// -->                                      
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userEmail" id="userEmail" placeholder="Email address" type="email" value="${kakaoUser.userEmail}">
		    </div>
		    <!-- form-group// -->
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userChannelLink" id="userChannelLink" placeholder="Your Youtube" type="text">
		        <input type="button" class="btn btn-primary btn-block" id="searchMyChennel"  style="width: 50px;" value="검색" />
		    </div>
		    <div id="chResult">
		    </div>
		     <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <select id="userChannelCategory">
		        	<option value="0">select category</option>
		        	<option value="1">영화 & 애니메이션</option>
		        	<option value="2">자동차 & 오토바이</option>
		        	<option value="10">음악</option>
		        	<option value="17">스포츠</option>
		        	<option value="19">여행 & 이벤트</option>
		        	<option value="20">게임</option>	        
		        	<option value="22">인물 & 블로그</option>	        
		        	<option value="23">유머</option>	        
		        	<option value="24">가족 엔터테이먼트</option>	        
		        	<option value="25">뉴스 & 정치</option>	        
		        	<option value="26">노하우 & 스타일</option>	        
		        	<option value="27">교육</option>	        
		        	<option value="28">과학 & 기술</option>	        
		        	<option value="29">비영리 & 사회운동</option>	             
		        </select>
		    </div> <!-- form-group// -->  
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-envelope"></i> </span>
				 </div>
		        <input class="form-control" name="userRolemodelLink" id="userRolemodelLink" placeholder="Your Role Model" type="text">
		        <input type="button" class="btn btn-primary btn-block" id="searchRoleChennel"  style="width: 50px;" value="검색" />
		    </div>
		    <div id="chRoleResult">
		    </div>
		    
	
		    <!--  <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-phone"></i> </span>
				</div>
				<select class="custom-select" style="max-width: 120px;">
				    <option selected="">+971</option>
				    <option value="1">+972</option>
				    <option value="2">+198</option>
				    <option value="3">+701</option>
				</select>
		    	<input name="" class="form-control" placeholder="Phone number" type="text">
		    </div> --> 
		    <!-- form-group// -->
		    <!--
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-building"></i> </span>
				</div>
				<select class="form-control">
					<option selected=""> Select job type</option>
					<option>Designer</option>
					<option>Manager</option>
					<option>Accaunting</option>
				</select>
			</div>--> 
			<!-- form-group end.// --> 
		    
		    <div class="form-group">
		        <input type="button" id="signupBtn" class="btn btn-primary btn-block" value="Create Account"> 
		    </div> <!-- form-group// -->      
		    <p class="text-center">Have an account? <a href="">Log In</a> </p>                                                                 
		</form>
	</c:otherwise>

	</c:choose>
</article>
</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br><br>
<!-- <article class="bg-secondary mb-3">  
<div class="card-body text-center">
    <h3 class="text-white mt-3">Bootstrap 4 UI KIT</h3>
<p class="h5 text-white">Components and templates  <br> for Ecommerce, marketplace, booking websites 
and product landing pages</p>   <br>
<p><a class="btn btn-warning" target="_blank" href="http://bootstrap-ecommerce.com/"> Bootstrap-ecommerce.com  
 <i class="fa fa-window-restore "></i></a></p>
</div>
<br><br>
</article> -->


 <!-- 회원가입 끝 --> 


<!-- Footer -->
<%@ include file="../layout/footer.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->
 
 <script type="text/javascript">
$(document).ready(function(){  
	var tmpId = "";
	var idCheck=0;
	var chSearchCheck=1;
	var chRoleSelectCheck=1;
	function checkform(){
			var userIdCheck = RegExp(/^[A-Za-z0-9]{8,20}$/);	
			var userIdCheck = RegExp(/^[A-Za-z0-9]{8,20}$/);
			var userPwCheck = RegExp(/^(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^*()\-_=+\\\|\[\]{};:\'",.<>\/?]).{8,20}$/);
			var userNameCheck = RegExp(/^[ㄱ-ㅎ가-힣a-zA-Z]{1,10}$/);
			var userEmailCheck =RegExp(/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i);
										

			/*  RegExp(/^[A-Za-z0-9]{8,20}$/); */
			var userId = $('#userId').val();
			var userPassword = $("#userPassword").val();
			var passwdCheck = $("#passwdCheck").val();
			var userName = $("#userName").val();
			var userEmail = $("#userEmail").val();
			var userChannelLink = $(".chSelect").attr("data");
			var userRolemodelLink = $(".chRoleSelect").attr("data");
			
			if(userId==""){
				$('#idConfirmText').empty();
				$('#idConfirmText').append('<p class="text-danger"><small>아이디를 입력해주세요<small></p>')
				return false;
			}else{$('#idConfirmText').empty();}
			
			if(!userIdCheck.test(userId)){
				$('#idConfirmText').empty();
				$('#idConfirmText').append('<p class="text-danger"><small>아이디는 영문, 숫자로만 입력해주세요 [8~20 자리]<small></p>')
				return false;
			}else{ $('#idConfirmText').empty();}

			if (idCheck>0) {
				if(tmpId != userId){
					$('#idConfirmText').empty();
					$('#idConfirmText').append('<p class="text-danger"><small>아이디 중복을 체크해주세요<small></p>')
					return false;
				}
			}else{$('#idConfirmText').empty();}

			if (idCheck==0) {
				if(tmpId != userId){
					$('#idConfirmText').empty();
					$('#idConfirmText').append('<p class="text-danger"><small>아이디 중복을 체크해주세요<small></p>')
					return false;
				}
			}else{$('#idConfirmText').empty();}		
	
			if(userPassword==""){
				$('#pwConfirmText').empty();
				$('#pwConfirmText').append('<p class="text-danger"><small>패스워드를 입력해주세요<small></p>')
				return false;
			}else{$('#pwConfirmText').empty();}
			
			if(!userPwCheck.test(userPassword)){
				$('#pwConfirmText').empty();
				$('#pwConfirmText').append('<p class="text-danger"><small>영어 소문자, 숫자와 특수기호 필히 입력 [8~20 자리]<small></p>')
				return false;
			}else{$('#pwConfirmText').empty();}
			
			if(passwdCheck==""){
				$('#pwConfirmText2').empty();
				$('#pwConfirmText2').append('<p class="text-danger"><small>패스워드 확인을 입력해주세요<small></p>')
				return false;
			}else{$('#pwConfirmText2').empty();}
			if(passwdCheck != userPassword){
				$('#pwConfirmText2').empty();
				$('#pwConfirmText2').append('<p class="text-danger"><small>패스워드가 일치하지 않습니다<small></p>')
				return false;
			}else{$('#pwConfirmText2').empty();}
			
			if(userName==""){
				$('#userNameConfirmText').empty();
				$('#userNameConfirmText').append('<p class="text-danger"><small>이름을 입력해주세요<small></p>')
				return false;
			}else{$('#userNameConfirmText').empty();}
			
			if(!userNameCheck.test(userName)){
				$('#userNameConfirmText').empty();
				$('#userNameConfirmText').append('<p class="text-danger"><small>한글/영어로 된 이름을 입력하세요<small></p>')
				return false;
			}else{$('#userNameConfirmText').empty(); }
			
			if(userEmail==""){
				$('#userEmailConfirmText').empty();
				$('#userEmailConfirmText').append('<p class="text-danger"><small>이메일을 입력해주세요<small></p>')
				return false;
			}else{$('#userEmailConfirmText').empty();}
			if(!userEmailCheck.test(userEmail)){
				$('#userEmailConfirmText').append('<p class="text-danger"><small>올바른 이메일을 입력해주세요<small></p>')
				return false;
			}
			
			if(chSearchCheck!=1){
				$('#chResult').empty();
				$('#chResult').append('<p class="text-danger"><small>채널을 등록해주세요<small></p>')
				return false;
			}else{$('#chResult').empty();}
			
			if(chRoleSelectCheck!=1){
				$('#chRoleResult').empty();
				$('#chRoleResult').append('<p class="text-danger"><small>롤모델을 등록해주세요<small></p>')
				return false;
			}else{$('#chRoleResult').empty();}
			
			if(!(typeof userChannelLink=="undefined"&& typeof userRolemodelLink=="undefined")){
				if(userChannelLink==userRolemodelLink){
					$('#chRoleResult').empty();
					$('#chRoleResult').append('<p class="text-danger"><small>본인 채널과 롤모델을 다르게 선택해주세요<small></p>')
					chRoleSelectCheck=0;
					return false
				}
			}else{$('#chRoleResult').empty();}
			
			return true;	
		}

	
	
//	유튜브 채널 검색 메소드
	$("#searchMyChennel").click(function(){
		var userChannelLink = $("#userChannelLink").val()
		$("#chResult").empty()
		if(userChannelLink == "" || userChannelLink == null){
			$('#chResult').empty();
			$('#chResult').append('<p class="text-danger">검색어를 입력하세요</p>')
		}else{
			$.ajax({
				url: "/auth/user/searchChannel",
				type: "get",
				data: {keyword:userChannelLink}, 
				beforeSend: function() {
					$('#chResult').empty();
					$('#chResult').append('<p class="text-warning">채널 검색 중입니다...</p>')
						
             },
				success: function(contents){ // 채널을 리스트로 받아옴
					chSearchCheck = 0;
					if(contents != null){
						var str='<table class="table table-bordered">';
						for(var i=0; i<contents.length; i++){
								var content = contents[i].split("!@#");
								str += '<tr class="chSelect" data="'+content[2]+'">';
								str += '<td><img style="width:40px;height:40px;" src="'+content[0]+'"/></td>';
								str += '<td>'+content[1]+"</td>";
								str += '<td>'+content[3]+"</td>";
								str += '</tr>';
						}
						str +='</table>';
						$('#chResult').empty();
						$('#chResult').append(str);
					}else{
						$('#chResult').empty();
						$('#chResult').append('<p class="text-danger">검색 결과가 없습니다.</p>')
					}
				},
				error: function(){
					$('#chResult').empty();
					$('#chResult').append('<p class="text-danger">서버 에러</p>')
				}
			});
		}
	})
	
	
	// 롤모델! 
	$("#searchRoleChennel").click(function(){
		var userRolemodelLink = $("#userRolemodelLink").val()
		$("#chRoleResult").empty()
		if(userRolemodelLink == "" || userRolemodelLink == null){
			$('#chRoleResult').empty();
			$('#chRoleResult').append('<p class="text-danger"><small>검색어를 입력해주세요<small></p>')
		}else{
			$.ajax({
				url: "/auth/user/searchChannel",
				type: "get",
				data: {keyword:userRolemodelLink},
				beforeSend: function() {
					$('#chRoleResult').empty();
					$('#chRoleResult').append('<p class="text-warning">채널 검색 중입니다...</p>')
						
             }, 
				success: function(contents){ // 채널을 리스트로 받아옴
					chRoleSelectCheck = 0;
					
					if(contents != null){
						var str='<table class="table table-bordered">';
						for(var i=0; i<contents.length; i++){
								var content = contents[i].split("!@#");
								str += '<tr class="chRoleSelect" data="'+content[2]+'">';
								str += '<td><img style="width:40px;height:40px;" src="'+content[0]+'"/></td>';
								str += '<td>'+content[1]+"</td>";
								str += '<td>'+content[3]+"</td>";
								str += '</tr>';
						}
						str +='</table>';
						$('#chRoleResult').append(str);
					}else{
						$('#chRoleResult').empty();
						$('#chRoleResult').append('<p class="text-danger"><small>검색결과가 없습니다<small></p>')
					}
				},
				error: function(){
					$('#chRoleResult').empty();
					$('#chRoleResult').append('<p class="text-danger"><small>서버 에러<small></p>')
				}
			});
		}
	})
	
	$(document).on("click",".chSelect",function(){
			var link = $(this).attr("data")
			var img = $(this).find("img").attr("src")
			var title = $(this).find("td").eq(1).text()
			var subscriber = $(this).find("td").eq(2).text()
			
			$("#chResult").empty()
			var str='<table class="table table-bordered">'
				str += '<tr class="chSelect" data="'+link+'">';
				str += '<td><img id="userChannelImg" style="width:40px;height:40px;" src="'+img+'"/></td>';
				str += '<td  id="userChannelName">'+title+"</td>";
				str += '<td id="userSubscriber">'+subscriber+"</td>";
				str += '</tr>';
				str += '</table>'
			$('#chResult').append(str);
				chSearchCheck=1;							
		})
		
	// 롤모델 리스트 클릭시
	$(document).on("click",".chRoleSelect",function(){
			var link = $(this).attr("data")
			var img = $(this).find("img").attr("src")
			var title = $(this).find("td").eq(1).text()
			var subscriber = $(this).find("td").eq(2).text()

			$("#chRoleResult").empty()
			var str='<table class="table table-bordered">'
				str += '<tr class="chRoleSelect" data="'+link+'">';
				str += '<td><img style="width:40px;height:40px;" src="'+img+'"/></td>';
				str += '<td>'+title+"</td>";
				str += '<td>'+subscriber+"</td>";
				str += '</tr>';
				str += '</table>'
			$('#chRoleResult').append(str);
				chRoleSelectCheck=1;							
		})
	
	
	$("#idCheck").click(function(){
		var userIdCheck = RegExp(/^[A-Za-z0-9]{8,20}$/);	
		var userId = $('#userId').val();
		if(userId==""){
			$('#idConfirmText').empty();
			$('#idConfirmText').append('<p class="text-danger"><small>아이디를 입력해주세요<small></p>')
		}
		else if(!userIdCheck.test(userId)){
			$('#idConfirmText').empty();
			$('#idConfirmText').append('<p class="text-danger"><small>아이디는 영문, 숫자로만 입력해주세요 [8~20 자리]<small></p>')
			
		}
		else{
			$.ajax({
				url: "/auth/user/idCheck",
				type: "post",
				data: {userId:userId}, 
				success: function(result){
					if(result == "0"){
						$('#idCheck').attr("readonly",true);
						idCheck++
						tmpId = userId;
						$('#idConfirmText').empty();
						$('#idConfirmText').append('<p class="text-success"><small>사용 가능한 아이디입니다<small></p>')
					}else{
						$('#idConfirmText').empty();
						$('#idConfirmText').append('<p class="text-danger"><small>중복된 아이디입니다<small></p>')
					}
				},
				error: function(){
					$('#idConfirmText').empty();
					$('#idConfirmText').append('<p class="text-danger"><small>서버 에러<small></p>')
				}
			});
		}
	});

//  회원가입 버튼 클릭시 이벤트
	$(document).on("click","#signupBtn",function(){				
		var userId = $("#userId").val();
		var userPassword = $("#userPassword").val();
		var passwdCheck = $("#passwdCheck").val();
		var userName = $("#userName").val();
		var userEmail = $("#userEmail").val();
		var userChannelLink = $(".chSelect").attr("data");
		var userSubscriber = $("#userSubscriber").text();
		var userChannelCategory = $("#userChannelCategory").val();
		var userRolemodelLink = $(".chRoleSelect").attr("data");
		var userChannelImg = $("#userChannelImg").attr("src")
		var userChannelName = $("#userChannelName").text();
		var oauth = $("oauth").val();
		
		// 위의 조건을 다 만족했다면 ajax 로 회원가입 실행
		if(checkform()){
			$.ajax({
					url: "/auth/user/joinProc",
					type: "post",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify({
							"userId":userId,
							"userPassword":userPassword,
							"passwdCheck":passwdCheck,
							"userName":userName,
							"userEmail":userEmail,
							"userChannelName":userChannelName,
							"userChannelLink":userChannelLink,
							"userChannelCategory": userChannelCategory,
							"userChannelImg":userChannelImg,
							"userSubscriber":userSubscriber,
							"userRolemodelLink":userRolemodelLink,
							"oauth":oauth
							
						}),
					dataType:"json", 
					success: function(result){
						if(result.status ==500 ){
							alert("회원가입에 실패하셨습니다.");					
						}else{
							alert("회원가입이 완료되었습니다.");					
							location.href = "/auth/loginForm";					
						}
					},
					error: function(){
						alert("서버에러");
					}
				})
			
			}
		})
//	회원가입 이벤트 종료

	
})
</script>
  </body>
</html>