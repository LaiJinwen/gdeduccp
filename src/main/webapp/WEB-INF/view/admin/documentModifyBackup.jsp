<%@page language="java" import="java.net.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page language="java" import="com.zhuozhengsoft.pageoffice.*"%>
<%@taglib uri="http://java.pageoffice.cn" prefix="po"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>广东省教育工委党建工作信息系统</title>
<script type="text/javascript" src="../jquery.min.js"></script>
<script type="text/javascript" src="../pageoffice.js" id="po_js_main"></script>

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
		<div id="page-wrapper">
			<div class="header" style="margin-top:10px;">
				 
				<ol class="breadcrumb">
					<li>文档任务管理</li>
					<li>文档搜索</li>
				</ol>
			</div>
			<div id="page-inner">
				<form role="form" class="form-inline" name="form1" action=""
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

										<iframe id="barframe" name="myiframe" width="100%"
											height="400" frameborder='1'
											src="${pageContext.request.contextPath}/doc/${document.documentNo}/${fn:substringBefore(document.accessory,'.')}backup.html"
											frameborder="0" scrolling="auto"></iframe>
									</div>

									<div class="form-group col-md-12">
										<div class="sub-title">
											<c:set var="filename"
												value="${fn:substringBefore(document.accessory,'.')}backup.docx" />
											<c:set var="path" value="${document.documentNo}" />
											<%
												java.util.Map doc = (java.util.Map) request.getAttribute("document");
												String filename = doc.get("accessory").toString();

												if (filename.contains(".docx"))
													filename = filename.replaceAll(".docx", "backup.docx");
												else
													filename = filename.replaceAll(".doc", "backup.doc");
												String subdir = doc.get("documentNo").toString();
												//filename=subdir+"/"+filename;
												String filePath = request.getServletContext()
														.getRealPath("/WEB-INF/view/doc/" + doc.get("documentNo").toString());
												filePath = filePath.replace('\\', '/');
												pageContext.setAttribute("path", filePath);
												System.out.println(filePath);
											%>
											<a class="btn btn-primary"
												href="javascript:POBrowser.openWindow('${pageContext.request.contextPath}/pageoffice/Word.jsp?filename=' + encodeURI(encodeURI('${filename}')) +'&path='+ encodeURI(encodeURI('${document.documentNo}')), 'width=1200px;height=800px;');">在线修改文档</a>
											<a
												onclick='updateHtml("${filename}","${document.documentNo}")'
												class="btn btn-primary" href="#">更新查看文档</a>

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
		function updateHtml(filename, documentNo) {
			MaskUtil.mask();
			$.ajax({
						type : 'get',
						url : '${pageContext.request.contextPath}/admin/modifyBackupHtml?fileName='+encodeURI(encodeURI('${filename}')) + '&documentNo=' + documentNo,
						success : function(result) {
							if (result.state == 1) {
								alert('更新成功!');
								//window.location.reload();
								MaskUtil.unmask();
								document.getElementById('barframe').contentWindow.location.reload(true);
							} else {
								alert('更新失败!');
								MaskUtil.unmask();
							}
						},
						error : function(result) {
							alert('更新异常!');
							MaskUtil.unmask();
						}
					});
		}
		
		var MaskUtil = (function(){
			var $mask,$maskMsg;
			var defMsg = '正在更新网页，请等待完成...';
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
</body>
</html>