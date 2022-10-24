<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal" />
</sec:authorize>
<style>
a {
  color: inherit;
}

h1, h2, h3, h4 {
  margin: 0;
  margin-bottom: 10px;
  margin-top: 10px;
}

h1 {
  font-size: 3em;
}

.menu {
  -webkit-filter: url("#goo");
          filter: url("#goo");
}

.menu-item, .menu-open-button {
  background: #e91e63;
  border-radius: 100%;
  width: 80px;
  height: 80px;
  margin-left: -40px;
  position: absolute;
  top: 120px;
  color: white;
  text-align: center;
  line-height: 80px;
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
  -webkit-transition: -webkit-transform ease-out 200ms;
          transition: transform ease-out 200ms;
}

.menu-open {
  display: none;
}

.hamburger {
  width: 25px;
  height: 3px;
  background: white;
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -12.5px;
  margin-top: -1.5px;
  -webkit-transition: -webkit-transform 200ms;
          transition: transform 200ms;
}

.hamburger-1 {
  -webkit-transform: translate3d(0, -8px, 0);
          transform: translate3d(0, -8px, 0);
}

.hamburger-2 {
  -webkit-transform: translate3d(0, 0, 0);
          transform: translate3d(0, 0, 0);
}

.hamburger-3 {
  -webkit-transform: translate3d(0, 8px, 0);
          transform: translate3d(0, 8px, 0);
}

.menu-open:checked + .menu-open-button .hamburger-1 {
  -webkit-transform: translate3d(0, 0, 0) rotate(45deg);
          transform: translate3d(0, 0, 0) rotate(45deg);
}
.menu-open:checked + .menu-open-button .hamburger-2 {
  -webkit-transform: translate3d(0, 0, 0) scale(0.1, 1);
          transform: translate3d(0, 0, 0) scale(0.1, 1);
}
.menu-open:checked + .menu-open-button .hamburger-3 {
  -webkit-transform: translate3d(0, 0, 0) rotate(-45deg);
          transform: translate3d(0, 0, 0) rotate(-45deg);
}

.menu {
  position: fixed;
  right: 40px;
  bottom:60px;
  margin-left: -190px;
  padding-top: 20px;
  padding-left: 190px;
  width: 300px;
  height: 250px;
  box-sizing: border-box;
  font-size: 20px;
  text-align: left;
  z-index: 180;
 /*  position:fixed; 
  left:0px; 
  bottom:0px; 
  height:60px; 
  width:100%; 
  background:grey; 
  color: white;  */
}

.menu-item:hover {
  background: #ccc;
  color: #e91e63;
}
.menu-item:nth-child(3) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(4) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(5) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(6) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(7) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(8) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}
.menu-item:nth-child(9) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
}

.menu-open-button {
  z-index: 2;
  -webkit-transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
          transition-timing-function: cubic-bezier(0.175, 0.885, 0.32, 1.275);
  -webkit-transition-duration: 400ms;
          transition-duration: 400ms;
  -webkit-transform: scale(1.1, 1.1) translate3d(0, 0, 0);
          transform: scale(1.1, 1.1) translate3d(0, 0, 0);
  cursor: pointer;
}

.menu-open-button:hover {
  -webkit-transform: scale(1.2, 1.2) translate3d(0, 0, 0);
          transform: scale(1.2, 1.2) translate3d(0, 0, 0);
}

.menu-open:checked + .menu-open-button {
  -webkit-transition-timing-function: linear;
          transition-timing-function: linear;
  -webkit-transition-duration: 200ms;
          transition-duration: 200ms;
  -webkit-transform: scale(0.8, 0.8) translate3d(0, 0, 0);
          transform: scale(0.8, 0.8) translate3d(0, 0, 0);
}

