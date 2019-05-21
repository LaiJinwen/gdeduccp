<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<title>个人资料更改</title>
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
<!-- <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">  -->
<style>
th {
	text-align: center;
}

body {
	background-color: #eee;
}

.top-navbar {
	background-color: #cf2124;
}

#sideNav {
	color: #fff;
}

#main-menu {
	background-color: #eee;
}

#page-wrapper {
	box-shadow: 0 0 #fff;
	background-color: #fff;
}

.page-header {
	background-color: #fff;
}

.sidebar-collapse .nav>li>a {
	color: #ae3a3a;
	font-size: medium;
}

.sidebar-collapse .nav>li>a:hover, .sidebar-collapse .nav>li>a:focus {
	color: #fff;
}

.nav>li>a>i {
	color: #fff;
}
</style>
</head>

<body>

	<!-- /. NAV TOP  -->
	<!-- /. NAV SIDE  -->
	<div id="page-inner">
		<div class="header" style="margin-top:10px;">
			<ol class="breadcrumb">
				<li><a href="#">个人中心</a></li>
				<li class="active">个人资料维护</li>
			</ol>
		</div>
		<div id="page-inner">
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">

							<form class="form-horizontal text-center" role="form" id="form"
								enctype="multipart/form-data" method="post"
								action="<%=request.getContextPath()%>/modifyPersonalInfo.do">
								<!-- c:forEach items="${user}" var="u"-->
								<div class="form-group">
									<label for="userName" class="col-sm-2 control-label">姓名</label>
									<div class="col-sm-10">
										<input type="text" class="form-control" id="userName"
											name="userName" value="${u.userName}">
									</div>
								</div>

								<div class="form-group">

									<label for="password" class="col-sm-2 control-label">密码</label>
									<div class="col-sm-10">
										<input class="form-control" id="password" name="password"
											type="password" value="${u.password}"> <span
											id="tishi"></span>
									</div>
								</div>
								<div class="form-group">

									<label for="comfirmPassword" class="col-sm-2 control-label">确认密码</label>
									<div class="col-sm-10">
										<input class="form-control" id="comfirmPassword"
											type="password" value="${u.password}" > <span
											id="tishi"></span>
									</div>
								</div>
								<div class="form-group">

									<label for="userType" class="col-sm-2 control-label">用户类型</label>
									<div class="col-sm-10">
										<c:if test="${u.userType == 'admin'}">
											<input class="form-control" id="userType" readonly="true"
												value="管理员">
										</c:if>
										<c:if test="${u.userType == 'user'}">
											<input class="form-control" id="userType" readonly="true"
												value="学校用户">
										</c:if>
									</div>
								</div>

								<div class="form-group">

									<label for="sex" class="col-sm-2 control-label">性别</label>
									<div class="col-sm-10">
										<select class="form-control" id="sex" name="sex">
											<c:if test="${u.sex == '男'}">
												<option selected="selected">男</option>
												<option>女</option>
											</c:if>
											<c:if test="${u.sex == '女'}">
												<option>男</option>
												<option selected="selected">女</option>
											</c:if>
											<c:if test="${u.sex == null || u.sex == ''}">
												<option>男</option>
												<option>女</option>
											</c:if>
										</select>
									</div>
								</div>

								<div class="form-group">

									<label for="mobile" class="col-sm-2 control-label">手机</label>
									<div class="col-sm-10">
										<input class="form-control" id="mobile" name="mobile"
											type="text" value="${u.mobile}">
									</div>
								</div>

								<div class="form-group">

									<label for="email" class="col-sm-2 control-label">邮箱</label>
									<div class="col-sm-10">
										<input class="form-control" id="email" name="email"
											type="text" value="${u.email}">
									</div>
								</div>
								<div class="form-group">

									<label for="organizationId" class="col-sm-2 control-label">单位</label>
									<div class="col-sm-10">
										<input class="form-control" id="organizationId" type="text"
											value="${u.organizationName}" readonly="true">
									</div>
								</div>

								<div class="form-group">

									<label for="position" class="col-sm-2 control-label">职位</label>
									<div class="col-sm-10">
										<input class="form-control" id="position" name="position"
											type="text" value="${u.position}">
									</div>
								</div>

								<c:if test="${u.photo != null}">
									<div class="form-group">
										<label class="col-sm-2 control-label">照片</label>
										<div class="col-sm-10">
											<img class="col-sm-10 form-control"
												src="${pageContext.request.contextPath}/image/${u.photo}"
												style="width: 200px; height: 250px;">
										</div>
									</div>
								</c:if>
								<div class="form-group">
									<label class="col-sm-2 control-label">修改照片</label>

									<div class="col-sm-8">
										<input id="upload" type="file" name="picture"
											style="display: none"> <input id="file_name"
											class="col-sm-3 form-control" type="text"
											placeholder="请选择图片...">
									</div>
									<div class="col-sm-2">
										<a class="btn btn-default"
											onclick="$('input[id=upload]').click();">上传</a>
									</div>
								</div>
								<div class="form-group">
									<button type="button" id="submit-btn"
										class="btn btn-md btn-danger col-sm-offset-1">确定修改</button>
								</div>
							</form>
						</div>
						<!-- /c:forEach-->

					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- /. PAGE INNER  -->
	<!-- /. PAGE WRAPPER  -->
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

	<script type="text/javascript">
		$('input[id=upload]').change(function() {
			$('#file_name').val($(this).val());
		});
	</script>

	<div id="messageBox" class="''}"></div>

	<c:if test="${msg == 'ok'}">
		<script>
			alert("更新成功");
		</script>
	</c:if>
	<script>
		function checkPassword() {
			var password = $("#password").val();
			var comfirmPassword = $("#comfirmPassword").val();
			if (password != comfirmPassword) {
				alert("两次密码不一致");
				document.getElementById("comfirmPassword").focus();
			}
		}
		
		$('#submit-btn').click(function() {
			var userName = $("#userName").val();
			var password = $("#password").val();
			var mobile = $("#mobile").val();
			var email = $("#email").val();
 			if (userName == "" || userName == null) {
				alert("请输入姓名");
				return false;
			}
			if (password == "" || password == null) {
				alert("请输入密码");
				return false;
			}
			if (password.length < 6) {
				alert("密码长度至少6个字符");
				return false;
			}
			var comfirmPassword = $("#comfirmPassword").val();
			if (password != comfirmPassword) {
				alert("两次密码不一致");
				document.getElementById("comfirmPassword").focus();
				return false;
			}			
			if (mobile == "" || mobile == null) {
				alert("请输入手机号码");
				return false;
			}
			if (mobile.length != 11) {
				alert("手机号码长度不对");
				return false;
			}
			if (email == "" || email == null) {
				alert("请输入邮件");
				return false;
			}
			var myReg = /^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;

			if (!myReg.test(email)) {
				alert("邮箱格式不对!");
				return;
			}

			var form = document.getElementById('form');
			form.submit();
		});
	</script>

</body>
</html>