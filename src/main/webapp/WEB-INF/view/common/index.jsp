<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
	
			<link href="${pageContext.request.contextPath}/assets/css/index.css" rel="stylesheet" />
			

	</head>

	<body>
		<div id="wrapper">

			<nav class="navbar navbar-default top-navbar" role="navigation">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
					<a class="navbar-brand" href="#"><strong><i class="logo"></i>广东省高校党建工作信息管理系统</strong></a>
				</div>

				<ul class="nav navbar-top-links navbar-right">
					<span class="welcome-msg">欢迎您！${userName}</span>
							                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" onclick="showDialog('${pageContext.request.contextPath}/intoUserInfo.do')"><i class="fa fa-user fa-fw"></i> 资料修改</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
					<!-- /.dropdown -->
				</ul>
			</nav>
			<!-- /. NAV TOP  -->
			<section class="container-fluid main-cont">
				<div class="row">
					<div class="col-md-12 col-sm-12">
						<div class="panel panel-default">
							<div class="panel-heading">
								<i class="fa fa-flag fa-fw"></i> 主功能模块
							</div>
							<div class="panel-body">
								<ul class="nav nav-pills">
									<li class="active">
										<a href="#docu-pills" data-toggle="tab" class="task">
											<p>文档任务管理<i class="fa"></i></p>
										</a>
										<!--<p>文档管理</p>-->
									</li>
									<li class="">
										<a href="#meeting-pills" data-toggle="tab" class="meeting">
											<p>会议投票管理<i class="fa"></i></p>
										</a>
									</li>								
									<li class="">
										<a href="#account-pills" data-toggle="tab" class="account">
											<p>账户信息管理<i class="fa"></i></p>
										</a>
									</li>
									<li class="">
										<a href="#msg-pills" data-toggle="tab" class="msg">
											<p>消息交流管理<i class="fa"></i></p>
										</a>
									</li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane fade active in" id="docu-pills">
										<h4><i class="fa fa-file-text-o fa-fw"></i> 文档管理</h4>
										<ul>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoDocumentPublish.do" target="_blank" class="task-publish-icon">
													<p>发布文档任务</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/documentTaskManage" target="_blank"  class="task-manage-icon">
													<p>文档任务管理</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/documentList" target="_blank" class="docu-audit-icon">
													<p>文档审核列表</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/leader/documentSearch" target="_blank"  class="docu-audit-icon">
													<p>文档查询</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/leader/documentStatBySchool" target="_blank"  class="docu-stat-icon">
													<p>文档统计</p>
												</a>
											</li>											
										</ul>
									</div>
									<div class="tab-pane fade" id="meeting-pills">
										<h4><i class="fa fa-users fa-fw"></i> 会议管理</h4>
										<ul>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoPublishMeeting"  target="_blank" class="meeting-publish-icon">
												
													<p>发布会议</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoManageMeeting.do" target="_blank" class="meeting-query-icon">
								 						<p>会议查询</p>
												</a>
											</li>
											<li>
												<a  href="${pageContext.request.contextPath}/admin/meetingStatBySchool" target="_blank"  class="meeting-stat-icon">
													<p>会议统计</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/vote/goToPublishVoteTask" target="_blank" class="vote-icon">
													<p>发布投票</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/vote/voteTaskList" target="_blank" class="meeting-stat-icon">
													<p>投票管理</p>
												</a>
											</li>																						
										</ul>
									</div>
									<div class="tab-pane fade" id="account-pills">
										<h4><i class="fa fa-user-o fa-fw"></i> 账户管理</h4>
										<ul>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoAddUserAccount" target="_blank" class="account-add-icon">
													<p>添加账户</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoUserList" target="_blank" class="account-maintain-icon">
													<p>账户维护</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoOrganizationList" target="_blank" class="account-maintain-icon">
													<p>单位维护</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/admin/intoAddOrganization" target="_blank" class="account-add-icon">
													<p>添加单位</p>
												</a>
											</li>																						
										</ul>
									</div>
									<div class="tab-pane fade" id="msg-pills">
										<h4><i class="fa fa-commenting"></i>消息管理</h4>
										<ul>
											<li>
												<a href="${pageContext.request.contextPath}/adminMessage/intoSendingMessage.do"  target="_blank" class="msg-list-icon">
													<p>发送消息</p>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath}/adminMessage/intoMessageList.do" target="_blank"  class="msg-write-icon">
													<p>消息列表</p>
												</a>
											</li>
											
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		<!-- /. WRAPPER  -->
		<!-- JS Scripts-->
		<!-- jQuery Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
		<!--加载共同模块-->
		<script>
		</script>
		<!-- Bootstrap Js -->
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
        
		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
		 <script src="${pageContext.request.contextPath}/assets/js/morris/morris.js"></script>
		<script>
			$('#main-menu>li:first a').addClass('active-menu');
		</script>
		<div id="mirros-chart-area"></div>
		
	<SCRIPT> 
function showDialog(url) {
	  var iWidth=1200; //窗口宽度
	  var iHeight=900;//窗口高度
	  var iTop=10;//(window.screen.height-iHeight)/2;
	  var iLeft=(window.screen.width-iWidth)/2;
	  window.open(url,"_blank","Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
	 }
</SCRIPT>	
		
	</body>

</html>