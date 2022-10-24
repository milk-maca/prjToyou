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
.singleline-ellipsis {
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
}
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
              <h2 class="heading mb-5">게시글</h2>
             </div>
          </div>
        </div>
      </div>
      
    </div>
  </div>
  <br>
  <br>
  <hr>
		<div class="container">
			<div class="card bg-light">
				<article class="card-body" >
						 <form>
						    <input class="form-control" name="communityNo" id="communityNo" type="hidden" value="${community.communityNo}">
									<div class="form-group input-group" style="width:50%;">
										<div class="input-group-prepend">
										    <span class="input-group-text"><strong>Title</strong></span>
										</div>
								  	    	<input class="form-control" name="communityBoardTitle" id="communityBoardTitle" value="${board.communityBoardTitle}"  placeholder="Title" type="text" disabled="disabled">
								  	</div>
								  	 <div id="titleWarning">
						    		 </div>
								  	
									<div class="form-group input-group" style="width:40%;" >
										<div class="input-group-prepend">
										    <span class="input-group-text"><strong>Writer</strong></span>
										</div>
								  	    	<input class="form-control" value="${user.userNo}" type="hidden" disabled="disabled" id="userNo" name="userNo">
								  	    	<input class="form-control" value="${board.communityBoardNo}" type="hidden" disabled="disabled" id="boardNo" name="boardNo">
								  	    	<input class="form-control" value="${user.userName}" type="text" disabled="disabled" id="userName" name="userName">
								  	</div>
								  	
								  	
								    <div class="form-group input-group">
								    	<div class="input-group-prepend">
										    <span class="input-group-text"><strong>Content</strong></span>
										</div>
								        <textarea class="form-control"  name="communityBoardContent" id="communityBoardContent" disabled="disabled" rows="15">${board.communityBoardContent }</textarea>
								    </div> 
								    
								    <c:choose>
								    	<c:when test="${user.userNo == principal.user.userNo}">
										    <div class="form-row float-right">
										        <input type="button" id="modifyBtn" class="btn btn-default" value="Modify Board" style="color:black" > 
										        <input type="button" id="deleteBtn" class="btn btn-danger" value="Delete Board" style="color:black"> 
										        <input type="button" id="returnBtn" class="btn btn-default" value="return"> 
										    </div>      
									    </c:when>
									    <c:when test="${community.communityHostno == principal.user.userNo}">
									    	<div class="form-row float-right">
										        <input type="button" id="deleteBtn" class="btn btn-danger" value="Delete Board" style="color:black">
										        <input type="button" id="returnBtn" class="btn btn-default" value="return" style="color:black">  
										    </div> <!-- form-group// --> 
									    </c:when>
									    <c:otherwise>
									    	<div class="form-row float-right">
										        <input type="button" id="returnBtn" class="btn btn-default" value="return" style="color:black">  
										    </div> 
									    </c:otherwise>      
						            </c:choose>                                                        
						</form>
							<br>
							<hr>
						<div class="row" id="tabs-3">
					<!-- 댓글 목록 불러오기 ----------------------------------------- -->
							<div id="boardReplyList" class="w-75">
							<!-- 반복문 시작 -->
								<c:forEach items="${boardReplyPage.content}" var="boardReply" varStatus="status">
									<div class="card p-3 mb-2 w-100">
										<div class="d-flex justify-content-between align-items-center singleline-ellipsis">
	 									<input type="hidden" value="${replyWriter.get(status.index).userNo}" id="replyUserNo">
	 									<input type="hidden" value="${boardReply.communityBoardReplyNo}" id="communityBoardReplyNo">
				 							<div class="user d-flex flex-row align-items-center w-100">
				 								<img src="${profiles.get(status.index)}" width="40"class="user-img rounded-circle mr-2">
												<div class="container">
													<div class="row">
														<div class="col-4">
															<span class="text-primary"><strong>${replyWriter.get(status.index).userName}</strong></span>
														</div>
														<div class="col-4"></div>
														<div class="col-4 float-right" style="text-align:right;padding:0px;">
															<span>${times.get(status.index)}</span><br>
														</div>
														<c:choose>
															<c:when test="${principal.user.userNo == replyWriter.get(status.index).userNo }">
																<textarea class="w-75 ml-3" onkeyup="javascript:checkModifyReplyContent(this)" id="communityBoardReplyContent">${boardReply.communityBoardReplyContent}</textarea>
																
															</c:when>
															<c:otherwise>
																<textarea class="w-75 ml-3"disabled="disabled" id="communityBoardReplyContent">${boardReply.communityBoardReplyContent}</textarea>
															</c:otherwise>
														</c:choose>
													</div>
													<br>
													<div id="replyWarningForm"></div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-8" style="height:1px"></div>
											<div class="col-4">
												<c:if test="${principal.user.userNo == replyWriter.get(status.index).userNo }">
													<a class="replyDelete float-right text-danger">Delete<span class="dots"></span></a>
		 											<span class="float-right" style="color:black;"> / <span class="dots"></span></span>
													<a class="replyModify float-right text-warning">Modify<span class="dots"></span></a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
						<ul class="pagination w-75 justify-content-center" id="pagination" style="float:center;">
							<c:choose>
								<c:when test="${boardReplyPage.first}">
									<li class="page-item disabled"><a class="page-link" href="?communityBoardNo=${board.communityBoardNo}&communityNo=${community.communityNo}&page=${boardReplyPage.number-1}">Previous</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="?communityBoardNo=${board.communityBoardNo}&communityNo=${community.communityNo}&page=${boardReplyPage.number-1}">Previous</a></li>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${boardReplyPage.last}">
									<li class="page-item disabled"><a class="page-link" href="?communityBoardNo=${board.communityBoardNo}&communityNo=${community.communityNo}&page=${boardReplyPage.number+1}">Next</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="?communityBoardNo=${board.communityBoardNo}&communityNo=${community.communityNo}&page=${boardReplyPage.number+1}">Next</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
				</article>
			</div> 
		</div>
		
		<br><br><hr>
		
		<c:choose>
			<c:when test="${!empty userInfoList}">
				<c:forEach var="userInfoList" items="${userInfoList}">
					<c:if test="${!empty principal}">
						<c:if test="${userInfoList.userNo == principal.user.userNo || community.communityHostno == principal.user.userNo}">
							<div class="container">
								<input type="hidden" value="${principal.user.userNo }" id="prinUserNo">
								<div class="card">
									<div class="card mb-2 col-lg-12">
										<div class="card-header bg-light">
											<i class="fa fa-comment fa"></i>REPLY
										</div>
										<div class="card-body">
											<ul class="list-group list-group-flush">
												<li class="list-group-item">
													<div class="form-inline mb-2">
														<label for="replyId"><i
															class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
															class="form-control" placeholder="ID"
															value="${principal.user.userName }" id="boardReplyWriter"
															name="boardReplyWriter" disabled="disabled">
													</div> <textarea class="form-control" id="BoardReplyContent"
														name="BoardReplyContent" rows="3"></textarea>
													<div id="replyWarning"></div>
													<button type="button" class="btn btn-success mt-3 float-right"
														id="createReplyBtn" style="z-index: 500;">답글 달기</button>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:if test="${community.communityHostno == principal.user.userNo}">
					<div class="container">
						<input type="hidden" value="${principal.user.userNo }" id="prinUserNo">
						<div class="card">
							<div class="card mb-2 col-lg-12">
								<div class="card-header bg-light">
									<i class="fa fa-comment fa"></i>REPLY
								</div>
								<div class="card-body">
									<ul class="list-group list-group-flush">
										<li class="list-group-item">
											<div class="form-inline mb-2">
												<label for="replyId"><i
													class="fa fa-user-circle-o fa-2x"></i></label> <input type="text"
													class="form-control" placeholder="ID"
													value="${principal.user.userName }" id="boardReplyWriter"
													name="boardReplyWriter" disabled="disabled">
											</div> <textarea class="form-control" id="BoardReplyContent"
												name="BoardReplyContent" rows="3"></textarea>
											<div id="replyWarning"></div>
											<button type="button" class="btn btn-success mt-3 float-right"
												id="createReplyBtn" style="z-index: 500;">답글 달기</button>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</c:if>
			</c:otherwise>
		</c:choose>
		<br><br>

