<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<link href="assets/css/select2.min.css" rel="stylesheet">
		<link href="assets/css/checkbox3.min.css" rel="stylesheet">
		<!-- Custom Styles-->
		<link href="assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<!--自定义-->
		<link rel="stylesheet" href="assets/css/task-manage.css">
		<link rel="stylesheet" type="text/css" href="assets/css/common.css" />
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
							<a href="#">账户管理</a>
						</li>
						<li class="active">添加账户</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<form action="" method="post" class="form-horizontal">
										<div class="form-group">
											<label for="userId" class="col-sm-2 control-label">用户ID</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="userId"  name="userId">
											</div>
										</div>
										<div class="form-group">
											<label for="userName" class="col-sm-2 control-label">用户名</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="userName" name="userName">
											</div>
										</div>
										<div class="form-group">
											<label for="password" class="col-sm-2 control-label">密码</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="password" name="password">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">用户类型</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="usertype1" name="userType" value="男" checked="">
		                                            <label for="usertype1">
		                                              	领导
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="usertype2" name="userType" value="女">
		                                            <label for="usertype2">
		                                              	高校管理员
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">高校类别</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio1" name="organizationId" value="1" checked="">
		                                            <label for="radio1">
		                                              	公办本科
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio2" name="organizationId" value="2">
		                                            <label for="radio2">
		                                              	民办本科
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio3" name="organizationId" value="3">
		                                            <label for="radio3">
		                                              	公办高职
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio4" name="organizationId" value="4">
		                                            <label for="radio4">
		                                              	民办高职
		                                            </label>
		                                          </div> 
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">性别</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio5" name="sex" value="男" checked="">
		                                            <label for="radio5">
		                                              	男
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="radio6" name="sex" value="女">
		                                            <label for="radio6">
		                                              	女
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label for="position" class="col-sm-2 control-label">职位</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="position" name="position">
											</div>
										</div>
										<div class="form-group">
											<label for="mobile" class="col-sm-2 control-label">联系电话</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="mobile" name="mobile">
											</div>
										</div>
										<div class="form-group">
											<label for="email" class="col-sm-2 control-label">邮箱</label>
											<div class="col-sm-10">
												<input type="email" class="form-control" id="email" name="email">
											</div>
										</div>
										<input type="submit" class="btn btn-danger" value="提交" />
									</form>
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
		<script src="assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="assets/js/jquery.metisMenu.js"></script>
		<script src="assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
			$('#main-menu>li:eq(6)>a').addClass('active-menu');
		</script>

		<!-- Custom Js -->
		<script src="assets/js/custom-scripts.js"></script>
	</body>

</html>