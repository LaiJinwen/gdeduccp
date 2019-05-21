<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/frozen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css1.css">

    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->
    <!--link href="/gdeduccp/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" /-->
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    
<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
<script  type="text/javascript">
	
</script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/task-manage.css">   
</head>

<body>

	<c:forEach var="document" items="${documents}">
	 <ul class="ui-list ui-list-function ui-border-tb">
		<li class="ui-border-t">
						<div class="ui-list-info">

					<div id="lil-info">
						<div>
							<p style="float: left; width:50%" class="ui-nowrap">${document.title}</p>
						</div>
						<div>
						  <c:set var="fontcolor" value="grey" />
						 <c:if test="${document.documentstate eq '未提交'}">
									<c:set var="fontcolor" value="red" />
						 </c:if>	 
						   <p style="float:right; color:${fontcolor}" class="ui-nowrap">${document.documentstate} &nbsp;&nbsp;
						   </p>
						</div>
					</div>
				</div>
		</li>
      </ul>
	</c:forEach>
</body>	
</html>
