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
              <h2 class="heading mb-5">로그인</h2>
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
  
  
  
  
  
<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
<!-- 							<div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div> -->
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form role="form" style="display: block;" action="/auth/user/loginProc" method="post" id="loginFrm">
									<div class="form-group">
										<input type="text" name="userId" id="userId" tabindex="1" class="form-control" placeholder="UserId">
									</div>
									<div id="idConfirmText"></div>
									<div class="form-group">
										<input type="password" name="userPassword" id="userPassword" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div id="pwConfirmText"></div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12 col-sm-offset-3">
												<button name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" >로그인</button>
											</div>
										</div>
									</div>
										<div class="form-group">
										<div class="row ml-1 mr-1" style="background:#F7E600">
										<div class="col-3"></div>
											<div class="col-lg-6 col-sm-offset-6"">
											<!-- 카카오 로그인 버튼 -->
												<a href="https://kauth.kakao.com/oauth/authorize?client_id=9678b56f9afb8f96a880f7b1bdaee036&redirect_uri=http://localhost:8003/auth/kakao/callback&response_type=code"><img src = "/image/kakao_login_medium_wide.png" height="38px" width="100%"></a>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" tabindex="5" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>
<!-- 								<div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div> -->
									
								</form>
								
						
<!-- 								<form id="register-form" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div> -->
<!-- Register now					<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div> -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
  
<!--   <div class="container">
    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="panel panel-success">
            <div class="panel-heading">
                <div class="panel-title">환영합니다!</div>
            </div>
            <div class="panel-body">
                <form id="login-form">
                    <div>
                        <input type="text" class="form-control" name="username" placeholder="Username" autofocus>
                    </div>
                    <div>
                        <input type="password" class="form-control" name="password" placeholder="Password">
                    </div>
                    <div>
                        <button type="submit" class="form-control btn btn-primary">로그인</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
   -->
  
    
<!--  3열짜리       <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-bulb"></span></div>  좌측 아이콘1
            <div class="media-body">
              <h3 class="heading">고급검색</h3>
              <p>채널 기반 최적의 유튜버들의 데이터를 한 눈에 볼 수 있습니다</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>     
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-cash"></span></div>  좌측 아이콘2
            <div class="media-body">
              <h3 class="heading">분석/광고</h3>
              <p>차별화된 분석 시스템을 기반으로 광고효과를 극대화할 수 있습니다.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div>  
        </div>

        <div class="col-md-4">
          <div class="media block-6">
            <div class="icon"><span class="ion-ios-contacts"></span></div> 좌측 아이콘3
            <div class="media-body">
              <h3 class="heading">유튜버 커뮤니티</h3>
              <p>유튜유만의 유튜버 특화 된 커뮤니티를 통해 빠른 협업과 소통을 시작하세요.</p>
              <p><a href="#" class="link-underline">Learn More</a></p>
            </div>
          </div> 
        </div> -->


<!--       </div>
    </div>
  </div> --> <!-- .site-section -->



<!------Header-------->
<%@ include file="../layout/footer.jsp"%>

<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->
<script type="text/javascript">
$(document).ready(function(){
	
	$("#login-submit").click(function(){
			userId = $("#userId").val().trim();
			userPassword = $("#userPassword").val().trim();
			if(userId == null || userId =="" ){
				$('#idConfirmText').empty();
				$('#idConfirmText').append('<p class="text-danger"><small>아이디를 입력해주세요<small></p>')
				alert('아이디를 입력해주세요')
			}else if(userPassword==null || userPassword==""){
				$('#idConfirmText').empty();
				$('#pwConfirmText').append('<p class="text-danger"><small>비밀번호를 입력해주세요<small></p>')
				alert('패스워드를 입력해주세요')
			}else{
				$("#loginFrm").attr("action","/auth/user/loginProc")
				$("#loginFrm").submit();
			}
		})

// 	function loginSubmit(){
// 		let data = $("#loginFrm").serialize()
// 		alert(JSON.stringify(data))
// 		$.ajax({
// 			url : "/auth/user/loginProc",
// 			type: "post",
// 			contentType: "application/json; charset=utf-8",
// 			data : data,
// 			dataType:"text",
// 			success: function(result){
// 				$.('#loginFrm').attr("action","/auth/user/loginProc")
// 				alert("뭘까")
// 					location.href = "/";					
// 			},
// 			error: function(){
// 				alert("서버에러");
// 			}		
// 		})
			
		
// 		}



	
})
</script>
  </body>
</html>