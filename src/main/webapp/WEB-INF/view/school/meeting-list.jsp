<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>广东教育工委党建</title>
<!-- Bootstrap Styles-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Morris Chart Styles-->
<link
	href="${pageContext.request.contextPath}/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">  -->
</head>
<style>
th {
	text-align: center;
}

body {
	background-color: #eee;
}

.top-navbar {
	background-color: #cf2124;
}

#sideNav {
	color: #fff;
}

#main-menu {
	background-color: #eee;
}

#page-wrapper {
	box-shadow: 0 0 #fff;
	background-color: #fff;
}

.page-header {
	background-color: #fff;
}

.sidebar-collapse .nav>li>a {
	color: #ae3a3a;
	font-size: medium;
}

.sidebar-collapse .nav>li>a:hover, .sidebar-collapse .nav>li>a:focus {
	color: #fff;
}

.nav>li>a>i {
	color: #fff;
}
</style>
<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>

		<div id="page-wrapper">
			<div class="header" style="margin-top:10px;">
				 
				<ol class="breadcrumb">

					<li><a href="#" style="color: #ae3a3a">历史会议</a></li>
					<li class="active">会议管理</li>
				</ol>

			</div>
			<div id="page-inner">
				<form role="form" class="form-inline" name="form1"
					action="${pageContext.request.contextPath}/schoolMeeting/listMeeting.do"
					method="post">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">


									<div class="row">
										<div class="form-group col-md-4">
											<label for="doc-type" class="col-sm-4 control-label">参会情况</label>

											<div class="col-sm-8">
												<c:choose>
													<c:when test="${attendanceState eq '未参加'}">
														<c:set var="dcj" value="selected" />
													</c:when>
													<c:when test="${attendanceState eq '已参加'}">
														<c:set var="ycj" value="selected" />
													</c:when>
													<c:otherwise>
														<c:set var="qt" value="selected" />
													</c:otherwise>
												</c:choose>
												<select class="selectbox form-control"
													name="attendanceState" id="attendanceState">
													<option value="all" <c:out value="${qt}" />>所有会议</option>

													<option value="未参加" <c:out value="${dcj}" />>待报名会议</option>

													<option value="已参加" <c:out value="${ycj}" />>已报名会议</option>

												</select>
											</div>


										</div>
										<div class="form-group col-md-4">
											<button type="button" class="btn btn-primary"
												onclick='goToPage(1)'>确定查询</button>
											<input type='hidden' id='page' name='page'
												value='${meeting.currPage}' />
										</div>
									</div>


									<table class="table table-bordered text-center table-hover"
										style="margin-top: 20px;">
										<thead>
											<tr>
												<th>序号</th>

												<th>会议名称</th>
												<th>发布时间</th>
												<th>会议时间</th>
												<th>报名截止时间</th>
												<th>报名情况</th>
												<th>报名管理</th>
												

											</tr>
										</thead>
										<tbody>

											<c:set var="recno"
												value="${(meeting.currPage-1)* meeting.pageSize}" />
											<c:forEach items="${ meeting.lists}" var="m">
												<tr>
													<c:set var="recno" value="${recno+1}" />
													<td>${recno}</td>

													<td>${m.meetingTitle}</td>
													<td>
													 <fmt:formatDate value="${m.publishDate}" pattern="yyyy-MM-dd"/>
													</td>
													<td>
													 <fmt:formatDate value="${m.meetingTime}" pattern="yyyy-MM-dd"/>
													</td>
													<td>
													 <fmt:formatDate value="${m.enrollDeadline}" pattern="yyyy-MM-dd"/>
													</td>
 													<td>
													<c:if test="${fn:trim(m.attendanceState)  eq '未参加'}">
													                                     
                                                        <label style="color:red">请尽快报名</label>
                                                        
													</c:if> 
													<c:if test="${fn:trim(m.attendanceState)  eq '已参加'}">
													 已经报名
													</c:if> 													
													</td>
													<td style="color: blue">
													<c:if test="${fn:trim(m.attendanceState)  eq '未参加'}">
													<a href="${pageContext.request.contextPath}/schoolMeeting/intoUserMeetingfillMessageWeb.do?meetingId=${m.meetingId}&taskId=${m.taskId}">报名参会</a>
													
												             
											         </c:if> 
											         <c:if test="${fn:trim(m.attendanceState)  eq '已参加'}">
													<a href="${pageContext.request.contextPath}/schoolMeeting/intoUserMeetingfillMessageWeb.do?meetingId=${m.meetingId}&taskId=${m.taskId}">报名管理</a>
										
											          </c:if>
											          													</td>
 												</tr>
											</c:forEach>
										</tbody>
									</table>

									<div class="text-center">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<c:set var="prepage" value="enabled" />
												<c:set var="nextpage" value="enabled" />
												<c:set var="endpage" value="${meeting.currPage+10}" />
												<c:set var="startpage" value="${meeting.currPage}" />
												<c:choose>
													<c:when test="${endpage > meeting.totalPage}">
														<c:set var="endpage" value="${meeting.totalPage}" />
														<c:set var="startpage" value="${meeting.totalPage-10}" />
														<c:set var="nextpage" value="disabled" />
													</c:when>
													<c:when test="${meeting.currPage+10 > meeting.totalPage}'}">
														<c:set var="endpage" value="${meeting.totalPage}" />
														<c:set var="startpage" value="${meeting.totalPage-10}" />
														<c:set var="nextpage" value="disabled" />
													</c:when>
													<c:when test="${meeting.currPage < 10}">
														<c:set var="endpage" value="10" />
														<c:set var="startpage" value="1" />
														<c:set var="prepage" value="disabled" />
													</c:when>
												</c:choose>
												<c:if test="${startpage<1}">
													<c:set var="startpage" value="1" />
												</c:if>
												<c:if test="${endpage>meeting.totalPage}">
													<c:set var="endpage" value="${meeting.totalPage}" />
												</c:if>

												<li class="${prepage}"><a href="#"
													aria-label="Previous" onclick='goToPage(${startpage-10})'>
														<span aria-hidden="true">&laquo;</span>
												</a></li>

												<c:forEach var="p" begin="${startpage}" end="${endpage}"
													step="1">
													<c:set var="active" value="" />
													<c:if test="${meeting.currPage == p }">
														<c:set var="active" value="active" />
													</c:if>
													<li class="${active}"><a href='#'
														onclick='goToPage(${p})'>${p}</a></li>
												</c:forEach>

												<li class="${nextpage}"><a href="#" aria-label="Next"
													onclick='goToPage(${endpage})'> <span
														aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
									</div>

								</div>
							</div>
						</div>
					</div>
				</form>
			</div>

		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

	<script>

		function goToPage(page){
			document.getElementById("page").value=page;
			document.form1.submit();
		}

    </script>


</body>

</html>