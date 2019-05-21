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
	<div class="header" style="margin-top:10px;">
		 
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档提交统计</li>
		</ol>

	</div>

	<div id="page-inner">
		<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/leader/documentStatBySchool" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								<div class="row">
								<div class="form-group col-md-6">
										<label for="doc-num" class="col-sm-2 control-label">文档编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${documentCondition.documentNo}"
												placeholder="文档编号">
										</div>
									</div>
									
									<div class="form-group col-md-6">
										<label for="doc-title" class="col-sm-2 control-label">文档标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="doc-title"
												name="title" value="${documentCondition.title}"
												placeholder="标题">
										</div>
									</div>
									<div class="form-group col-md-6" style="margin:0px">
										<label class="col-sm-2 control-label">办学层次</label>
										<div class="col-sm-10">
										
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="本科院校"
													name="schoolLevel" 
                                                 <c:if test="${fn:contains(documentCondition.schoolLevel,'本科院校')==true}">
													checked	 
										          </c:if>
                                                 > 
                                                 <label
													for="checkbox-fa-light-1">本科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="专科院校"
													name="schoolLevel" 
                                            <c:if test="${fn:contains(documentCondition.schoolLevel,'专科院校')==true}">
													checked	 
										          </c:if> 
                                               > <label
													for="checkbox-fa-light-2">专科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-3" value="成人高校"
													name="schoolLevel" 
                                           <c:if test="${fn:contains(documentCondition.schoolLevel,'成人高校')==true}">
													checked	 
										          </c:if> 
                                              > <label
													for="checkbox-fa-light-3">成人高校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="研究生"
													name="schoolLevel" 
                   <c:if test="${fn:contains(documentCondition.schoolLevel,'研究生')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-4">研究生</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="其他"
													name="schoolLevel" 
                   <c:if test="${fn:contains(documentCondition.schoolLevel,'其他')==true}">
													checked	 
										          </c:if> 
> <label
													for="checkbox-fa-light-4">其他</label>
											</div>
										</div>
									</div>
								
								 
									<div class="form-group col-md-6">
										<label for="doc-title" class="col-sm-2 control-label">高校名称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="doc-title"
												name="schoolName" value="${documentCondition.schoolName}"
												placeholder="高校名称">
										</div>
									</div>
									<div class="form-group col-md-6">
										<label class="col-sm-2 control-label">办学性质</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="公办"
													name="schoolType" 
 <c:if test="${fn:contains(documentCondition.schoolType,'公办')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-1">公办 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="民办"
													name="schoolType" 
 <c:if test="${fn:contains(documentCondition.schoolType,'民办')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-2">民办</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-3" value="独立学院"
													name="schoolType" 
 <c:if test="${fn:contains(documentCondition.schoolType,'独立学院')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-3">独立学院</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="合作办学"
													name="schoolType" 
 <c:if test="${fn:contains(documentCondition.schoolType,'合作办学')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-4">合作办学</label>
											</div>
										</div>
									</div>
									<div class="form-group col-md-6">
										<label class="col-sm-2 control-label">组织关系</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="省工委"
													name="belong" 
 <c:if test="${fn:contains(documentCondition.belong,'省工委')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-1"> 工委 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="其他"
													name="belong" 
 <c:if test="${fn:contains(documentCondition.belong,'其他')==true}">
													checked
										          </c:if> 
> <label
													for="checkbox-fa-light-2"> 其他 </label>
											</div>
										</div>
									</div>
                                         
									<div class="form-group col-md-12">
										<button type="button" class="btn btn-primary" onclick='goToPage(1)'>确定查询</button>
										<input type='hidden' id='page' name='page'
											value='${docs.currPage}' />
										 <a class="btn btn-primary navbar-btn" href="${pageContext.request.contextPath}/doc/xls/docStatistics.xls" download="${pageContext.request.contextPath}/doc/xls/docStatistics.xls"><i class="ti-download"></i>下载excle文件</a>	
										 
									</div>

								</div>
								
							</div>
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover" style="width:600">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">代码</th>
											<th class="text-center">高校</th>
											<th class="text-center">主管部门</th>
											<th class="text-center">办学层次</th>
											<th class="text-center">办学性质</th>
											<th class="text-center">组织关系</th>
											<th class="text-center">提醒次数</th>
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
												<td>${doc.organizationNo}</td>
												<td>${doc.organizationName}</td>
												<td>${doc.supervisorDepartment}</td>
												<td>${doc.schoolLevel}</td>
												<td>${doc.organizationType}</td>
												<td>${doc.belong}</td>
												<td>${doc.remindtimes} </td>
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