<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta content="" name="description" />
		<meta content="webthemez" name="author" />
		<title>广东教育工委党建</title>
		<!-- Bootstrap Styles-->
		<link href="assets/css/bootstrap.css" rel="stylesheet" />
		<!-- FontAwesome Styles-->
		<link href="assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Custom Styles-->
		<link href="assets/css/custom-styles.css" rel="stylesheet" />
		
		<!-- Google Fonts-->
	<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
	
			<link href="assets/css/index.css" rel="stylesheet" />

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
					<a class="navbar-brand" href="index.jsp"><strong><i class="logo"></i>广东省高校党建工作信息管理系统</strong></a>
				</div>

				<ul class="nav navbar-top-links navbar-right">
					<span class="welcome-msg">欢迎您！广东省委教育工委信息管理员</span>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
							<i class="fa fa-cog fa-fw"></i> <i class="fa fa-caret-down"></i>
						</a>
						<ul class="dropdown-menu dropdown-messages">
							<li>
								<a href="#">
									<div>
										<strong>John Doe</strong>
										<span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
									</div>
									<div>Lorem Ipsum has been the industry's standard dummy text ever since the 1500s...</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">
									<div>
										<strong>John Smith</strong>
										<span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
									</div>
									<div>Lorem Ipsum has been the industry's standard dummy text ever since an kwilnw...</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a href="#">
									<div>
										<strong>John Smith</strong>
										<span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
									</div>
									<div>Lorem Ipsum has been the industry's standard dummy text ever since the...</div>
								</a>
							</li>
							<li class="divider"></li>
							<li>
								<a class="text-center" href="#">
									<strong>Read All Messages</strong>
									<i class="fa fa-angle-right"></i>
								</a>
							</li>
						</ul>
						<!-- /.dropdown-messages -->
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
											<p>文档管理<i class="fa"></i></p>
										</a>
										<!--<p>文档管理</p>-->
									</li>
									<li class="">
										<a href="#meeting-pills" data-toggle="tab" class="meeting">
											<p>会议管理<i class="fa"></i></p>
										</a>
									</li>
									<li class="">
										<a href="#account-pills" data-toggle="tab" class="account">
											<p>高校账户管理<i class="fa"></i></p>
										</a>
									</li>
								</ul>

								<div class="tab-content">
									<div class="tab-pane fade active in" id="docu-pills">
										<h4><i class="fa fa-file-text-o fa-fw"></i> 文档管理</h4>
										<ul>
											<li>
												<a href="task-publish.jsp" class="task-publish-icon">
													<p>发布文档任务</p>
												</a>
											</li>
											<li>
												<a href="task-manage.jsp" class="task-manage-icon">
													<p>文档任务管理</p>
												</a>
											</li>
											<li>
												<a href="docu-audit-list.jsp" class="docu-audit-icon">
													<p>文档审核列表</p>
												</a>
											</li>
											<li>
												<a href="docu-sum.jsp" class="docu-sum-icon">
													<p>总结文档上传</p>
												</a>
											</li>
											<li>
												<a href="docu-query-college.jsp" class="docu-stat-icon">
													<p>文档查询统计</p>
												</a>
											</li>
										</ul>
									</div>
									<div class="tab-pane fade" id="meeting-pills">
										<h4><i class="fa fa-users fa-fw"></i> 会议管理</h4>
										<ul>
											<li>
												<a href="#" class="meeting-publish-icon">
													<p>发布会议</p>
												</a>
											</li>
											<li>
												<a href="#" class="meeting-query-icon">
													<p>会议查询</p>
												</a>
											</li>
											<li>
												<a href="#" class="meeting-stat-icon">
													<p>会议统计</p>
												</a>
											</li>
										</ul>
									</div>
									<div class="tab-pane fade" id="account-pills">
										<h4><i class="fa fa-user-o fa-fw"></i> 账户管理</h4>
										<ul>
											<li>
												<a href="#" class="account-add-icon">
													<p>添加账户</p>
												</a>
											</li>
											<li>
												<a href="#" class="account-maintain-icon">
													<p>账户维护</p>
												</a>
											</li>
										</ul>
									</div>
									<div class="tab-pane fade" id="settings-pills">
										<h4>Settings Tab</h4>
										<ul>
											<li>
												<a href="#" class="task-publish-icon">
													<p>发布文档任务</p>
												</a>
											</li>
											<li>
												<a href="#" class="task-manage-icon">
													<p>文档任务管理</p>
												</a>
											</li>
											<li>
												<a href="#" class="docu-audit-icon">
													<p>文档审核列表</p>
												</a>
											</li>
											<li>
												<a href="#" class="docu-sum-icon">
													<p>总结文档上传</p>
												</a>
											</li>
											<li>
												<a href="#" class="docu-stat-icon">
													<p>文档查询统计</p>
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
		
		<script src="assets/js/jquery-1.10.2.js"></script>
		<!--加载共同模块-->
		<script>
		</script>
		<!-- Bootstrap Js -->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="assets/js/jquery.metisMenu.js"></script>

		<!-- Custom Js -->
		<script src="assets/js/custom-scripts.js"></script>
		<script>
			$('#main-menu>li:first a').addClass('active-menu');
		</script>
	</body>

</html>