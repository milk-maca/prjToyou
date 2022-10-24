<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Bootstrap Admin Template : Insight</title>
<!-- Bootstrap Styles-->
<link href="/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<title>Insert title here</title>
</head>
<body>

	<%@ include file="layout/header.jsp"%>
	<div id="page-wrapper">
		<div id="page-inner">
			<div class="row">
				<div class="col-md-12">
					<h1 class="page-header">
						관리자메모 <small></small>
					</h1>
				</div>
			</div>
			<!-- /. ROW  -->


			<div class="row">

				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="row">
							<div class="col-lg-12">
								<div class="panel panel-default">
									<div class="panel-heading">관리자 메모</div>
									<div class="panel-body">
										<div class="row">
											<div class="col-lg-6">
												<form id="form_test" action="/memo" method="post">
													<div class="form-group">
														<!--  <label>입력창</label> -->
														<textarea class="form-control" placeholder="내용을 입력하세요 ." id="reportLogContent" name="reportLogContent" rows="5"></textarea>
														<input type="hidden" name="userNo" value="123"> 
														<input type="hidden" name="reportLogTitle" value="456">
													</div>
													<button id="memo_submit" type="submit" class="btn btn-default">등록</button>
													<!-- <button type="reset" class="btn btn-default">Reset Button</button> -->
												</form>
											</div>
										</div>
										<!-- /.col-lg-6 (nested) -->
									</div>
									<!-- /.row (nested) -->
								</div>
								<!-- /.panel-body -->
							</div>
							<!-- /.panel -->
						</div>
						<!-- /.col-lg-12 -->

						<div class="panel-body" id="memo_re">
							<c:forEach items="${reportLogContent}" var="list">
								<div class="alert alert-success">
									<tr class="odd gradeX">
										<td>${list.reportLogContent }/ ${list.reportLogDate }</td>
									</tr>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>


			<!-- 						 <div class="row">
                    <div class="col-md-12">
                        <h1 class="page-header">
                            개발자 메모 <small></small>
                        </h1>
                    </div>
                </div>  -->
			<!-- /. ROW  -->

		</div>


		<footer>
			<p>All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a></p>
		</footer>
	</div>

	<!-- /. WRAPPER  -->
	
	<!-- JS Scripts-->
	



	<!-- jQuery Js -->
	<script src="/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="/assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script src="/assets/js/custom-scripts.js"></script>
	

<script type="text/javascript">


	$(document).on('click', '#memo_submit', function(){

	
		var testContentt = $("#reportLogContent").val();
		
		if (testContentt == ""){
			alert('내용을 입력해주세요');
		}
		 else {

			$.ajax({
 				url : "/memo",
 				data : "formData",
 				type : "post",
				success : function() {
 			    alert('게시글 등록 완료');
 			    location.href = "/admin_ui-elements";
 				}
		})

		}
	})
</script>
</body>




</html>