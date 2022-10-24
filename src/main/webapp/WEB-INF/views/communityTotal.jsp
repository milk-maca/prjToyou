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

	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31">
			<div class="block-30 block-30-sm item"
				style="background-image: url('/image/banner_community.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h2 class="heading mb-5">Toyou 커뮤니티</h2>
			
							
							
							
								<!---------------------------------->
								<!---------------------------------->
								<!---- 성연추가 ELK 자동완성검색---->

								
								
								
								<form id="formId" action="#" method="post">		

					               <div class="input-group" id="searchCommunity">
					               		<!-- 선택창 -->
					               	   <select style="text-align:center;" class="form-control" id="selectSearchMethod">
					               	   		<option selected value="comm_name" class="comm_name">커뮤니티 이름</option>
					               	   		<option value="comm_tag" class="commu_tag">커뮤니티 태그</option>
					               	   </select>
					               	   <!-- 검색창 -->
					                   <input type="text" id="searchKeyword" name="searhValue" list="elastielist" style="text-align:center;" class="form-control" placeholder="커뮤니티 검색">
											<datalist id="elastielist" class="searchResult">
												<!-- ajax -->
											</datalist>
					                   <!-- 버튼 -->
					                   <span class="input-group-btn">
					                   		<button class="btn btn-secondary" id="searchKeywordButton" type="submit">검색</button>
					                   </span>
					               </div> 
					            </form>
								<!---- 성연추가 ELK 자동완성검색---->
								<!---------------------------------->
								<!---------------------------------->
			

						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	

	<div class="container">
			<!-- New Community ############################################# -->
			<div class="row commu">
				<h3 class="col-12">New 커뮤니티</h3>
				<br><br><br>
					<c:choose>
						<c:when test="${!empty communityNo}">
							<c:forEach var="i" begin="0" end="${fn:length(communityNo)-1}">
								<div class="col-md-3 col-lg-3 mb-3">
									<div class="person-donate text-center">
									<a href="/auth/community/community?communityNo=${communityNo.get(i)}">
												<img src="${channelImg.get(i)}" alt="Image placeholder"
													class="img-left">
												<div class="donate-info">
													<span>${channelName.get(i)}</span>
													<span class="time d-block mb-3 text-danger">가입자 : ${userJoinCnt.get(i)+1}명</span>
													<h2>${cmTitle.get(i)}</h2>
													<p>
														${cmDescription.get(i)}
													</p>
												</div>
									</a>
									</div>
								</div>
							</c:forEach>
							<div class="col-md-12 col-lg-12 md-5">
							<ul class="pagination justify-content-center" id="pagination">
								<c:choose>
									<c:when test="${cmTotalList.first}">
										<li class="page-item disabled"><a class="page-link" href="?page=${cmTotalList.number-1}">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="?page=${cmTotalList.number-1}">Previous</a></li>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${cmTotalList.last}">
										<li class="page-item disabled"><a class="page-link" href="?page=${cmTotalList.number+1}">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="?page=${cmTotalList.number+1}">Next</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
							</div>
					</c:when>
					<c:otherwise>
						<div><span><strong>새로 등록된 커뮤니티가 없습니다</strong></span></div>
					</c:otherwise>
				 </c:choose>
			</div>

		<!-- Big Community ############################################# -->
			<div class="row commu">
			<h3 class="col-12">Big 커뮤니티</h3>
			<br><br><br>
			<c:choose>
				<c:when test="${!empty bigcommunityNo}">	
					<c:forEach var="i" begin="0" end="${fn:length(bigcommunityNo)-1}">
						<div class="col-md-3 col-lg-3 mb-3">
							<div class="person-donate text-center">
							<a href="/auth/community/community?communityNo=${bigcommunityNo.get(i)}">
										<img src="${bigchannelImg.get(i)}" alt="Image placeholder"
											class="img-left">
										<div class="donate-info">
											<span>${bigchannelName.get(i)}</span>
											<span class="time d-block mb-3 text-danger">가입자 : ${biguserJoinCnt.get(i)+1}명</span>
											<h2>${bigcmTitle.get(i)}</h2>
											<p>
												${bigcmDescription.get(i)}
											</p>
										</div>
							</a>
							</div>
						</div>
					</c:forEach>
						<div class="col-md-12 col-lg-12 md-5">
							<div class="person-donate text-left"></div>
						</div>
				</c:when>
				<c:otherwise>
					<div><span><strong>활동중인 커뮤니티가 없습니다</strong></span></div>
				</c:otherwise>
			 </c:choose>
			 </div>
		
		
		
		<!-- Hot Community ############################################# -->
		
			<div class="row commu">
				<h3 class="col-12">Hot 커뮤니티</h3>
				<br><br><br>
					<c:choose>
						<c:when test="${!empty hotcommunityNo}">									
							<c:forEach var="i" begin="0" end="${fn:length(hotcommunityNo)-1}">
								<div class="col-md-3 col-lg-3 mb-3">
									<div class="person-donate text-center">
									<a href="/auth/community/community?communityNo=${hotcommunityNo.get(i)}">
												<img src="${hotchannelImg.get(i)}" alt="Image placeholder"
													class="img-left">
												<div class="donate-info">
													<span>${hotchannelName.get(i)}</span>
													<span class="time d-block mb-3 text-danger">가입자 : ${hotuserJoinCnt.get(i)+1}명</span>
													<h2>${hotcmTitle.get(i)}</h2>
													<p>
														${hotcmDescription.get(i)}
													</p>
												</div>
									</a>
									</div>
								</div>
							</c:forEach>
							<div class="col-md-12 col-lg-12 md-5">
								<div class="person-donate text-left"></div>
							</div>
					</c:when>
					<c:otherwise>
						<div><span><strong>활동중인 커뮤니티가 없습니다</strong></span></div>
					</c:otherwise>
				 </c:choose>
			</div>
			
		

			<div class="col-md-12 col-lg-12 md-5">
				<div class="person-donate text-left"></div>
			</div>

		
		

			
			
			
	</div>



