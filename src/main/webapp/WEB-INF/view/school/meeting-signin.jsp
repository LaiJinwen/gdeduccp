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
	<div data-role="page" id="signin">
		<div class="ui-content" data-role="main">
			<div id="titlediv">
				<h2>
				广东省高校党建工作信息管理系统				
				</h2>
				<h2>
					会议信息：
				</h2>
			</div> 
			
			<c:forEach items="${signatureMeetingMsg}" var="msg">
			
			<div id="infoarea">
				<ul data-role="listview" data-inset="true">
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			会议名称：
		      		</p>
		      		<p class="li-maininfo" id="meetingname">
		      			${msg.meetingTitle}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			会议时间：
		      		</p>
		      		<p class="li-maininfo" id="meetingtime">
		      			${msg.meetingTime}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			参会组织：
		      		</p>
		      		<p class="li-maininfo" id="school">
		      			${msg.organizationName }
		      		</p>
		      	</div>
		      </li>
		    </div>
		    
		    
			<div id="inputdiv">
			<form action="${pageContext.request.contextPath}/schoolMeeting/userMeetingSignature.do
				?organizationId=${msg.organizationId}&meetingId=${msg.meetingId}">
				 	
			      <div id="inputarea">
			      <div id="subdiv">
			      	<div class="input-subtitle"><p>联系人：</p></div>   
			        <div class="input-maininfo"><input id="atdnum" placeholder="请输入联系人" name="contacts" value="${msg.contacts}"></div>
			        
			        <div class="input-subtitle"><p>联系方式：</p></div>   
			        <div class="input-maininfo"><input id="atdnum" placeholder="请输入联系方式" name="Mobile" value="${msg.Mobile}"></div>
			        
			        <div class="input-subtitle"><p>联系邮箱：</p></div>   
			        <div class="input-maininfo"><input id="atdnum" placeholder="请输入邮箱" name="email" value="${msg.email}"></div>
			        
			      	<div class="input-subtitle"><p>参会人数：</p></div>   
			        <div class="input-maininfo"><input id="atdnum" placeholder="请输入参会人数（包括联系人）" name="attendeeNumber" value="${msg.attendeeNumber}"></div>
			        
			        <div class="input-subtitle"><p>参会名单：</p></div>   
			        <div class="input-maininfo"><textarea id="atdnum" placeholder="请输入参会详细名单" name="attendeesName" >${msg.attendeesName}</textarea> 
			      	</div>
			      	</div>
			      </div>
			      <div id="btnarea">
			      	<input type="submit" id="submit" data-inline="true" value="确认提交" >
				  </div>
			</form>
			</c:forEach>
			</div>
		</div>
	 
	<div data-role="page" id="success">
		<div class="ui-content" data-role="main">
			<div id="outcometitlediv">
				<h1>
				 广东省高校党建工作信息管理系统				
				</h1>
			</div>
			<div id="outcomediv">
				<p>签到成功!</p>
			</div>			
		</div>
		<div id="footer"  data-position="fixed">
			<img src="${pageContext.request.contextPath}/assets/img/paint.png">
		</div>
	</div>

	
</head>
</html>