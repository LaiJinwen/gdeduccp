<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/css4.css">

<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
	$(window).bind('resize load', function() {
		$("body").css("zoom", $(window).width() / 414);
		$("body").css("display", "block");
	});
</script>
<div data-role="page" id="signin">
	<div class="ui-content" data-role="main">
		<div id="titlediv">
			
			<h3>广东教育工委党建投票系统</h3>
		</div>


		<div id="inputdiv">
			<form
				action="${pageContext.request.contextPath}/vote/submitVoteResult.do?resultId=${resultId}">
					<input type="hidden" class="form-control" id="voterId"
										name="voterId" value=${voter.voterid}> 
					<input type="hidden" class="form-control" id="voteTaskId"
										name="voteTaskId" value=${voteTask.votetaskid}>
										
					<div id="inputarea">
						<fieldset data-role="controlgroup">
							<legend>请在以下候选人中选取不超过${votetask.maxchoosenumber}人</legend>
							<c:set var="recno" value="1" />
							<c:forEach items="${candidates}" var="candidate">
							
							  <label for="red${recno}">${candidate.name}</label> 
							  <input type="checkbox" name="choosenames" id="red${recno}" value="${candidate.name}"> 
						     <c:set var="recno" value="${recno+1}" />
						   </c:forEach>
						</fieldset>
					</div>
				<div id="btnarea">
					<input type="submit" id="submit" data-inline="true" value="确认提交">
				</div>
			</form>

		</div>
	</div>

</div>
<div data-role="page" id="success">
	<div class="ui-content" data-role="main">
		<div id="outcometitlediv">
			<h1>广东省高校党建工作信息管理系统</h1>
		</div>
		<div id="outcomediv">
			<p>签到成功!</p>
		</div>
	</div>
	<div id="footer" data-position="fixed">
		<img src="${pageContext.request.contextPath}/assets/img/paint.png">
	</div>
</div>


</head>
</html>