.menu-open:checked ~ .menu-item {
  -webkit-transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
          transition-timing-function: cubic-bezier(0.935, 0, 0.34, 1.33);
}
.menu-open:checked ~ .menu-item:nth-child(3) {
  -webkit-transition-duration: 180ms;
          transition-duration: 180ms;
  -webkit-transform: translate3d(0.08361px, -104.99997px, 0);
          transform: translate3d(0.08361px, -104.99997px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(4) {
  -webkit-transition-duration: 280ms;
          transition-duration: 280ms;
  -webkit-transform: translate3d(90.9466px, -52.47586px, 0);
          transform: translate3d(90.9466px, -52.47586px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(5) {
  -webkit-transition-duration: 380ms;
          transition-duration: 380ms;
  -webkit-transform: translate3d(90.9466px, 52.47586px, 0);
          transform: translate3d(90.9466px, 52.47586px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(6) {
  -webkit-transition-duration: 480ms;
          transition-duration: 480ms;
  -webkit-transform: translate3d(0.08361px, 104.99997px, 0);
          transform: translate3d(0.08361px, 104.99997px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(7) {
  -webkit-transition-duration: 580ms;
          transition-duration: 580ms;
  -webkit-transform: translate3d(-90.86291px, 52.62064px, 0);
          transform: translate3d(-90.86291px, 52.62064px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(8) {
  -webkit-transition-duration: 680ms;
          transition-duration: 680ms;
  -webkit-transform: translate3d(-91.03006px, -52.33095px, 0);
          transform: translate3d(-91.03006px, -52.33095px, 0);
}
.menu-open:checked ~ .menu-item:nth-child(9) {
  -webkit-transition-duration: 780ms;
          transition-duration: 780ms;
  -webkit-transform: translate3d(-0.25084px, -104.9997px, 0);
          transform: translate3d(-0.25084px, -104.9997px, 0);
}
</style>
<c:choose>
	<c:when test="${empty principal}">

	</c:when>
	<c:otherwise>
		<input type="hidden" id="userNo" value="${principal.user.userNo}">
		<input type="hidden" id="userName" value="${principal.user.userName}">
		<nav class="menu">
  <input type="checkbox" href="#" class="menu-open" name="menu-open" id="menu-open"/>
  <label class="menu-open-button" for="menu-open">
    <span class="hamburger hamburger-1"></span>
    <span class="hamburger hamburger-2"></span>
    <span class="hamburger hamburger-3"></span>
  </label>
  
  <a id="atag" href="http://3.35.11.4:5000/chatting.html?name=${principal.user.userName}&" onclick="window.open(this.href, '_blank', 'width=500, height=600'); return false;" class="menu-item"> <i class="fa fa-envelope"></i> </a>
  <a href="/auth/payinfo" class="menu-item"> <i class="fa fa-plus"></i> </a>
  <a href="/auth/communityTotal" class="menu-item"> <i class="fa fa-heart"></i> </a>
  <a href="/auth/trend" class="menu-item"> <i class="fa fa-bar-chart"></i> </a>
  <a href="/mypage" class="menu-item"> <i class="fa fa-cog"></i> </a>
  <a href="/" class="menu-item"> <i class="fa fa-ellipsis-h"></i> </a>
  
</nav>


<!-- filters -->
<svg xmlns="http://www.w3.org/2000/svg" version="1.1">
    <defs>
      <filter id="shadowed-goo">
          
        
          <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" ></feGaussianBlur>
          <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" ></feColorMatrix>
          <feGaussianBlur in="goo" stdDeviation="3" result="shadow" ></feGaussianBlur>
          <feColorMatrix in="shadow" mode="matrix" values="0 0 0 0 0  0 0 0 0 0  0 0 0 0 0  0 0 0 1 -0.2" result="shadow" ></feColorMatrix>
          <feOffset in="shadow" dx="1" dy="1" result="shadow" ></feOffset>
          <feComposite in2="shadow" in="goo" result="goo" ></feComposite>
          <feComposite in2="goo" in="SourceGraphic" result="mix" ></feComposite>
      </filter>
      <filter id="goo">
          <feGaussianBlur in="SourceGraphic" result="blur" stdDeviation="10" ></feGaussianBlur>
          <feColorMatrix in="blur" mode="matrix" values="1 0 0 0 0  0 1 0 0 0  0 0 1 0 0  0 0 0 18 -7" result="goo" ></feColorMatrix>
          <feComposite in2="goo" in="SourceGraphic" result="mix" ></feComposite>
      </filter>
    </defs>
</svg>

	</c:otherwise>
</c:choose>



<script type="text/javascript">
var user = $('#userNo').val();
var userName = $('#userName').val();
	$.ajax({
	    url: "/auth/getUser",
	    data: { "userNo" : user },
	    type : "get",
	    datatype : "json",
	    success: function(data) {      
		             
	     	$("#atag").prop('href', "http://3.35.11.4:5000/chatting.html?name="+userName+"&profile="+data)
	    },error: function(request,status,error){
	       
	    }
	});
</script>
