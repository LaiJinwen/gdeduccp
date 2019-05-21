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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css2.css">
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
	<script type="text/javascript">
		$(window).bind('resize load', function(){
		$("body").css("zoom", $(window).width() / 414);
		$("body").css("display" , "block");
		}); 
	</script>
	<div data-role="page" id="login">
		<div class="ui-content" data-role="main">
			<div id="logintitle">
				<h1>
				广东省高校党建工作信息管理系统				
				</h1>
			</div>
			<div id="loginarea">
			<form action="${pageContext.request.contextPath}/login" method="post" data-ajax="false">
			      <div id="inputarea">
			        <input id="username" placeholder="请输入账号" name="userid" >
			        
			        <input type="password" id="pwd" placeholder="请输入密码" name="password" >
			      </div>
			      <div id="btnarea">
			      <input type="submit" id="submit" data-inline="true" value="登录" >
				  </div>
				   <div id="btnarea">
			         ${reason}
				  </div>
			</form>
			</div>
		</div>
		<div id="footer" data-position="fixed">
			<img src="${pageContext.request.contextPath}/assets/mobile/img/paint.png">
		</div>
	</div>

</head>
</html>