<%@ include file="../layout/footer.jsp"%>

<script type="text/javascript">
$(document).ready(function(){
	//**************************************************************************
	// 게시글 작성 유효성 검사 양식
	function checkFrm(){
		var communityBoardTitle = $("#communityBoardTitle").val()
		var communityBoardContent = $("#communityBoardContent").val()
		if(communityBoardTitle==""){
			$('#titleWarning').empty();
			$('#titleWarning').append('<p class="text-warning">제목을 입력해주세요</p>');
			$("#communityBoardTitle").focus();
			return false;
		}
		if(communityBoardContent==""){
			$('#contentWarning').empty();
			$('#contentWarning').append('<p class="text-warning">내용을 입력해주세요</p>');
			$("#communityBoardContent").focus();
			return false;
		}
		return true;	
	}

	// 수정버튼 클릭 시 수정페이지로 넘어감
	$(document).on("click","#modifyBtn",function(){
		var boardNo = $("#boardNo").val();
		var communityNo = $("#communityNo").val();
		location.href="/community/boardModifyForm?communityBoardNo="+boardNo+"&communityNo="+communityNo
				
	})

	// 다시 커뮤니티로 돌아가기
	$(document).on("click","#returnBtn",function(){
		var communityNo = $("#communityNo").val();
		location.href="/auth/community/community?communityNo="+communityNo
				
	})
	
	// 게시글 삭제
	$(document).on("click","#deleteBtn",function(){
		var boardNo = $("#boardNo").val();
		var communityNo = $("#communityNo").val();
		$.ajax({
			url:"/community/boardDelete/"+boardNo,
			type:"delete",
			contentType: "application/json; charset=utf-8",
			dataType:"json",
			success: function(result){
				if(result.status == 500 ){
					alert("게시글 삭제에 실패하셨습니다.");					
				}else{
					alert("게시글이 삭제되었습니다.");					
					location.href="/auth/community/community?communityNo="+communityNo
				}
			},
			error: function(){
				alert("서버에러");
			}
		})
		
	})
	
	//=============================================================================================================
	// 댓글 관련 자바스크립트
	// 댓글 작성
	$(document).on("click","#createReplyBtn",function(){
		var boardNo = $("#boardNo").val();
		var userNo = $("#prinUserNo").val(); // 작성자 == 로그인 유저 no
		var replyContent = $("#BoardReplyContent").val();
		if(userNo == null || userNo == 0){
			if(confirm("로그인이 필요한 페이지 입니다.<br> 이동하시겠습니까?")){
				location.href="/login/loginForm";
			}else{
				window.reload();
			}
		}else if(replyContent==""){
			var str = '<span style="color:red">'
			str += "댓글을 입력해 주세요";
			str += "</span>"
			$("#replyWarning").append(str)
		}else if(replyContent.length>=2048){
			alert(replyContent.length)
		}else{
			$.ajax({
				url: "/community/boardReplyWrite",
				type: "post",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({
						"communityBoardNo":boardNo,
						"userNo":userNo,
						"communityBoardReplyContent":replyContent
					}),
				dataType:"json", 
				success: function(result){
					if(result.status ==500 ){
						alert("댓글작성 에 실패하셨습니다.");					
					}else{
						location.reload();
					}
				},
				error: function(){
					alert("서버에러");
				}
			})
		}
	})
	// 댓글 end
	
	// 댓글 수정
	$(document).on("click",".replyModify",function(){
		var communityBoardReplyNo = $(this).parent().parent().parent().find("#communityBoardReplyNo").val();
		var communityBoardReplyContentForm = $(this).parent().parent().parent().find("#communityBoardReplyContent");
		var replyWarningForm = $(this).parent().parent().parent().find("#replyWarningForm");
		var communityBoardReplyContent = $(this).parent().parent().parent().find("#communityBoardReplyContent").val();
		// 댓글 수정 유효성 검사
		if(communityBoardReplyContent == ""){
			replyWarningForm.empty();
			replyWarningForm.append('<p class="text-danger">내용을 입력해주세요</p>');
			communityBoardReplyContentForm.focus();
		}else{
			if((confirm("댓글을 수정하시겠습니까?"))){
				$.ajax({
					url: "/community/replyModify/"+communityBoardReplyNo,
					type: "put",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify({
							"communityBoardReplyContent":communityBoardReplyContent.replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;')
						}),
					dataType:"json", 
					success: function(result){
						if(result.status == 500 ){
							alert("댓글 수정에 실패하셨습니다.");					
						}else{
							location.reload();	
						}
					},
					error: function(request, status, error){
		 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
	
				})
			}
		}
	})

	// 댓글 삭제
	$(document).on("click",".replyDelete",function(){
		var communityBoardReplyNo = $(this).parent().parent().parent().find("#communityBoardReplyNo").val();
		if((confirm("댓글을 수정하시겠습니까?"))){
			$.ajax({
				url: "/community/deleteModify/"+communityBoardReplyNo,
				type: "delete",
				contentType: "application/json; charset=utf-8",
				dataType:"json", 
				success: function(result){
					if(result.status == 500 ){
						alert("댓글 삭제를 실패하셨습니다.");					
					}else{
						location.reload();
					}
				},
				error: function(request, status, error){
	 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}

			})
		}
		
	})
	
	
	
	//=================================================================================================================================

	
	
})
</script>
  </body>
</html>