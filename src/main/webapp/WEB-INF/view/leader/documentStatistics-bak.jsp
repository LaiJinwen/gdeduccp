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
		<title>文档统计</title>
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
			action="${pageContext.request.contextPath}/leader/documentStatBySchool" method="post">
			<div class="row">
				<div class="col-xs-8">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">文档编号</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${documentCondition.documentNo}" placeholder="文档编号">
										</div>
									</div>

									<div class="form-group col-md-4">
										<label for="doc-num" class="col-sm-4 control-label">高校名称</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="schoolName" value="${documentCondition.schoolName}" placeholder="高校名称">
										</div>
									</div>
                                    <div class="form-group col-md-4">
										<label for="doc-type" class="col-sm-4 control-label">高校类别</label>
										<div class="col-sm-8">
											<select class="selectbox form-control" name="schoolType">
                                                <c:choose>
													<c:when test="${documentCondition.schoolType eq '公办本科'}">
														<c:set var="gbbk" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '民办本科'}">
														<c:set var="mbbk" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '公办高职'}">
														<c:set var="gbgz" value="selected" />
													</c:when>
													<c:when test="${documentCondition.schoolType eq '民办高职'}">
														<c:set var="mbgz" value="selected" />
													</c:when>
													<c:otherwise>
														<c:set var="qt" value="selected" />
													</c:otherwise>
												</c:choose>
												<option value="all" <c:out value="${qt}" />>不限类别</option>
												<option value="公办本科" <c:out value="${gbbk}" />>公办本科</option>
												<option value="民办本科" <c:out value="${mbbk}" />>民办本科</option>
												<option value="公办高职" <c:out value="${gbgz}" />>公办高职</option>
												<option value="民办高职" <c:out value="${mbgz}" />>民办高职</option>

											</select>
										</div>
									</div>

								</div>
								<div class="row">
									 <div class="form-group col-md-8">
									 <br>
										<button type="submit" class="btn btn-primary">确定查询</button>
									</div>
								</div>
							</div>
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover" style="width:600">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">高校</th>
											<th class="text-center">提交数量</th>
											<th class="text-center">未交数量</th>

										</tr>
									</thead>
									<tbody>
									<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${docCounts}">
											<tr>
                                              <c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${doc.organizationName}</td>
												<td>${doc.count1}</td>
												<td>
												 <c:if test="${doc.count2>0}">
												   <font color="red"> ${doc.count2}</font>
												 </c:if>
												 
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}
</script>

</body>
</html>