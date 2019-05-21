<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
	<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/css4.css">
	
	<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
	<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
	<script type="text/javascript">
		$(window).bind('resize load', function(){
		$("body").css("zoom", $(window).width() / 414);
		$("body").css("display" , "block");
		}); 
	</script>
				
	<div  data-role="page" id="success">
		<div class="ui-content" data-role="main">
			<div id="outcometitlediv">
				<h1>
				 广东省高校党建工作信息管理系统				
				</h1>
			</div>
			<div id="outcomediv">
				<p>签到成功!</p>
				<p>可重新扫描二维码修改签到信息</p>
			</div>			
		</div>
		<div id="footer"  data-position="fixed">
			<img src="${pageContext.request.contextPath}/assets/img/paint.png">
		</div>
	</div>

</head>
</html>