<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>You To You &mdash; Youtuber Management 커뮤니티 rptlvks</title>
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
<style type="text/css">

</style>
</head>
<body>
<!------Header-------->
<%@ include file="../layout/header.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->
 <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('${channelInfo.chBanner}');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading mb-5">멤버 관리</h2>
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
	<div class="card bg-light">	
		<div class="site-section">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="title_m_tx text-center ">
							<h3>커뮤니티 멤버 관리</h3>
					
						</div>
						<div class="table-responsive" >
							<table class="table text-center">
							<thead>
								<tr >
									<th>번호</th>
			 						<th>아이디</th>
			 						<th>이름</th>
			 						<th>채널명</th>
			 						<th>채널링크</th>
			 			 			<th>등급 변경</th>
			 						<th>기능</th>
								</tr>
							</thead>
								<tbody id="userInfoList" >
									<c:choose>
									<c:when test="${!empty cmUserInfo}">
										<c:forEach var="cmUserInfo" items="${cmUserInfo}" varStatus="status">
											<tr>
												<td>${status.index+1}<input id="userNo" type="hidden" value="${cmUserInfo.userNo}">
																	<input id="communityNo" type="hidden" value="${community.communityNo}"></td>
												<td id="userId">${userList.get(status.index).userId}</td>
												<td id="userName">${userList.get(status.index).userName}</td>
												<c:choose>
													<c:when test="${!empty userList.get(status.index).userChannelLink}">
														<td id="userChName"><a>${userList.get(status.index).userChannelName }</a></td>
														<td id="userChLink"><a href="${userList.get(status.index).userChannelLink}">${userList.get(status.index).userChannelLink}</a></td>
													</c:when>
													<c:otherwise>
														<td id="userChLink"><span style="color:red;">채널 미등록</span></td>
														<td id="userChName">-</td>
														
													</c:otherwise>
												</c:choose>
												<td>
												<select id="userAuth" class="custom-select">
													<option value="0" <c:if test="${cmUserInfo.communityUserinfoAuthority == 0}">selected</c:if>>가입 대기중</option>
													<option value="1" <c:if test="${cmUserInfo.communityUserinfoAuthority == 1}">selected</c:if>>일반 멤버</option>
													<option value="2" <c:if test="${cmUserInfo.communityUserinfoAuthority == 2}">selected</c:if>>매니저</option>
												</select>
												</td>
												<td><button class="btn btn-warning modifyBtn" style="color:black;">수정</button>
													<button class="btn btn-danger deleteBtn" style="color:black;">삭제</button></td>
											</tr>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan=6 class="text-center"><strong>커뮤니티에 가입한 유저가 없습니다.</strong></td>
										</tr>
									</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- card.// -->

</div> 
<!--container end.//-->

<br><br>

<!-- Footer -->
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/Menu.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
<!-- Footer --> --%>
 
 <script type="text/javascript">
$(document).ready(function(){

	var auth = document.getElementById("userAuth");
	var slelectedAuth =  auth.options[auth.selectedIndex].text;
	if(slelectedAuth != null ){
		$("#selectedAuth").text(slelectedAuth);
	}

	// 수정버튼 클릭 이벤트
	$(document).on("click",".modifyBtn",function(){
		userNo = $(this).parent().parent().find("#userNo").val();
		userAuth = $(this).parent().parent().find("#userAuth").val();
		communityNo = $("#communityNo").val();
		if(confirm('정말 수정하시겠습니까?')){ //확인 누르면 true, 취소 누르면 false 
			$.ajax({
				url: "/community/cmUserInfoModify/"+communityNo+"/"+userNo,
				type: "put",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({
						"communityUserinfoAuthority":userAuth,
					}),
				dataType:"json", 
				success: function(result){
					if(result.status == 500 ){
						alert("수정에 실패하셨습니다.");					
					}else{
						location.reload();
					}
				},
				error: function(){
					alert("서버에러");
				}
			})
		}
	});

	// 삭제버튼 클릭 이벤트
	$(document).on("click",".deleteBtn",function(){
		userNo = $(this).parent().parent().find("#userNo").val();
		communityNo = $("#communityNo").val();
		if(confirm('정말 삭제하시겠습니까?')){ //확인 누르면 true, 취소 누르면 false 
			$.ajax({
				url: "/community/cmUserInfoDelete/"+communityNo+"/"+userNo,
				type: "delete",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({
						"communityUserinfoAuthority":userAuth,
					}),
				dataType:"json", 
				success: function(result){
					if(result.status == 500 ){
						alert("삭제에 실패하셨습니다.");					
					}else{
						location.reload();
					}
				},
				error: function(){
					alert("서버에러");
				}
			})
		}
	});
	
})
</script>
  </body>
</html>