<!---------------------------------->
<!---------------------------------->
<!---------------------------------->
<!---- 성연추가 ELK 자동완성검색---->	
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	
	//------------------------------------
	// 성연추가 ELK 커뮤니티 검색 자동완성
	// Ajax 커뮤티니목록 검색 시작
	$('#searchKeyword').keyup(function(event){
		// 커뮤니티 이름으로 검색
		if ( $(this).parents("#searchCommunity").find("#selectSearchMethod").val() == "comm_name" ){
			$.ajax({
	             url: "/auth/esPrefixTitle",
	             type: "POST",
	             dataType: "JSON",
	             data: { "searhValue" : $('#searchKeyword').val()},
	             success: function(data) {                 
	              	test = data['hits']
	             	test2 = test['hits']
	             	event.preventDefault();
	         		event.stopPropagation();
	        	  	$('.communitytitle').remove();
	            	for(var i=0; i<test2.length; i++){
	             		$(".searchResult").append("<option class ='communitytitle'>" + test2[i]['_source']['communitytitle'] +"</option>" );
	             		// alert(test2[i]['_source']['communityno'])
	             		$("#formId").attr("action", "/auth/community/community?communityNo="+ test2[i]['_source']['communityno']);
	             	}
	             }
			});
		}

		
		// 커뮤니티 태그로 검색
		if ( $(this).parents("#searchCommunity").find("#selectSearchMethod").val() == "comm_tag" ){
			$.ajax({
	             url: "/auth/esPrefixTag",
	             type: "POST",
	             dataType: "JSON",
	             data: { "searhValue" : $('#searchKeyword').val()},
	             success: function(data) {                 
	              	test = data['hits']
	             	test2 = test['hits']
	             	event.preventDefault();
	         		event.stopPropagation();
		          	$('.communitytag').remove();
	            	for(var i=0; i<test2.length; i++){
	             		$(".searchResult").append("<option class ='communitytag'>" + test2[i]['_source']['communitytag'] +"</option>" );
	             		// alert(test2[i]['_source']['communityno'])
	             		$("#formId").attr("action", "/auth/community/community?communityNo="+ test2[i]['_source']['communityno']);
	             	}
	             }
			});				
		}

		
	});
	// Ajax 커뮤티니목록 검색 종료
	//------------------------------------
	
	
</script> 
<!---- 성연추가 ELK 자동완성검색---->	
<!---------------------------------->
<!---------------------------------->
<!---------------------------------->
 
<%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
  </body>

</html>