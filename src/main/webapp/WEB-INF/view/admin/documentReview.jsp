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
<div id="page-wrapper">
	<div class="header" style="margin-top:10px;margin-bottom:5px;">
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>
	</div>
	<div id="page-inner" style="margin-top:5px;">
		<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/admin/documentReview"
			method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">文档编号</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${document.documentNo}"
												placeholder="文档编号" disabled>
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-type" class="col-sm-4 control-label">文档状态</label>

										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="documentState" value="${document.documentState}"
												placeholder="文档状态" disabled>
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-title" class="col-sm-4 control-label">文档标题</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="title" value="${document.title}" placeholder="标题"
												disabled>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">高校名称</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="schoolName" value="${document.organizationName}"
												placeholder="高校名称" disabled>
										</div>
									</div>
									<div class="form-group col-md-4">
										<label for="doc-type" class="col-sm-4 control-label">高校类别</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="schoolType" value="${document.organizationType}"
												placeholder="高校类别" disabled>
										</div>
									</div>
									<div class="form-group col-md-4"></div>
								</div>

							</div>
							<div class="form-group col-md-12">
								<script type="text/javascript">
									$(function() {
										changeWH();
									});

									function changeWH() {
										$("#myiframe").height(
												$(document).height());
										$("#myiframe").width(
												$(document).width());
									}

									window.onresize = function() {
										changeWH();

									}
								</script>

								<iframe id="myiframe" name="myiframe" width="100%" height="400" frameborder='1'
									src="${pageContext.request.contextPath}/doc/${document.documentNo}/${fn:substringBefore(document.accessory,'.')}.html"
									frameborder="0" scrolling="auto"></iframe>
							</div>
							<div class="form-group col-md-12">
								<div>
								    <c:set var="shtg" value="" />
								    <c:set var="thxg" value="" />
									<c:choose>
										<c:when test="${fn:trim(document.documentState) eq '审核通过'}">
											<c:set var="shtg" value="checked" />
										</c:when>
										<c:when test="${fn:trim(document.documentState) eq '退回'}">
											<c:set var="thxg" value="checked" />
										</c:when>
									</c:choose>

									<div class="radio3 radio-check radio-inline">
										<input type="radio" id="radio4" name="review" value="退回" ${thxg}>
										<label for="radio4"> 退回修改 </label>
									</div>
									<div class="radio3 radio-check radio-success radio-inline">
										<input type="radio" id="radio5" name="review" value="审核通过"
											${shtg}> <label for="radio5"> 审核通过 </label>
									</div>

								</div>
							</div>
							<div class="form-group col-md-12">
								<div class="sub-title">修改建议</div>
								<div>
									<textarea class="form-control" name='suggest' cols="100%"
										rows="6">${fn:trim(document.suggest)}</textarea>
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-0 col-sm-10">
									<input type='hidden' id='documentId' name='documentId'
										value='${document.documentId}' /> <input type='hidden'
										id='modifyflag' name='modifyflag' value='modify' />
									<button type="submit" class="btn btn-primary">确定</button>
								</div>
							</div>
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
	function goToPage(page) {
		document.getElementById("page").value = page;
		document.form1.submit();
	}
</script>

</body>
</html>