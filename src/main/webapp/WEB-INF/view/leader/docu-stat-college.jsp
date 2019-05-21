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
		<title>广东教育工委党建</title>
   		<!-- Bootstrap Styles-->

		<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<!-- FontAwesome Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Custom Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/task-manage.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/docu-stat-college.css">		
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
						<li>
							<a href="#">文档管理</a>
						</li>
						<li class="active">按学校统计</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="row">
										<div class="col-md-3 left">
											<div class="search-box">
												<input type="hidden" class="form-control coll-search" placeholder="搜索">
											</div>
											 
											 
											<div class="college-box">
												<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingOne">
															<h4 class="panel-title">
        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          公立
        </a>
      </h4>
														</div>
														<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
															<div class="panel-body">
																<ul>
																<c:forEach var="school" items="${schools1}">
																	<li>
																		<a href="${pageContext.request.contextPath}/leader/schoolDocumentStat?organizationId=${school.organizationid}&schoolName=${school.organizationname}" target ="myiframe">${school.organizationname}</a>
																	</li>
															    </c:forEach>
																</ul>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingTwo">
															<h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          民办
        </a>
      </h4>
														</div>
														<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
															<div class="panel-body">
																<ul>
																<c:forEach var="school" items="${schools2}">
																	<li>
																		<a href="${pageContext.request.contextPath}/leader/schoolDocumentStat?organizationId=${school.organizationid}&schoolName=${school.organizationname}" target ="myiframe">${school.organizationname}</a>
																	</li>
															    </c:forEach>
															
																</ul>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingThree">
															<h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          合作办学
        </a>
      </h4>
														</div>
														<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
															<div class="panel-body">
																<ul>
																<c:forEach var="school" items="${schools3}">
																	<li>
																		<a href="${pageContext.request.contextPath}/leader/schoolDocumentStat?organizationId=${school.organizationid}&schoolName=${school.organizationname}" target ="myiframe">${school.organizationname}</a>
																	</li>
															    </c:forEach>

																</ul>
															</div>
														</div>
													</div>
													<div class="panel panel-default">
														<div class="panel-heading" role="tab" id="headingFour">
															<h4 class="panel-title">
        <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseThree">
          独立学院
        </a>
      </h4>
														</div>
														<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
															<div class="panel-body">
																<ul>
																<c:forEach var="school" items="${schools4}">
																	<li>
																		<a href="${pageContext.request.contextPath}/leader/schoolDocumentStat?organizationId=${school.organizationid}&schoolName=${school.organizationname}" target ="myiframe">${school.organizationname}</a>
																	</li>
															    </c:forEach>												
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									
									<div class="col-md-9 right">
<iframe name="myiframe" id="myrame" src="${pageContext.request.contextPath}/leader/schoolDocumentStat?organizationId=1" frameborder="0" align="left" width="100%" height="100%" scrolling="no">
            <p>你的浏览器不支持iframe标签</p>
        </iframe>
									</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->

				<footer>
					<p>Copyright &copy; 2016.Company name All rights reserved.
						<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
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
		<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
		<!-- Morris Chart Js -->
		<!--<script src="assets/js/morris/raphael-2.1.0.min.js"></script>-->
		<!--<script src="assets/js/morris/morris.js"></script>-->

		<!--<script src="assets/js/easypiechart.js"></script>-->
		<!--<script src="assets/js/easypiechart-data.js"></script>-->

		<!--<script src="assets/js/Lightweight-Chart/jquery.chart.js"></script>-->

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

		<!-- Chart Js -->
		<!--<script type="text/javascript" src="assets/js/Chart.min.js"></script>-->
		<!--<script type="text/javascript" src="assets/js/chartjs.js"></script>-->

		<script>
			$('#main-menu>li:eq(3)>a').addClass('active-menu');

			$('.college-box li').click(function() {
				$('.college-box li').removeClass('on');
				$(this).addClass('on');
			});
			//学校搜索框
			let reg = new RegExp("[\\u4E00-\\u9FFF]+","g");//判断是否为中文字符
			$('.coll-search').focus(function() {
				$(this).on('keyup', function() {
					let tmp = $('.coll-search').val();
					if(reg.test(tmp[tmp.length-1])){
						$('.college-box .panel:contains(' + tmp + ')').first().find('.panel-title a.collapsed').click();
						$('.college-box li:contains(' + tmp + ')').first().click();
					};
				});
			});
			$('.coll-search').focusout(function() {
				$(this).off('keyup');
			});
		</script>

	</body>

</html>