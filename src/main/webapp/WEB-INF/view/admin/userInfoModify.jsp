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
<div id="page-wrapper">
	<div class="header" style="margin-top:10px;">
		 
		<ol class="breadcrumb">
			<li>用户维护</li>
			<li>用户资料更改</li>
		</ol>
	</div>
	<div id="page-inner">
							<form class="form-horizontal text-center" role="form" id="form" name="form"
								enctype="multipart/form-data" method="post"
								action="<%=request.getContextPath()%>/admin/modifyUserInfo.do">
								<!-- c:forEach items="${user}" var="u"-->
									<div class="form-group">
										<label class="col-sm-2 control-label">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名</label>
										<div class="col-sm-8">
										<input class="form-control" id="userId" name="userId"
												type="hidden" value="${u.userId}">
											<input class="form-control" id="userName" name="userName"
												type="text" value="${u.userName}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
										<div class="col-sm-8">
											<input class="form-control" id="password" name="password"
												type="password" value="${u.password}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-2 control-label">确认密码</label>
										<div class="col-sm-8">
											<input class="form-control" id="comfirmPassword"
												type="password" value="${u.password}"> <span
												id="tishi"></span>
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-2 control-label">用户类型</label>
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

										<label class="col-sm-2 control-label">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</label>
										<div class="col-sm-8" id="sex" name="sex">
										 
											<select class="form-control">
											    
											    <c:if test="${u.sex == '男'}">
											      <c:set var="maleselected" value="selected" />
											    </c:if>
											    <c:if test="${u.sex == '女'}">
											      <c:set var="femaleselected" value="selected" />
											    </c:if>											    
													<option selected="${maleselected}">男</option>
													<option selected="${femaleselected}">女</option>
												
											</select>
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-2 control-label">手&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;机</label>
										<div class="col-sm-8">
											<input class="form-control" id="mobile" name="mobile"
												type="text" value="${u.mobile}">
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
										<div class="col-sm-8">
											<input class="form-control" id="email" name="email"
												type="text" value="${u.email}">
										</div>
									</div>
									<div class="form-group">

										<label class="col-sm-2 control-label">单位名称</label>
										<div class="col-sm-8">
											<input class="form-control" id="organizationId" type="text"
												value="${u.organizationName}" readonly="true">
										</div>
									</div>

									<div class="form-group">

										<label class="col-sm-2 control-label">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;位</label>
										<div class="col-sm-8">
											<input class="form-control" id="position" name="position"
												type="text" value="${u.position}">
										</div>
									</div>

									<c:if test="${u.photo != null}">
										<div class="form-group">
											<label class="col-sm-2 control-label">照&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;片</label>
											<div class="col-sm-8">
												<img class="col-sm-8 form-control"
													src="${pageContext.request.contextPath}/image/${u.photo}"
													style="width: 200px; height: 250px;">
											</div>
										</div>
									</c:if>
									<div class="form-group">
										<label class="col-sm-2 control-label">修改照片</label>

										<div class="col-sm-6">
											<input id="upload" type="file" name="picture"
												style="display: none"> <input id="file_name"
												class="col-sm-3 form-control" type="text"
												placeholder="请选择图片...">
										</div>
										<div class="col-sm-2">
											<a class="btn btn-default"
												onclick="$('input[id=upload]').click();">上传照片</a>
										</div>
									</div>
									<div class="form-group">
								      <label class="col-sm-2 control-label"> </label>
									<div class="col-sm-6">
										<button type="button" class="btn btn-primary col-md-offset-2" id="submit-btn">确定修改</button>	
									</div>
									</div>
								</form>
						</div>
						<!-- /c:forEach-->
						



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

<script type="text/javascript">
	function goToPage(page) {
		document.getElementById("page").value = page;
		document.form1.submit();
	}
	
	$('#submit-btn').click(function() {
		var pwd1 = $("#comfirmPassword").val();
		var pwd2 = $("#password").val();
		var mobile = $("#mobile").val();
		var email = $("#email").val();

		if (pwd1 == "" || pwd1 == null) {
			alert("请输入密码");
			return;	}
		if (pwd1.length < 6) {
			alert("密码长度至少6个字符");
			return;	}
		if (pwd1 != pwd2) {
			alert("两次密码不一样");
			return;	}		
		if (mobile == "" || mobile == null) {
			alert("请输入手机号码");
			return;	}		
		if (mobile.length != 11) {
			alert("手机号码长度不对");
			return;	}						
		if (email == "" || email == null) {
			alert("请输入邮件");
			return;	}	
		var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;

		if(!myReg.test(email)){
			alert("邮箱格式不对!");
			return ;}

		var form = document.getElementById('form');
		form.submit();
	});
</script>

</body>
</html>