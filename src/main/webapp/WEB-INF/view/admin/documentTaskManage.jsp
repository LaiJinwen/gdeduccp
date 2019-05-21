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
	<div class="header" style="margin-top:10px;">
 
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>

	</div>

	<div id="page-inner">
		<form role="form" class="form-inline" name="form1" id="form1"
			action="${pageContext.request.contextPath}/admin/documentTaskManage" method="post">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
								<div class="row">
									<div class="form-group col-md-6">
										<label for="doc-num" class="col-sm-4 control-label">文档编号</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${documentCondition.documentNo}"
												placeholder="文档编号">
										</div>
									</div>
									
									<div class="form-group col-md-6">
										<label for="doc-title" class="col-sm-4 control-label">文档标题</label>
										<div class="col-sm-8">
											<input type="text" class="form-control" id="doc-title"
												name="title" value="${documentCondition.title}"
												placeholder="标题">
										</div>
									</div>
								</div>

								<div class="row">
							
									<div class="form-group col-md-4">
										<button type="button" class="btn btn-primary" onclick='goToPage(1)'>确定查询</button>
										<input type='hidden' id='page' name='page'
											value='${docs.currPage}' />
									</div>
								</div>

							</div>
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">文档编号</th>
											 
											<th class="text-center">文档标题</th>
											<th class="text-center">发布时间</th>
											<th class="text-center">已交/应交</th>
											<th class="text-center">合并文档</th>											
											<th class="text-center">文档审核</th>
											<th class="text-center">总结文档</th>
											<th class="text-center">提醒次数</th>
											<th class="text-center">提醒</th>
											<th class="text-center">删除</th>
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
												<td>
						
												<fmt:formatDate value="${doc.publishDate}" pattern="yyyy-MM-dd"/>
												</td>
												<td>${doc.count1}/${doc.count2}</td>
												<td>
												<a  class="btn btn-default" href="${pageContext.request.contextPath}/admin/documentTaskProcess?documentTaskId=${doc.documentTaskId}" target=_blank>合并</a></td>
												<td>
												<a  class="btn btn-default" href="${pageContext.request.contextPath}/admin/documentList?documentNo=${doc.documentNo}" >审核修改</a></td>
												<td>
												<a  class="btn btn-default" href="${pageContext.request.contextPath}/admin/intoUploadDocument.do?documentTaskId=${doc.documentTaskId}">总结文档</a></td>
											    <td>${doc.remind}</td>
											    <td>
											    <button type="button" id="remind${recno}" class="btn btn-primary" onclick='remind(${doc.documentTaskId})'>督促</button>
											    </td>
											    <td><a  onclick='deleDoc(${doc.documentTaskId})' class="btn btn-primary" href="#">删除</a></td>
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
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}
</script>
<script>
function remind(id){
	 MaskUtil.mask();
    document.getElementById("form1").action="${pageContext.request.contextPath}/admin/documentRemind?documentTaskId="+id;
	document.form1.submit();
}

function startmerge(){
    MaskUtil.mask();
	 document.getElementById('form1').submit()
}

	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在执行任务，请耐心等待完成...';
		function init(){
			if(!$mask){
				$mask = $("<div></div>")
				.css({
				  'position' : 'absolute'
				  ,'left' : '0'
				  ,'top' : '0'
				  ,'width' : '100%'
				  ,'height' : '100%'
				  ,'opacity' : '0.3'
				  ,'filter' : 'alpha(opacity=30)'
				  ,'display' : 'none'
				  ,'background-color': '#ccc'
				})
				.appendTo("body");
			}
			if(!$maskMsg){
				$maskMsg = $("<div></div>")
					.css({
					  'position': 'absolute'
					  ,'top': '50%'
					  ,'margin-top': '-20px'
					  ,'padding': '5px 20px 5px 20px'
					  ,'width': 'auto'
					  ,'border-width': '1px'
					  ,'border-style': 'solid'
					  ,'display': 'none'
					  ,'background-color': '#ffffff'
					  ,'font-size':'14px'
					})
					.appendTo("body");
			}
			
			$mask.css({width:"100%",height:$(document).height()});
			
			var scrollTop = $(document.body).scrollTop();
			
			$maskMsg.css({
				left:( $(document.body).outerWidth(true) - 190 ) / 2
				,top:( ($(window).height() - 45) / 2 ) + scrollTop
			}); 
					
		}
		
		return {
			mask:function(msg){
				init();
				$mask.show();
				$maskMsg.html(msg||defMsg).show();
			}
			,unmask:function(){
				$mask.hide();
				$maskMsg.hide();
			}
		}
		
	}());
	
	
</script>
<script>
 		function deleDoc(did){				
			if (confirm("确定删除吗？")) {
				 
				$.ajax({
					type : 'get',
					url : '${pageContext.request.contextPath}/admin/doDeleteDocumentTask?documenttaskid='+did,
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