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
<title>添加候选人</title>
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
			<div class="header">
				<h1 class="page-header"></h1>
				<ol class="breadcrumb">
					<li><a href="#">投票管理</a></li>
					<li class="active">添加候选人</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-8">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/vote/addCandidate"
									method="post" >

									<div class="form-group">


										<div class="sub-title">姓名</div>
										<div>
											<input type="text" class="form-control" id="name" name="name">
											<input type="hidden" class="form-control" id="voteTaskId"
												name="votetaskid" value=${votetaskid}>
										</div>
										<div class="sub-title">简介</div>
										<div>
											<textarea class="form-control" rows="5" name='introduction'></textarea>
										</div>
										<input type="submit" value="添加" />
									</div>

								</form>
							</div>


							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">候选人</th>
                                             <th class="text-center">简介</th>
											<th class="text-center">候选人管理</th>


										</tr>
									</thead>
									<tbody>
										<c:set var="recno" value="0" />
										<c:forEach var="candidate" items="${candidaters}">
											<tr>
												<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${candidate.name}</td>
                                                <td>${candidate.introduction}</td>
												<td><a
													href="${pageContext.request.contextPath}/vote/deleteCandidate?candidateid=${candidate.candidateid}&votetaskid=${votetaskid}"
													target=_blank>删除</a></td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
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

</html>