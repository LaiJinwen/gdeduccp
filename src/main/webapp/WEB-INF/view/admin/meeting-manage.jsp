<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>广东省教育工委党建工作信息系统</title>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
</head>
<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>
		<!-- /. NAV SIDE  -->
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div class="header" style="margin-top:10px;">
				 
				<ol class="breadcrumb">
					<li>会议任务管理</li>
					<li>会议检索</li>
				</ol>

			</div>

			<div id="page-inner">
				<form role="form" class="form-inline" name="form1"
					action="${pageContext.request.contextPath}/admin/intoManageMeeting"
					method="post">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="panel-body">
										<div class="row">
											<div class="form-group col-md-4">
												<label for="doc-title" class="col-sm-4 control-label">会议标题</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="doc-title"
														name="meetingTitle" placeholder="标题">
												</div>
											</div>
											<div class="form-group col-md-4">
												<label for="doc-no" class="col-sm-4 control-label">会议编号</label>
												<div class="col-sm-8">
													<input type="text" class="form-control" id="doc-no"
														name="meetingNo" placeholder="编号">
												</div>
											</div>
											<div class="form-group col-md-4">
												<div class="form-group col-md-4">
													<button type="button" class="btn btn-primary"
														onclick='goToPage(1)'>确定查询</button>
													<input type='hidden' id='page' name='page'
														value='${docs.currPage}' />
												</div>
											</div>
										</div>


									</div>
									<div class="table-responsive text-center">
										<table class="table table-striped table-bordered table-hover">
											<thead>
												<tr>
													<th class="text-center">序号</th>
													<th class="text-center">会议编号</th>
													<th class="text-center">会议标题</th>
													<th class="text-center">会议时间</th>
													<th class="text-center">会议地点</th>
													<th class="text-center">发布时间</th>
													<th class="text-center">已报人数</th>
													<th class="text-center">二维码</th>
													<th class="text-center">操作</th>
												</tr>
											</thead>
											<tbody>
												<c:set var="recno"
													value="${(meetings.currPage-1)*meetings.pageSize}" />
												<c:forEach var="doc" items="${meetings.lists}">
													<tr>
														<c:set var="recno" value="${recno+1}" />
														<td>${recno}</td>
														<td>${doc.meetingNo}</td>
														<td>${doc.meetingTitle}</td>
														<td><fmt:formatDate value="${doc.meetingTime}"
																pattern="yyyy-MM-dd" /></td>

														<td>${doc.meetingAddresses}</td>
														<td><fmt:formatDate value="${doc.publishDate}"
																pattern="yyyy-MM-dd" /></td>
														<td>${doc.count}</td>
														<td>
														<a href="${pageContext.request.contextPath}/admin/getMeetingQRCode?meetingId=${doc.meetingId}" target=_blank>
														<img style="float: right" height="60"
															width="60" alt="扫描二维码"
															src="${pageContext.request.contextPath}/admin/getMeetingQRCode?meetingId=${doc.meetingId}">
														</a>
														</td>
														<td><a class="btn btn-default" href="#"
															onclick='deleMeeting(${doc.meetingId})'> <span
																aria-hidden="true">删除</span>
														</a>
														 <a class="btn btn-default"
															href="${pageContext.request.contextPath}/admin/getMeetingDetails?meetingId=${doc.meetingId}"
															target=_blank>详情</a></td>
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>

									<nav aria-label="Page navigation" class="page-nav"
										style="width: 530px; margin: 0 auto">
										<ul class="pagination">
											<c:set var="prepage" value="enabled" />
											<c:set var="nextpage" value="enabled" />
											<c:set var="endpage" value="${meetings.currPage+10}" />
											<c:set var="startpage" value="${meetings.currPage}" />
											<c:choose>
												<c:when test="${endpage > meetings.totalPage}">
													<c:set var="endpage" value="${meetings.totalPage}" />
													<c:set var="startpage" value="${meetings.totalPage-10}" />
													<c:set var="nextpage" value="disabled" />
												</c:when>
												<c:when
													test="${meetings.currPage+10 > meetings.totalPage}'}">
													<c:set var="endpage" value="${meetings.totalPage}" />
													<c:set var="startpage" value="${meetings.totalPage-10}" />
													<c:set var="nextpage" value="disabled" />
												</c:when>
												<c:when test="${meetings.currPage < 10}">
													<c:set var="endpage" value="10" />
													<c:set var="startpage" value="1" />
													<c:set var="prepage" value="disabled" />
												</c:when>
											</c:choose>
											<c:if test="${startpage<1}">
												<c:set var="startpage" value="1" />
											</c:if>
											<c:if test="${endpage>meetings.totalPage}">
												<c:set var="endpage" value="${meetings.totalPage}" />
											</c:if>

											<li class="${prepage}"><a href="#" aria-label="Previous"
												onclick='goToPage(${startpage-10})'> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
											<c:forEach var="p" begin="${startpage}" end="${endpage}"
												step="1">
												<c:set var="active" value="" />
												<c:if test="${meetings.currPage == p }">
													<c:set var="active" value="active" />
												</c:if>
												<li class="${active}"><a href='#'
													onclick='goToPage(${p})'>${p}</a></li>
											</c:forEach>

											<li class="${nextpage}"><a href="#" aria-label="Next"
												onclick='goToPage(${endpage})'> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
				</form>



				<footer>
					<p>广东省教育工委.</p>
				</footer>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="/gdeduccp/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="/gdeduccp/assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="/gdeduccp/assets/js/jquery.metisMenu.js"></script>
	<script src="/gdeduccp/assets/js/select2.full.min.js"></script>

	<!-- Custom Js -->
	<script src="/gdeduccp/assets/js/custom-scripts.js"></script>

	<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}
 
		function deleMeeting(mid){				
			if (confirm("确定删除吗？")) {
				 
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/admin/doDeleteMeeting?meetingId='+mid,
					success : function(result) {
						 	if (result.state == 1) {
						 	
							 alert('删除成功!');	
							 window.location.reload();
						} else {
							alert('删除失败!');
						}
					},
					error : function(result){
						alert('删除异常!');
					}
				});			
				
			} else {
				}
			 } 
	</script>
</body>
</html>