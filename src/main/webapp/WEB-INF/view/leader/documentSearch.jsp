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
		<title>文档检索</title>
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
	<div class="header" style="margin-top:10px;">
		 
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>

	</div>

	<div id="page-inner">
		<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/leader/documentSearch" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								
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
                                         <div class="form-group col-md-6">
												<label for="doc-type" class="col-sm-2 control-label">文档状态</label>

												<div class="col-sm-10">
													<select class="selectbox form-control" name="documentState"
														id="doc-type">

														<c:choose>
															<c:when
																test="${documentCondition.documentState eq '未提交'}">
																<c:set var="wtj" value="selected" />
															</c:when>
															<c:when test="${documentCondition.documentState eq '待审'}">
																<c:set var="ds" value="selected" />
															</c:when>
															<c:when test="${documentCondition.documentState eq '退回'}">
																<c:set var="th" value="selected" />
															</c:when>
															<c:when
																test="${documentCondition.documentState eq '审核通过'}">
																<c:set var="tg" value="selected" />
															</c:when>
															<c:otherwise>
																<c:set var="qt" value="selected" />
															</c:otherwise>
														</c:choose>
														<option value="all" <c:out value="${qt}" />>不限状态</option>
														<option value="未提交" <c:out value="${wtj}" />>未提交</option>
														<option value="待审" <c:out value="${ds}" />>待审</option>
														<option value="退回" <c:out value="${th}" />>退回</option>
														<option value="审核通过" <c:out value="${tg}" />>审核通过</option>

													</select>
												</div>
											</div>
									<div class="form-group col-md-6">
										<button type="button" class="btn btn-primary" onclick='goToPage(1)'>确定查询</button>
										<input type='hidden' id='page' name='page'
											value='${docs.currPage}' />
									</div>
								 

							</div>
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">文档编号</th>
											<th class="text-center">文档标题</th>
											<th class="text-center">单位</th>
											<th class="text-center">提醒次数</th>
											<th class="text-center">提交时间</th>
											<th class="text-center">状态</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
									<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${docs.lists}">
											<tr>
											<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${doc.documentNo}</td>
												<td>${doc.title}</td>
												<td>${doc.organizationName}</td>
												<td>${doc.remind}</td>
												<td>${doc.submitDate}</td>
												<td>${doc.documentState}</td>
												<td>
												 	<c:if test="${doc.documentState ne '未提交'}">	
												<c:set var="htmlname" value="${pageContext.request.contextPath}/doc/${doc.documentNo}/${fn:substringBefore(doc.accessory,'.')}backup.html" />
				                                     <a class="btn btn-default" href="#" onclick="showDialog('${htmlname}')">查看</a> &nbsp;&nbsp;
								 	 <a class="btn btn-primary navbar-btn" href="${pageContext.request.contextPath}/admin/downloadDocument.do?docId=${doc.documentId}" download="${pageContext.request.contextPath}/admin/downloadDocument.do?docId=${doc.documentId}"><i class="ti-download"></i>下载</a>	
													</c:if>
													</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

							<nav aria-label="Page navigation" class="page-nav" style="width:530px;margin:0 auto">
								<ul class="pagination">
								    <c:set var="prepage"  value="enabled" />
								    <c:set var="nextpage" value="enabled" />
								    <c:set var="endpage" value="${docs.currPage+10}" />
									<c:set var="startpage" value="${docs.currPage}" />
									<c:choose>
										<c:when test="${endpage > docs.totalPage}">
										    <c:set var="endpage" value="${docs.totalPage}" />
										    <c:set var="startpage" value="${docs.totalPage-10}" />
										    <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${docs.currPage+10 > docs.totalPage}'}">
											 <c:set var="endpage" value="${docs.totalPage}" />
										     <c:set var="startpage" value="${docs.totalPage-10}" />
										     <c:set var="nextpage" value="disabled" />
										</c:when>
										<c:when test="${docs.currPage < 10}">
										    <c:set var="endpage" value="10" />
										    <c:set var="startpage" value="1" />
										    <c:set var="prepage" value="disabled" />
										</c:when>
									</c:choose>
                                    <c:if test="${startpage<1}">
											<c:set var="startpage" value="1" />
									</c:if>
                                    <c:if test="${endpage>docs.totalPage}">
										<c:set var="endpage" value="${docs.totalPage}" />
									</c:if>
																			
									<li class="${prepage}">
									 <a href="#" aria-label="Previous"  onclick='goToPage(${startpage-10})'>
											<span aria-hidden="true">&laquo;</span>
									</a></li>
									<c:forEach var="p" begin="${startpage}" end="${endpage}" step="1">
										<c:set var="active" value="" />
										<c:if test="${docs.currPage == p }">
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
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>

<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/morris/morris.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>


<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}

</script>

<SCRIPT> 
function showDialog(url) {
	  var iWidth=1000; //窗口宽度
	  var iHeight=600;//窗口高度
	  var iTop=(window.screen.height-iHeight)/2;
	  var iLeft=(window.screen.width-iWidth)/2;
	  window.open(url,"_blank","Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
	 }
</SCRIPT>
</body>
</html>