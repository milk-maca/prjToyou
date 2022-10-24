<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
<style type="text/css">
.block-11 .owl-nav{position: relative;}
.owl-next .owl-prev{position: absolute;}
</style>
</head>
<body>
<!------Header-------->
<%@ include file="../layout/header.jsp"%>
<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->

	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31">
			<!-- 추후 배너는 ChannelOwners 에서 가져올 예정 -->
			<div class="block-30 block-30-sm item"
				style="background-image: url('${channelInfo.chBanner}');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">${channelInfo.chTitle}</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	

	<div class="container">
		<div class="row commu">
			<div class="dropdown event-dropdown">
				<a href="#" class="dropdown-toggle" data-toggle="dropdown">Test<span class="caret"></span></a>
					<ul class="dropdown-menu">
						
						<c:choose>
							<c:when test="${principal.user.userNo == community.communityHostno}">
									<li><a id="modifyCmBtn" href="/community/cmModifyForm?communityNo=${community.communityNo}">커뮤니티 수정</a></li>
									<li><a id="deleteCmBtn" href="#">커뮤니티 삭제</a></li>
									<li><a id="memberMgtBtn" href="/community/cmUserInfoModifyForm?communityNo=${community.communityNo}">멤버 관리</a></li>
							</c:when>
							<c:otherwise>
									<li><a id="signUpBtn" href="#">가입 신청</a></li>
							</c:otherwise>
						</c:choose>
							<c:forEach var="userInfoList" items="${userInfoList}">
								<c:if test="${ principal.user.userNo == userInfoList.userNo && userInfoList.communityUserinfoAuthority == 2}">
									<li><a id="memberMgtBtn" href="/community/cmUserInfoModifyForm?communityNo=${community.communityNo}">멤버 관리</a></li>
								</c:if>
							</c:forEach>
					</ul>
			</div>
			<input type="hidden" value="${principal.user.userNo}" id="userNo">
			<div class="col-md-8 col-lg-12 mb-5">
				<div class="commu_title_1 text-center">
				<input type="hidden" id="communityNo" value="${community.communityNo}">
					<h2>${community.communityTitle}</h2>
					<hr>
				</div>
				<div class="row">
				<div class="col-1"></div>
					<div class="person-donate text-left">
						<img src="${channelInfo.chProfile}" alt="Image placeholder"
							class="img-left">
						<div class="donate-info">
							<h4>${channelInfo.chTitle }</h4>
							<span class="time d-block mb-3 text-danger">가입자 : ${JoinCnt+1} 명</span>
						</div>
					</div>
					<div class="col-1"></div>
					<div class="person-donate text-left col-7">
					<div class="commu_title_1">
						<h2>커뮤니티 소개</h2>
					</div>
						<div class="donate-info">
							<p>
								${community.communityDescription}
							</p>
						</div>
					</div>
				</div>
			</div>
		
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="title_m_tx text-left ">
						<h3>커뮤니티 게시판</h3>
					</div>
						<table class="table table-striped commu_board">
						<thead>
							<tr class="text-center">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>날짜</th>
							</tr>
						</thead>
						<tbody id="boardList" class="text-center">
						<c:if test="${!empty boards }">
							<c:forEach var="boards" items="${boards}" varStatus="status">
								<tr>
									<!-- 작성자, 커뮤니티 호스트 가 아니면 공개글만 노출 -->
									<c:choose>
										<c:when test="${principal.user.userNo != boardWriter.get(status.index).userNo && principal.user.userNo != community.communityHostno}">
											<c:if test="${boards.communityBoardIspublic == 1 }">
												<td>${status.index+1}</td>
												<td><a style="color:black" href='/auth/community/boardView?communityBoardNo=${boards.communityBoardNo}&communityNo=${community.communityNo}'>${boards.communityBoardTitle}</a></td>
												<td>${boardWriter.get(status.index).userName}</td>
												<td>${boards.communityBoardViewcnt}</td>
												<td>${boards.communityBoardWritedate}</td>
											</c:if>
										</c:when>
										<c:otherwise>
												<td>${status.index+1}</td>
												<td><a style="color:black" href='/auth/community/boardView?communityBoardNo=${boards.communityBoardNo}&communityNo=${community.communityNo}'>${boards.communityBoardTitle}</a></td>
												<td>${boardWriter.get(status.index).userName}</td>
												<td>${boards.communityBoardViewcnt}</td>
												<td>${boards.communityBoardWritedate}</td>
										</c:otherwise>
									</c:choose>
								</tr>
							</c:forEach>
						</c:if>
						</tbody>
						</table>
						<!-- 커뮤니티 호스트, 가입자만 게시글 작성 가능 -->
						<c:choose>
							<c:when test="${!empty userInfoList}">
								<c:forEach var="userInfoList" items="${userInfoList}">
									<c:if test="${!empty principal}">
										<c:if test="${userInfoList.userNo == principal.user.userNo}">
											<div class="form-row float-right">
												<button class="btn btn-default" onclick="location.href='/community/cmBoardWriteForm?communityNo=${community.communityNo}'">게시글 작성</button>
											</div>
										</c:if>
									</c:if>
								</c:forEach>
								<c:if test="${community.communityHostno == principal.user.userNo}">
											<div class="form-row float-right">
												<button class="btn btn-default" onclick="location.href='/community/cmBoardWriteForm?communityNo=${community.communityNo}'">게시글 작성</button>
											</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<c:if test="${community.communityHostno == principal.user.userNo}">
									<div class="form-row float-right">
										<button class="btn btn-default" onclick="location.href='/community/cmBoardWriteForm?communityNo=${community.communityNo}'">게시글 작성</button>
									</div>
								</c:if>
							</c:otherwise>
						</c:choose>
				</div>
			</div>
		</div>
	</div>


	<div class="site-section border-top">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="commu_title_2">
						<h3>커뮤니티 가입 유튜버</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-12 block-11">
					<div class="nonloop-block-11 owl-carousel owl-loaded owl-drag" style="text-align:center">
						<!-- 가입채널 반복문 실행 -->
						<c:forEach var="joinChannels" items="${joinChannels}">
						<div class="person-donate2 .owl-item" style="width:150px; height:150px;">
							<a href="/auth/channelSearch?keyword=${ joinChannels.chTitle}">
				            	<img src="${joinChannels.chProfile}" alt="Image placeholder" class="img-center hi">
							</a>
			            	<div class="text-center">
			            		<a href="${joinChannels.chLink}">${joinChannels.chTitle}</a>
			            	</div>
			        	</div>
			        	</c:forEach>
			   		</div>
				</div>
			</div>
		</div>
	</div>
