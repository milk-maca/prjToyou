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
              <h2 class="heading mb-5">커뮤니티 생성</h2>
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
<article class="card-body w-100">
<div class="row">
		 <form class="col-12">
		    <h4 class="text-left">커뮤니티 게시판 등록</h4>
		    <br>
		    <input class="form-control" name="communityNo" id="communityNo" type="hidden" value="${communityNo}">
			<input class="form-control" name="userNo" id="userNo" type="hidden" value="${principal.user.userNo}">
					<div class="form-group input-group w-50">
						<div class="input-group-prepend">
						    <span class="input-group-text"><strong>Title</strong> </span>
						</div>
				  	    	<input class="form-control" name="communityBoardTitle" id="communityBoardTitle"  placeholder="Title" type="text">
				  	</div>
				  	 <div id="titleWarning">
		    		 </div>
				  	
					<div class="form-group input-group w-50">
						<div class="input-group-prepend">
						    <span class="input-group-text"><strong>Writer</strong> </span>
						</div>
				  	    	<input class="form-control" value="${principal.user.userName}" type="text" disabled="disabled">
				  	    	<select id="communityBoardIspublic">
				  						<option value="1">공개</option>
				  						<option value="0">비공개</option>
				  			</select>
				  	</div>
				  	
				  	
				    <div class="form-group input-group">
				    	<div class="input-group-prepend">
						    <span class="input-group-text"><strong>Content</strong></i> </span>
						</div>
				        <textarea class="form-control" name="communityBoardContent" id="communityBoardContent"  placeholder="Content"  rows="10"></textarea>
				    </div> <!-- form-group// -->
				    <hr>
				 
				    <div class="form-group">
				        <input type="button" id="createBtn" class="btn btn-primary btn-block" value="Create Board"> 
				    </div> <!-- form-group// -->      
		                                                                    
		</form>
</div>
</article>
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


	// 커뮤니티 게시판 생성버튼 클릭시
	$(document).on("click","#createBtn",function(){
		var userNo = $("#userNo").val();
		var communityNo = $("#communityNo").val();
		var communityBoardTitle = $("#communityBoardTitle").val().replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
		var communityBoardContent = $("#communityBoardContent").val().replace(/&/gi, '&amp;').replace(/</gi, '&lt;').replace(/>/gi, '&gt;').replace(/"/gi, '&quot;').replace(/'/gi, '&apos;');
		var communityBoardIspublic = $("#communityBoardIspublic").val();
		if(checkFrm()){
			$.ajax({
				url: "/community/boardWrite",
				type: "post",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify({
						"userNo":userNo,
						"communityNo":communityNo,
						"communityBoardTitle":communityBoardTitle,
						"communityBoardContent":communityBoardContent,
						"communityBoardIspublic":communityBoardIspublic
					}),
				dataType:"json", 
				success: function(result){
					if(result.status == 500 ){
						alert("게시글 등록에 실패하셨습니다.");					
					}else{
						alert("게시글이 등록되었습니다.");					
						history.back();					
					}
				},
				error: function(){
					alert("서버에러");
				}

			})
		}
	});
	// ----- 생성 end -----
	
})
</script>
  </body>
</html>