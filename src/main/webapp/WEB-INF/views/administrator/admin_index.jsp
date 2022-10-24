<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Hybrid Bootstrap Admin Template</title>
<!-- Bootstrap Styles-->
<link href="/assets/css/bootstrap.css" rel="stylesheet" />
<!-- FontAwesome Styles-->
<link href="/assets/css/font-awesome.css" rel="stylesheet" />
<!-- Morris Chart Styles-->
<link href="/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
<!-- Custom Styles-->
<link href="/assets/css/custom-styles.css" rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
	<div id="wrapper">
		<%@ include file="layout/header.jsp"%>
		<div id="page-wrapper">
			<div id="page-inner">


				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">${dayday}&nbsp;현황</h1>
					</div>
				</div>


				<!-- /. ROW  -->

				<div class="row">
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div
							class="panel panel-primary text-center no-boder bg-color-green green">
							<div class="panel-left pull-left green">
								<i class="fa fa-eye fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${sumOfTodayJoin }</h3>
								<strong> 오늘 가입자 </strong>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center no-boder bg-color-blue">
							<div class="panel-left pull-left blue">
								<i class="fa fa-shopping-cart fa-5x"></i>
							</div>

							<div class="panel-right">
								<h3>${sumOfTodayBuy }</h3>
								<strong> 오늘 구독 결제 수</strong>

							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center no-boder bg-color-red">
							<div class="panel-left pull-left red">
								<i class="fa fa fa-comments fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${sumOfTodayCommunity }</h3>
								<strong> 오늘 생성된 커뮤니티 </strong>

							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-primary text-center no-boder bg-color-brown">
							<div class="panel-left pull-left brown">
								<i class="fa fa-users fa-5x"></i>

							</div>
							<div class="panel-right">
								<h3>${allUserNum }</h3>
								<strong>총 회원 수</strong>

							</div>
						</div>
					</div>
				</div>





				<div class="row">
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>채널보유회원률</h4>
								<div class="easypiechart" id="easypiechart-red" data-percent="${haveChannel }">
									<span class="percent">${haveChannel }%</span>
								</div>
							</div>
						</div>
					</div>				
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>구독가입률</h4>
								<div class="easypiechart" id="easypiechart-blue" data-percent="${subPercentage }">
									<span class="percent">${subPercentage }%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>커뮤니티 생성률</h4>
								<div class="easypiechart" id="easypiechart-orange" data-percent="${commPercentage }">
									<span class="percent">${commPercentage }%</span>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xs-6 col-md-3">
						<div class="panel panel-default">
							<div class="panel-body easypiechart-panel">
								<h4>게시판 생성률</h4>
								<div class="easypiechart" id="easypiechart-teal" data-percent="${commBoardPercentage }">
									<span class="percent">${commBoardPercentage }%</span>
								</div>
							</div>
						</div>
					</div>
				</div>








				<div class="row">
				
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">유저채널 카테고리</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/6e0bd0c0-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:'%EC%9C%A0%EC%A0%80%EC%B1%84%EB%84%90%20%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:'%EC%9C%A0%EC%A0%80%EC%B1%84%EB%84%90%20%EC%B9%B4%ED%85%8C%EA%B3%A0%EB%A6%AC',viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">구독자현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/a1a6e000-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:%EA%B5%AC%EB%8F%85%EC%9E%90%ED%98%84%ED%99%A9,filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:%EA%B5%AC%EB%8F%85%EC%9E%90%ED%98%84%ED%99%A9,viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>
					
				</div>











				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">가입자현황</h1>
					</div>
				</div>


				<div class="row">
				
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">월별 가입현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/c1921160-258b-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:'%EC%9B%94%EB%B3%84%20%EA%B0%80%EC%9E%85%ED%98%84%ED%99%A9',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:ture,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:'%EC%9B%94%EB%B3%84%20%EA%B0%80%EC%9E%85%ED%98%84%ED%99%A9',viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">날짜별 가입현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/5c789be0-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:'%EB%82%A0%EC%A7%9C%EB%B3%84%20%EA%B0%80%EC%9E%85%ED%98%84%ED%99%A9',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:'%EB%82%A0%EC%A7%9C%EB%B3%84%20%EA%B0%80%EC%9E%85%ED%98%84%ED%99%A9',viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>
					
				</div>	







				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">구독자현황</h1>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">월별 구독현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/7ff34020-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:'%EC%9B%94%EB%B3%84%20%EA%B5%AC%EB%8F%85%ED%98%84%ED%99%A9',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:'%EC%9B%94%EB%B3%84%20%EA%B5%AC%EB%8F%85%ED%98%84%ED%99%A9',viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="panel panel-default">
							<div class="panel-heading">날짜별 구독현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/8e5a8970-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:'%EB%82%A0%EC%A7%9C%EB%B3%84%20%EA%B5%AC%EB%8F%85%ED%98%84%ED%99%A9',filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:'%EB%82%A0%EC%A7%9C%EB%B3%84%20%EA%B5%AC%EB%8F%85%ED%98%84%ED%99%A9',viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>



				</div>
				
				
				
				<div class="row">
				
					<div class="col-md-12">
						<div class="panel panel-default">
							<div class="panel-heading">구독매출현황</div>
							<div class="panel-body text-center">
								<iframe src="http://192.168.56.105:5601/app/dashboards#/view/b53373e0-258c-11ec-9509-533be27e5eec?embed=true&_g=(filters:!(),refreshInterval:(pause:!t,value:0),time:(from:now-15m,to:now))&_a=(description:%EA%B5%AC%EB%8F%85%EB%A7%A4%EC%B6%9C%ED%98%84%ED%99%A9,filters:!(),fullScreenMode:!f,options:(hidePanelTitles:true,useMargins:!t),query:(language:kuery,query:''),timeRestore:!t,title:%EA%B5%AC%EB%8F%85%EB%A7%A4%EC%B6%9C%ED%98%84%ED%99%A9,viewMode:view)&hide-filter-bar=true" height="330" width="330" frameborder="0"></iframe>
							</div>
						</div>
					</div>
					
				</div>