<!-- <div class="container"> -->
<!-- 	<div class="col-md-12 block-11"> -->
<!-- 		<div class="nonloop-block-11 owl-carousel owl-loaded owl-drag"> -->
<!-- 			<div class="person-donate2" style="width:150px; height:150px;"> -->
<!--             	<img src="/image/person_1.jpg" alt="Image placeholder" class="img-left hi"> -->
<!--             	<div class="text_ch text-center"> -->
<!--             		<a href="#">[채널명]</a> -->
<!--             	</div> -->
<!--         	</div> -->
<!--    		 </div> -->
<!-- 	</div>  -->
<!-- </div>  -->








        
<!-- Footer -->
<%@ include file="../layout/footer.jsp"%>
<%@ include file="../layout/Menu.jsp"%>

 <script type="text/javascript">
$(document).ready(function(){

// 	// 커뮤니티 수정 폼 이동
// 	$(document).on("click","#modifyCmBtn",function(){
// 		var communityNo = $("#communityNo").val();
// 		location.href="/auth/community/cmModifyForm?communityNo="+communityNo
// 	})
	
// 	// 멤버관리 폼 이동
// 	$(document).on("click","#memberMgtBtn"),function(){
// 		var communityNo = $("#communityNo").val();
// 		location.href="/auth/community/cmUserInfoModifyForm?communityNo="+communityNo
// 	}


	// 커뮤니티 삭제
	$(document).on("click","#deleteCmBtn",function(){
		var communityNo = $("#communityNo").val();
		$.ajax({
			url:"/community/deleteCommunity/"+communityNo,
			type:"delete",
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			success: function(result){
				if(result.status == 500 ){
					alert("커뮤니티 삭제에 실패하셨습니다.");					
				}else{
					alert("커뮤니티가 삭제되었습니다.");					
					location.href="/auth/communityTotal"
				}
			},
			error: function(){
				alert("서버에러");
			}
		
		})

	})

	// 커뮤니티 가입 신청 클릭 시
	$(document).on("click","#signUpBtn",function(){
		var userNo = $("#userNo").val();
		var communityNo = $("#communityNo").val();
		if(userNo == null || userNo == ""){
			alert("로그인이 필요한 서비스 입니다.")
			location.href="/auth/loginForm";
		}else{
			if(confirm("가입 신청하시겠습니까?")){
				$.ajax({
					url: "/community/signUpCm",
					type: "post",
					data: {userNo:userNo,
						communityNo:communityNo},
	             	success: function(result){
	    				if(result == "0" ){
	    					alert("이미 가입하셨습니다.");					
	    				}else{
	    					alert("가입신청이 완료되었습니다.");					
	    				}
					},
					error: function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				    }
				});
			}
		}
	})

		
})
 </script>
  </body>
</html>