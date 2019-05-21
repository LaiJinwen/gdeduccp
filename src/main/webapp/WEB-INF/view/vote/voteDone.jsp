<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css4.css">
	
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
	<script type="text/javascript">
		$(window).bind('resize load', function(){
		$("body").css("zoom", $(window).width() / 414);
		$("body").css("display" , "block");
		}); 
	</script>
				
	<div  data-role="page" id="success">
		<div class="ui-content" data-role="main">
			<div id="outcometitlediv">
				<h2>
				 广东省高校党建工作投票				
				</h2>
			</div>
			<div id="outcomediv">
				<p>您已经投过票!</p>
				 
			</div>			
		</div>
		<div id="footer"  data-position="fixed">
			<img src="${pageContext.request.contextPath}/assets/img/paint.png">
		</div>
	</div>

</head>
</html>