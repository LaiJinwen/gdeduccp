<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css1.css">
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>

<script>
	$(document).ready(function(){
	$('#headnavbar li a').click(function () {
		$(this).removeClass('noactive');
		$(this).addClass('active');
        $('#headnavbar li a').not(this).removeClass('active');
        $('#headnavbar li a').not(this).addClass('noactive');
		})
	});

	$(window).bind('resize load', function(){
	$("body").css("zoom", $(window).width() / 414);
	$("body").css("display" , "block");
	});         
</script>

</head>
<body>

<div data-role="page" id="index">
	<div id="header" data-role="header" data-position="fixed" id="head">
		<div id="title">
			<h2>广东高校党建工作管理信息系统</h2>
		</div>
		<div data-role="navbar" id="headnavbar">
			<ul>
				<li><a href="${pageContext.request.contextPath}/mobileleader/schoolTypes" class="active"  target="myIframe">文档查询</a></li>
				<li><a href="${pageContext.request.contextPath}/mobileleader/documentStatBySchoolType" class="noactive" target="myIframe">文档统计</a></li>
			</ul>
		</div>
	</div>
	<div data-role="main" class="ui-content" id="maincontent">
		<section id="mainbody">
			<iframe name="myIframe" id="myIframe" src="${pageContext.request.contextPath}/mobileleader/schoolTypes" frameborder="0"></iframe>
		</section>
	</div>
	<div data-role="footer" data-position="fixed" data-id="footnavbar">
		<div data-role="navbar" id="footnavbar">
			<ul>
				<li><a id="1" class="active" href="#" data-icon="document-2">党建文档</a></li>
			    <li><a id="2" href="#indexUser" class="noactive" data-icon="user-2">个人信息</a></li>
			</ul>
		</div>
	</div>
</div>


<div data-role="page" id="indexMeeting">
	<div data-role="header" data-position="fixed">
		<div id="title">
			<h2>广东高校党建工作管理信息系统</h2>
		</div>
		<div data-role="navbar" id="headnavbar">
			<ul>
				<li><a href="" class="active" target="myIframe">会议查询</a></li>
				<li><a href="" class="noactive" target="myIframe">会议统计</a></li>
			</ul>
		</div>
	</div>
	<div data-role="main" class="ui-content">
		<h3 style="text-align: center;">
			此功能暂时未开放
		</h3>
	</div>
	<div data-role="footer" data-position="fixed" data-id="footnavbar">
		<div data-role="navbar" id="footnavbar">
			<ul>
				<li><a id="1" class="noactive" href="#index" data-icon="document-1">党建文档</a></li>
				<li><a id="2" href="#indexUser" class="noactive" data-icon="user-2">个人信息</a></li>
			</ul>
		</div>
	</div>
</div>

<div data-role="page" id="indexUser">
	<div data-role="header" data-position="fixed">
		<div id="title">
			<h2>广东高校党建工作管理信息系统</h2>
		</div>
	</div>
	<div data-role="main" class="ui-content">
		<div id="infodiv">
			<ul data-role="listview" data-inset="true">
		      <li>
		        <img id="photo" src="${pageContext.request.contextPath}/assets/mobile/img/66.png">
		        <h1 id="name">工委管理员</h1>
		        <p id="introduction">工委管理员</p>
 		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			单位：
		      		</p>
		      		<p class="li-maininfo" id="nationality">
		      			广东教育工委
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			职位：
		      		</p>
		      		<p class="li-maininfo" id="duty">
		      			管理员
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			性别：
		      		</p>
		      		<p class="li-maininfo" id="gender">
		      			男
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			生日：
		      		</p>
		      		<p class="li-maininfo" id="birthDay">
		      			12.20
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			政治面貌：
		      		</p>
		      		<p class="li-maininfo" id="politicsStatus">
		      			党员
		      		</p>
		      	</div>
		      </li>

    		</ul>
		</div>
	</div>
		<input type="button" id="modify" data-inline="true" value="修改资料" >
        <input type="button" id="quit" data-inline="true" value="退出登录" >
	<div data-role="footer" data-position="fixed" data-id="footnavbar" data-tap-toggle="false">
		<div data-role="navbar" id="footnavbar">
			<ul>
				<li><a href="#index" class="noactive" data-icon="document-1">党建文档</a></li>
				<li><a href="#" class="active" data-icon="user-1">个人信息</a></li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>