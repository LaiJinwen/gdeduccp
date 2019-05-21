<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>广东教育工委党建工作信息管理系统登录</title>
<link rel="stylesheet" type="text/css" href="/gdeduccp/assets/css/style.css" />
<link rel="stylesheet" type="text/css" href="/gdeduccp/assets/css/body.css"/> 
</head>
<body>
<div class="container">

	<section id="content">
		<form action="${pageContext.request.contextPath}/login" method="post">
			<h1>用户登录</h1>
			<div>
				<input type="text" placeholder="用户名" required="" id="username" name="userid" />
			</div>
			<div>
				<input type="password" placeholder="密码" required="" id="password" name="password" />
			</div>
			 <div class="">
				<span class="help-block u-errormessage" id="js-server-helpinfo">&nbsp;</span></div> 
			<div>
				<!-- <input type="submit" value="Log in" /> -->
				<input type="submit" value="登录" class="btn btn-primary" id="js-btn-login"/>
				<a href="#">忘记密码?</a>
				<!-- <a href="#">Register</a> -->
			</div>
		</form><!-- form -->

	</section><!-- content -->
</div>
<!-- container -->


<br><br><br><br>
<div style="text-align:center;">
<p>广东省教育工委党建工作信息管理系统</p>
</div>
</body>
</html>