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
		<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<!-- FontAwesome Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Morris Chart Styles-->
		<link href="${pageContext.request.contextPath}/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    

		<!-- Custom Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
	</head>
	<body>
	 <div id="wrapper">
		<%@ include file="navbar-top.jsp" %>
			<!-- /. NAV TOP  -->
			<%@ include file="navbar-side.jsp" %>
<!-- /. NAV SIDE  -->
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div class="header">
		<h1 class="page-header">
			
		</h1>
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>

	</div>

	<div id="page-inner">
		<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/vote/voteTaskList" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
						
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">投票标题</th>
											<th class="text-center">候选人数</th>
											<th class="text-center">可选人数</th>
											<th class="text-center">可投票数</th>
											<th class="text-center">已录候选人数</th>
											<th class="text-center">发布日期</th>
											<th class="text-center">候选人管理</th>
											<th class="text-center">投票二维码</th>												
											<th class="text-center">投票结果</th>
										 
										</tr>
									</thead>
									<tbody>
									<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${voteTasks.lists}">
											<tr>
											<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${doc.title}</td>
												<td>${doc.candidateNumber}</td>
												<td>${doc.maxChooseNumber}</td>
												<td>${doc.maxVoterNumber}</td>
												<td>${doc.count}</td>
												<td>${doc.publishDate}</td>
												<td>
												<a href="${pageContext.request.contextPath}/vote/voteCandidateList?votetaskid=${doc.voteTaskId}" target=_blank>管理候选人</a></td>
												<td>
												<a href="${pageContext.request.contextPath}/vote/genVoteUrl?votetaskid=${doc.voteTaskId}"  target=_blank >投票二维码</a>
												</td>
												<td>
												<a href="${pageContext.request.contextPath}/vote/voteResult?votetaskid=${doc.voteTaskId}" >查看投票结果</a></td>
																							</tr>
										</c:forEach>
                                       
									</tbody>
								</table>
							</div>
                       <input type='hidden' id='page' name='page' value='${voteTasks.currPage}' />
							<nav aria-label="Page navigation" style="text-align: center;">
								<ul class="pagination">
								    <c:set var="prepage"  value="enabled" />
								    <c:set var="nextpage" value="enabled" />
								    <c:set var="endpage" value="${voteTasks.currPage+10}" />
									<c:set var="startpage" value="${voteTasks.currPage}" />
									<c:choose>
										<c:when test="${endpage > voteTasks.totalPage}">
										    <c:set var="endpage" value="${voteTasks.totalPage}" />
										    <c:set var="startpage" value="${voteTasks.totalPage-10}" />
										    <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${voteTasks.currPage+10 > voteTasks.totalPage}'}">
											 <c:set var="endpage" value="${voteTasks.totalPage}" />
										     <c:set var="startpage" value="${voteTasks.totalPage-10}" />
										     <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${voteTasks.currPage < 10}">
										    <c:set var="endpage" value="10" />
										    <c:set var="startpage" value="1" />
										    <c:set var="prepage" value="disabled" />
										</c:when>
									</c:choose>
                                    <c:if test="${startpage<1}">
											<c:set var="startpage" value="1" />
									</c:if>
                                    <c:if test="${endpage>voteTasks.totalPage}">
										<c:set var="endpage" value="${voteTasks.totalPage}" />
									</c:if>
																			
									<li class="${prepage}">
									 <a href="#" aria-label="Previous"  onclick='goToPage(${startpage-10})'>
											<span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
										<c:set var="active" value="" />
										<c:if test="${voteTasks.currPage == p }">
											<c:set var="active" value="active" />
										</c:if>
										<li class="${active}">
										  <a href='#' onclick='goToPage(${p})'>${p}</a>
										</li>
									</c:forEach>

									<li  class="${nextpage}">
									 <a href="#" aria-label="Next" onclick='goToPage(${endpage})'> 
										<span aria-hidden="true">&raquo;</span>
									 </a>
									</li>
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
</script>

</body>
</html>