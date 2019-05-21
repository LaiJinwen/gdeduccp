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
	 <div id="wrapper">
		<%@ include file="navbar-top.jsp" %>
			<!-- /. NAV TOP  -->
			<%@ include file="navbar-side.jsp" %>
	<div id="page-inner">
		<div class="header">
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

							<form class="form-horizontal text-center" role="form"
								enctype="multipart/form-data" method="post"
								action="<%=request.getContextPath()%>/modifyUserInfo.do">
								<!-- c:forEach items="${user}" var="u"-->
									<div class="form-group">
										<label class="col-sm-4 control-label">用户名</label>
										<div class="col-sm-8">
											<input class="form-control" id="userName" name="userName"
												type="text" value="${u.userName}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-4 control-label">密码</label>
										<div class="col-sm-8">
											<input class="form-control" id="password" name="password"
												type="password" value="${u.password}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-4 control-label">确认密码</label>
										<div class="col-sm-8">
											<input class="form-control" id="comfirmPassword"
												type="password" value="${u.password}"> <span
												id="tishi"></span>
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-4 control-label">用户类型</label>
										<div class="col-sm-8">
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

										<label class="col-sm-4 control-label">性别</label>
										<div class="col-sm-8" id="sex" name="sex">
											<select class="form-control">
												<c:if test="${u.sex == '男'}">
													<option selected="selected">男</option>
													<option>女</option>
												</c:if>
												<c:if test="${u.sex == '女'}">
													<option selected="selected">男</option>
													<option>女</option>
												</c:if>
												<c:if test="${u.sex == null}">
													<option selected="selected">男</option>
													<option>女</option>
												</c:if>
											</select>
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-4 control-label">手机</label>
										<div class="col-sm-8">
											<input class="form-control" id="mobile" name="mobile"
												type="text" value="${u.mobile}">
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-4 control-label">邮箱</label>
										<div class="col-sm-8">
											<input class="form-control" id="email" name="email"
												type="text" value="${u.email}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-4 control-label">组织</label>
										<div class="col-sm-8">
											<input class="form-control" id="organizationId" type="text"
												value="${u.organizationName}" readonly="true">
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-4 control-label">职位</label>
										<div class="col-sm-8">
											<input class="form-control" id="position" name="position"
												type="text" value="${u.position}">
										</div>
									</div>

									<c:if test="${u.photo != null}">
										<div class="form-group">
											<label class="col-sm-4 control-label">照片</label>
											<div class="col-sm-8">
												<img class="col-sm-8 form-control"
													src="${pageContext.request.contextPath}/image/${u.photo}"
													style="width: 200px; height: 250px;">
											</div>
										</div>
									</c:if>
									<div class="form-group">
										<label class="col-sm-4 control-label">修改照片</label>

										<div class="col-sm-6">
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
								
									
										<button type="submit" onkeyup="checkPassword()"
											class="btn btn-md btn-danger col-sm-offset-1">确定修改</button>
									</div>
						</div>
						<!-- /c:forEach-->
						</form>
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
	
	     <div id="messageBox" class="''}">

    </div>
    
<c:if test="${msg == 'ok'}">
   <script> 
       alert("更新成功");
   </script>	
 </c:if>
   </div>
</body>
</html>