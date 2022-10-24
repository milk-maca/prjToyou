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
<%@ include file="./layout/header.jsp"%>

<%-- 
<jsp:include page="/WEB-INF/views/include/header.jsp" flush="true"></jsp:include> --%>
<!------Header-------->

  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('/image/bg_1.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center text-center">
            <div class="col-md-7">
              <h2 class="heading mb-5">커뮤니티 등록</h2>
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


<div class="card bg-light mt-4">
<article class="card-body mx-auto" style="min-width:800px;max-width: 1000px;">
	<h4 class="card-title mt-3 text-center">Create Community</h4>
	<p class="text-center">Community Host : ${principal.user.userName} </p>
	<input id="hostNo" value='${principal.user.userNo}' type="hidden">
	
	
    <form>
    <h4 class="text-left">커뮤니티 정보 등록</h4>
    <br>
			<div class="form-group input-group">
				<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-user"></i> </span>
				</div>
		  	    	<input class="form-control" name="communityName" id="communityName"  placeholder="Community Name" type="text">
		        	<input type="button" class="btn btn-primary btn-block" value="확인" id="communityNameCheck"  style="width: 50px;"/>
		        	
		        	
		    </div> <!-- form-group// -->
		    <div id="idCheck">
		    
		    </div>
		    
		    <div id="checkStatus"></div>
		    <div class="form-group input-group">
		    	<div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
		        <textarea class="form-control" name="communityDescription" id="communityDescription"  placeholder="Community Describtion" row=4></textarea>
		    </div> <!-- form-group// -->
		    	<input type="checkbox" checked="checked"  name="public" id="public" value="1"> 공개
				<input type="checkbox" name="private" id="private" value="0">비공개
		    <hr>
		    <br>
		    <!--  해쉬 태그 AREA -->
		    <h4 class="text-left">해시 태그 등록</h4>
		    <div class="tr_hashTag_area">
			    <div class="form-group">
	                <input type="hidden" value="" name="tag" id="rdTag" />
	            </div>
	        	
	             
	                        
	            <div class="form-group input-group">
	            <div class="input-group-prepend">
				    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
				</div>
	            	<input class="form-control" type="text" id="tag" size="7" placeholder="Enter HashTag" />
	           </div>
	           <ul id="tag-list"></ul>
	           
           </div>
           <div id="hashCheck"></div>
           
		    
		    
		    <div class="form-group">
		        <input type="button" id="createBtn" class="btn btn-primary btn-block" value="Create Community"> 
		    </div> <!-- form-group// -->      
		                                                                    
		</form>
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
<%-- 
<jsp:include page="/WEB-INF/views/include/footer.jsp" flush="true"></jsp:include>
 --%><!-- Footer -->
 <%@ include file="layout/Menu.jsp"%>
<%@ include file="layout/footer.jsp"%>
 <script type="text/javascript">
$(document).ready(function(){  
	var tag = {};
    var counter = 0;
    var colcount=0;
    var count=0;
    var communityOpen=1;

    // 입력한 값을 태그로 생성한다.
    function addTag (value) {
        tag[counter] = value;
        counter++; // del-btn 의 고유 id 가 된다.
    }

    // tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
    function marginTag () {
        return Object.values(tag).filter(function (word) {
            return word !== "";
        });
    }

    // 서버에 제공
    $("#tag-form").on("submit", function (e) {
        var value = marginTag(); // return array
        $("#rdTag").val(value); 

        $(this).submit();
    });

    $("#tag").on("keypress", function (e) {
        var self = $(this);
		
        //엔터나 스페이스바 눌렀을때 실행
        if (e.key === "Enter" || e.keyCode == 32) {
			
            var tagValue = self.val(); // 값 가져오기
			
            // 해시태그 값 없으면 실행X
            if (tagValue !== "" ) {
				if(count!=5){
					
                // 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
                var result = Object.values(tag).filter(function (word) {
                    return word === tagValue;
                })
            
                // 해시태그가 중복되었는지 확인
                if (result.length == 0) { 
                    if(colcount%5==0){
						color = '#BEEBFD'
                    }else if(colcount%5==1){
                        color = '#DFD4E4'
                        }else if(colcount%5==2){
                        color = '#FCFFB0'
                        }else if(colcount%5==3){
                        color = '#AFFFBA'
                        }else if(colcount%5==4){
                        color = '#FFAFB0'
                        }
                    $("#tag-list").append("<li style='margin-bottom:10px;margin-right:10px;float: left;border : 0;padding: 0 0 0 0;list-style: none;background-color:"+color+"' class='tag-item'><strong>&nbsp;&nbsp; #"+tagValue+"</strong><span class='del-btn' idx='"+counter+"'> X&nbsp;&nbsp;</span></li>");
                    addTag(tagValue);
                    self.val("");
                    colcount++;
                    count++;
                } else {
                	 $("#hashCheck").empty()
                    $("#hashCheck").append("<p class='text-danger'>태그 값이 중복됩니다.</p>")
                }
            }else{
            	$("#hashCheck").empty()
                $("#hashCheck").append("<p class='text-danger'>최대 5개의 해시 태그만 등록될 수 있습니다.</p>")
			}
				
            }
            e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
        }
    });


    
    // 삭제 버튼 
    // 인덱스 검사 후 삭제
    $(document).on("click", ".del-btn", function (e) {
    	
        var index = $(this).attr("idx");
        tag[index] = "";
        $(this).parent().remove();
        count--;
    });

    $('#private').click(function(){
        communityOpen=0;
    	  if($(this).prop('checked')){
    	 	
    	     $('#public').prop('checked',false);
    	 
    	     $(this).prop('checked',true);
    	 
    	    }
    	  
    	   });


	$('#public').click(function(){
		communityOpen=1;
		  if($(this).prop('checked')){
		 
		     $('#private').prop('checked',false);
		 
		     $(this).prop('checked',true);
		 
		    }
		  
		   });




	var disable = 0;
	var namePass = 0;
	// 커뮤니티 중복 검사 쿼리
	$("#communityNameCheck").click(function(){
		var communityName = $('#communityName').val();
		if(disable==1){
			$("#communityNameCheck").attr('value',"확인");
			$('#communityName').attr("readOnly",false);
			$('#checkStatus').empty();
			disable=0;
			namePass=0;
			
		}
		else{
			if(communityName==""){
				
				$('#idCheck').empty();
				$('#idCheck').append('<p class="text-danger">아이디를 입력해주세요</p>')
			}else{
				
				$.ajax({
					url: "/communityNameCheck",
					type: "post",
					data: {communityName:communityName},
					 beforeSend: function() {
						$('#checkStatus').empty();
						$('#checkStatus').append('<p class="text-warning">채널을 검색 중입니다...</p>')
							
	             },success: function(data){
						if(data == "0"){
	
							$("#communityNameCheck").attr('value',"수정");
							$('#communityName').attr("readOnly",true);
							$('#checkStatus').empty();
							$('#checkStatus').append('<p class="text-success">사용 가능한 커뮤니티 이름입니다.</p>')
							disable=1;
							namePass=1;
						}else{
							$('#checkStatus').empty();
							$('#checkStatus').append('<p class="text-danger">중복된 커뮤니티 이름입니다.</p>')
							disable=0;
							namePass=0;
						}
						
					},
					error: function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				});
			}
		}
	});

	//////////////////////////////////////////////////////


	$(document).on("click","#createBtn",function(){				
		var communityTitle = $("#communityName").val();
		var communityDescription = $("#communityDescription").val();
		var communityHostno = $("#hostNo").val();
		var communityIspublic = communityOpen;
		var value = marginTag(); // return array
        $("#rdTag").val(value); 
		var communityTag = $("#rdTag").val();
		// 위의 조건을 다 만족했다면 ajax 로 회원가입 실행
		if(namePass==1 && disable==1){
			
		
			$.ajax({
					url: "/createCommunity",
					type: "post",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify({
							"communityHostno":communityHostno,
							"communityTitle":communityTitle,
							"communityDescription":communityDescription,
							"communityIspublic":communityIspublic,
							"communityTag":communityTag
						}),
					dataType:"json", 
					success: function(result){
						if(result.status ==500 ){
							alert("커뮤니티 등록에 실패하셨습니다.");					
						}else{
							alert("커뮤니티 등록이 완료되었습니다.");					
							location.href = "/mypage";					
						}
					},
					error: function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }

				
				})
		}else{
			$('#checkStatus').empty();
			$('#checkStatus').append('<p class="text-danger">중복 체크해주세요.</p>')
			}
			
		})
	


    
	
})
</script>

  </body>
</html>