<%-- 


				<br>
				<h1>끝?</h1>
				<br>



				<div class="row">
					<div class="col-md-9 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Bar Chart Example</div>
							<div class="panel-body">
								<div id="morris-bar-chart"></div>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Donut Chart Example</div>
							<div class="panel-body">
								<div id="morris-donut-chart"></div>
							</div>
						</div>
					</div>

				</div>
				
				
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<!-- /. ROW  -->





				<div class="row">
					<div class="col-md-4 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">Tasks Panel</div>
							<div class="panel-body">
								<div class="list-group">

									<a href="#" class="list-group-item"> 
									<span class="badge">7
											minutes ago</span> 
											<i class="fa fa-fw fa-comment"></i> Commented on
										a post
									</a> 
									<a href="#" class="list-group-item">
									 <span class="badge">16
											minutes ago</span> 
											<i class="fa fa-fw fa-truck"></i> Order 392
										shipped
									</a> 
									<a href="#" class="list-group-item">
									 <span class="badge">36
											minutes ago</span> 
											<i class="fa fa-fw fa-globe"></i> Invoice 653 has
										paid
									</a>
									 <a href="#" class="list-group-item"> 
									 <span class="badge">1
											hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has been
										added
									</a> <a href="#" class="list-group-item"> <span class="badge">1.23
											hour ago</span> <i class="fa fa-fw fa-user"></i> A new user has
										added
									</a> <a href="#" class="list-group-item"> <span class="badge">yesterday</span>
										<i class="fa fa-fw fa-globe"></i> Saved the world
									</a>
								</div>
								<div class="text-right">
									<a href="#">More Tasks <i class="fa fa-arrow-circle-right"></i></a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-8 col-sm-12 col-xs-12">

						<div class="panel panel-default">
							<div class="panel-heading">Responsive Table Example</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>S No.</th>
												<th>First Name</th>
												<th>Last Name</th>
												<th>User Name</th>
												<th>Email ID.</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>John</td>
												<td>Doe</td>
												<td>John15482</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>2</td>
												<td>Kimsila</td>
												<td>Marriye</td>
												<td>Kim1425</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>3</td>
												<td>Rossye</td>
												<td>Nermal</td>
												<td>Rossy1245</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>4</td>
												<td>Richard</td>
												<td>Orieal</td>
												<td>Rich5685</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>5</td>
												<td>Jacob</td>
												<td>Hielsar</td>
												<td>Jac4587</td>
												<td>name@site.com</td>
											</tr>
											<tr>
												<td>6</td>
												<td>Wrapel</td>
												<td>Dere</td>
												<td>Wrap4585</td>
												<td>name@site.com</td>
											</tr>

										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- /. ROW  -->



--%>



				<footer>



				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap J -->
	<script src="/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script src="/assets/js/jquery.metisMenu.js"></script>
	<!-- Morris Chart Js -->
	<script src="/assets/js/morris/raphael-2.1.0.min.js"></script>
	<script src="/assets/js/morris/morris.js"></script>


	<script src="/assets/js/easypiechart.js"></script>
	<script src="/assets/js/easypiechart-data.js"></script>

	<script src="/assets/js/Lightweight-Chart/jquery.chart.js"></script>

	<!-- Custom Js -->
	<script src="/assets/js/custom-scripts.js"></script>


</body>
</html>