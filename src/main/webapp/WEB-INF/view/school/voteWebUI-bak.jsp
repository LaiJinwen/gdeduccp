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
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
					<!-- <li><a href="#">Home</a></li> -->
					<li><a href="#">投票管理</a></li>
					<li class="active">投票任务列表</li>
				</ol>

			</div>

			<div id="page-inner">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="col-md-4"><b>投票标题：</b>${voteTask.title}</div>
							<div class="col-md-4"><b>最多可选：</b>${voteTask.maxchoosenumber}</div>
							<div class="col-md-4"><b>候选人/单位介绍：</b>
								<a
									href="${pageContext.request.contextPath}/doc/vote/${voteTask.title}.pdf"
									target=_blank>下载</a>
							</div>
							<div class="col-md-12"><b>投票简介：</b><br>
							   &nbsp;&nbsp;&nbsp;&nbsp;${voteTask.introduction}</div>
						</div>
					</div>
				</div>
				<div class="col-xs-8">
				    <form class="form-horizontal" role="form" id="form" >
						<input type="hidden" class="form-control" id="voterId" name="voterId" value=${voter.voterid}>
						<input type="hidden" class="form-control" id="voteTaskId" name="voteTaskId" value=${voteTask.votetaskid}>
						<div id="inputarea">
							<fieldset data-role="controlgroup">
								<label>请在以下候选人/单位中选取不超过${voteTask.maxchoosenumber}人/单位</label>
								&nbsp;&nbsp;&nbsp;&nbsp;
								<label style="color:red">特别注意：每个单位仅有一次投票机会，提交后无法更改，请慎重投票！</label>
								<br>
								<c:set var="recno" value="1" />
								<c:forEach items="${candidates}" var="candidate">
                                 <div class="col-md-12">
                                    <label>${recno}.  &nbsp;</label> 
									<label for="red${recno}">${candidate.name}</label>
									<input type="checkbox" name="choosenames" id="red${recno}"
										value="${candidate.name}">
									<c:set var="recno" value="${recno+1}" />
									<div >
									&nbsp;&nbsp;&nbsp;&nbsp; ${candidate.introduction}
									</div>
								  </div>
								</c:forEach>
							</fieldset>
						</div>
						<div id="btnarea">
							<input type="button" class="btn btn-primary col-md-offset-2" id="submit-btn" data-inline="true" value="投票">
						</div>
					</form>
				</div>


			</div>
			<footer>
				<p>广东省教育工委.</p>
			</footer>
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
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

	<script type="${pageContext.request.contextPath}text/javascript"></script>
	<script>
		function goToPage(page) {
			document.getElementById("page").value = page;
			document.form1.submit();
		}
	</script>

</body>
	<script type="text/javascript">
		$('#main-menu>li:eq(4)>a').addClass('active-menu');


		//form submit
		$('#submit-btn').click(function() {
						     var form = new FormData(document.getElementById("form"));     
							$.ajax({
										type : 'post',
										url : '${pageContext.request.contextPath }/vote/submitVote',
										data : form,
										success : function(result) {
											if (result.state == 1) {
												alert('投票成功！');
												window.location.href = '${pageContext.request.contextPath }/vote/intoWebVoteTaskListUi';
											}   else {
												alert('投票失败，请重新进入');
											}
										}
									});
						});
	</script>
</html>