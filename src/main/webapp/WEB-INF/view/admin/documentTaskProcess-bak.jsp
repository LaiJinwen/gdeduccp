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
<script type="text/javascript">
     function startmerge(){
         
         MaskUtil.mask();
    	 document.getElementById('form1').submit()
     }
    </script>
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div class="header">
		<h1 class="page-header">
			
		</h1>
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档合成</li>
		</ol>
	</div>
	<div id="page-inner">

                   <div class="row">
                        <div class="col-xs-12">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <div class="card-title">
                                        <div class="title">合并文档</div>
                                    </div>
                                </div>
                                <div class="panel-body">
                      <form class="form-horizontal" role="form" name="form1" id="form1"
			                action="${pageContext.request.contextPath}/admin/documentMerge"	method="post">
                                        <div class="form-group">
                                            <label for="documentNo" class="col-sm-2 control-label">文档编号</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" name="documentNo" id="documentNo" value='${documentTask.documentno}' placeholder="文档编号">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-2 control-label">文档标题</label>
                                            <div class="col-sm-10">
                                                <input type="text" class="form-control" id="title" name="title" value='${documentTask.title}' placeholder="文档标题">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="schoolType" class="col-sm-2 control-label">高校类别</label>
                                            <div class="col-sm-10">
                                            <select class="selectbox form-control" name="schoolType">
 												<option value="all">不限类别</option>
												<option value="公办本科">公办本科</option>
												<option value="民办本科">民办本科</option>
												<option value="公办高职">公办高职</option>
												<option value="民办高职">民办高职</option>
											</select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="title" class="col-sm-2 control-label">生成类型</label>
                                            <div class="col-sm-10">
                                         <div>

                                          <div class="radio3 radio-check radio-success radio-inline">
                                            <input type="radio" id="radio5" name="newDocType" value="mergedoc">
                                            <label for="radio5">
                                                                                   合并上报文档
                                            </label>
                                          </div>
                                          <div class="radio3 radio-check radio-warning radio-inline">
                                            <input type="radio" id="radio6" name="newDocType" value="mergebakdoc">
                                            <label for="radio6">
                                                                                    合成修改文档
                                            </label>
                                          </div>
                                        </div>                                            </div>
                                        </div> 
                                          <div class="form-group">
                                            <label   class="col-sm-2 control-label">生成文档</label>
                                            <div class="col-sm-10">
                                                 <c:choose>
													<c:when test="${newDocType eq 'mergedoc'}">
                                     <a href="${pageContext.request.contextPath}/doc/${documentTask.documentno}/${documentTask.documentno}unit.docx" target=_blank>下载</a></td>
													</c:when>
													<c:when test="${newDocType eq 'mergebakdoc'}">
                                   <a href="${pageContext.request.contextPath}/doc/${documentTask.documentno}/${documentTask.documentno}backupunit.docx" target=_blank>下载</a></td>

													</c:when>
													<c:otherwise>
														尚未生成
													</c:otherwise>
												</c:choose>
		                                        												                                                   
                                            </div>
                                        </div>                                                                             
                                        <div class="form-group">
                                            <div class="col-sm-offset-2 col-sm-10">
                                            <input type='hidden' id='documentTaskId' name='documentTaskId'
										value='${documentTask.documenttaskid}' /> <input
										type='hidden' id='mergeflag' name='mergeflag' value='merge' />  
                                                <button type="button" id="mergebutton" class="btn btn-primary" onclick="startmerge()">确定生成文档</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

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
	
	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在合并文档，请等待完成...';
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