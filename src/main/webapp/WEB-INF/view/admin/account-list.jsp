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
<title>用户账户维护</title>
<!-- Bootstrap Styles-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/select2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/checkbox3.min.css"
	rel="stylesheet">
<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!--自定义-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/task-manage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />
</head>

<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div class="header" style="margin-top:10px;">
		 
				<ol class="breadcrumb">
					<li><a href="#">账户管理</a></li>
					<li class="active">账户列表</li>
				</ol>

			</div>
			<div id="page-inner">



				<div class="row">
					<div class="col-xs-12">
					<div class="panel panel-default">
							<div class="panel-body">
						<form role="form" class="form-inline" name="form1"
							action="${pageContext.request.contextPath}/admin/intoUserList"
							method="post">
							 <div class="form-group">
								<label for="organizationName" class="control-label">单位名称</label>
									<input type="text" class="form-control" id="organizationName"
										name="organizationName" value="${organizationName}"
										placeholder="单位名称">
							    </div><div class="form-group">
								<button    type="submit" class="btn btn-primary">确定查询</button> 
								</div>
	 						</form>
						</div>
						</div>
					</div>
				</div>


				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-hover">
										<thead>
											<tr>
												<th>序号</th>
												<th>头像</th>
												<th>高校名称</th>
												<th>用户名</th>
												<th>姓名</th>
												<th>用户类型</th>
												<th>手机</th>
												<th>邮箱</th>
												<th>操作</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="user" varStatus="status">
												<tr>
													<td>${status.index+1 }</td>
													<td><a
														href="${pageContext.request.contextPath}/image/${user.photo}"
														target=_blank> <img
															src="${pageContext.request.contextPath}/image/${user.photo}"
															style="width: 40px; height: 50px;"
															onerror="this.src='${pageContext.request.contextPath}/image/default.png'"></a>
													</td>
													<td>${user.organizationName}</td>
													<td>${user.userId}</td>
													<td>${user.userName}</td>
													<td><c:if test="${user.userType eq 'user'}">
														    高校管理员
													    </c:if> <c:if test="${user.userType eq 'leader'}">
														    省教育工委领导
													    </c:if> <c:if test="${user.userType eq 'admin'}">
														    省教育工委管理员
													    </c:if></td>
													<td>${user.mobile }</td>
													<td>${user.email }</td>

													<td><a
														href="${pageContext.request.contextPath}/admin/intoUserModify.do?userId=${user.userId}">修改</a>&nbsp;
														<a
														href="${pageContext.request.contextPath}/admin/deleteUser?userId=${user.userId}"
														class="delete-item">删除</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<nav aria-label="Page navigation" class="page-nav"
									style="width: 600px; margin: 0 auto">
									<ul class="pagination">
										<li class=""><a
											href="${pageContext.request.contextPath }/admin/intoUserList.do?page=1"
											aria-label="Previous"> <span aria-hidden="true">首页</span>
										</a></li>
										<li class=""><a
											href="${pageContext.request.contextPath }/admin/intoUserList.do?page=${page.prePage}"
											aria-label="Previous"> <span aria-hidden="true">上一页</span>
										</a></li>
										<c:forEach items="${page.navigatepageNums }" var="each">
											<c:if test="${each==page.pageNum}">
												<li class="active"><a
													href="${pageContext.request.contextPath }/admin/intoUserList.do?page=${each}">${each }</a>
											</c:if>
											<c:if test="${each!=page.pageNum}">
												<li class=""><a
													href="${pageContext.request.contextPath }/admin/intoUserList.do?page=${each}">${each }</a>
											</c:if>
										</c:forEach>
										<li><a
											href="${pageContext.request.contextPath }/admin/intoUserList.do?page=${page.nextPage}"
											aria-label="Next"> <span aria-hidden="true">下一页</span>
										</a></li>
										<li class=""><a
											href="${pageContext.request.contextPath }/admin/intoUserList.do?page=${page.pages}"
											aria-label="Previous"> <span aria-hidden="true">尾页</span>
										</a></li>
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<footer>
					<p>
						Copyright &copy; 2016.Company name All rights reserved. <a
							target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
					</p>

				</footer>
			</div>
			<!-- /. PAGE INNER  -->
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
	<script
		src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".selectbox").select2();
		});
		$('#main-menu>li:eq(6)>a').addClass('active-menu');
	</script>

	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
<SCRIPT>
	function showDialog(url) {
		var iWidth = 1200; //窗口宽度
		var iHeight = 900;//窗口高度
		var iTop = 10;//(window.screen.height-iHeight)/2;
		var iLeft = (window.screen.width - iWidth) / 2;
		window
				.open(
						url,
						"_blank",
						"Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="
								+ iWidth
								+ " ,Height="
								+ iHeight
								+ ",top="
								+ iTop + ",left=" + iLeft);
	}
</SCRIPT>
</html>