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
	
  
  
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>  
	
</head>
<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>
 

			<!-- /. NAV SIDE  -->
			<div id="page-wrapper">
				<div class="header">
					<h1 class="page-header">
                             
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">投票管理</a>
						</li>
						<li class="active">投票界面</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">																																		
									<form class="form-horizontal" role="form" action="<%=request.getContextPath() %>/admin/publishDocument.do" method="post"  enctype ="multipart/form-data" >
										<div class="form-group col-md-6">
											<label for="doc-num" class="col-sm-4 control-label">${title}投票</label>
											<div class="col-sm-8">
												<input type="text" class="form-control" id="doc-num" name="documentNo" placeholder="请输入文档编号">
											</div>
										</div>
										<div class="form-group col-md-12">
											<label class="col-sm-2 control-label">最多可选${maxchoosenumber}人</label>
											<div class="col-sm-10">
												<div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
													<input type="checkbox" id="checkbox-fa-light-1" value="公办本科" name="orType" checked>
													<label for="checkbox-fa-light-1">
                                           			  公办本科
                                                     </label>
												</div>
	 										 </div>
										 </div> 
										<button type="submit" class="btn btn-lg btn-primary col-md-offset-4">确定投票</button>
										
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- /. ROW  -->
					<footer>
						<p> 
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
		<script src="../assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="../assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="../assets/js/jquery.metisMenu.js"></script>
		<script src="../assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
		</script>
		<!-- Custom Js -->
		<script src="../assets/js/custom-scripts.js"></script>
		<!--上传模板-->
		<script type="text/javascript">
			$('input[id=upload]').change(function() {
				$('#file_name').val($(this).val());
			});
		</script>
		
	  <script>
        $(function () {
            $("#datetime").datetimepicker({
                format: 'YYYY-MM-DD hh:mm',
                locale: moment.locale('zh-cn')
            });
        });
    </script>
		
	</body>

</html>