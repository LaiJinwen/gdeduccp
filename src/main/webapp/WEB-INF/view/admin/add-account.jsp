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
<title>添加用户</title>
<!-- Bootstrap Styles-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/select2.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/checkbox3.min.css"
	rel="stylesheet">
<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!--自定义-->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/css/task-manage.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />
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
					<li><a href="#">账户管理</a></li>
					<li class="active">添加账户</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/admin/addUser"
									method="post" class="form-horizontal" id="form" name="form">
									<div class="form-group">
										<label for="userId" class="col-sm-2 control-label">用户ID</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="userId"
												name="userId">
										</div>
									</div>
									<div class="form-group">
										<label for="userName" class="col-sm-2 control-label">姓名</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="userName"
												name="userName">
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">密码</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="password"
												name="password">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">用户类型</label>
										<div class="col-sm-10">
											<div class="radio3 radio-check radio-inline radio-danger">
												<input type="radio" id="usertype2" name="userType"
													value="user" checked=""> <label for="usertype2">
													高校管理员 </label>
											</div>
											<div class="radio3 radio-check radio-inline radio-danger">
												<input type="radio" id="usertype1" name="userType"
													value="leader"> <label for="usertype1"> 领导
												</label>
											</div>


										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">高校名称</label>
										<div class="col-sm-10">
											<select class="selectbox form-control" name="organizationId"
												id="doc-type">

												<c:forEach var="school" items="${schools}">
													<option value="${school.organizationid}">${school.organizationname}</option>
												</c:forEach>
											</select>

										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">性别</label>
										<div class="col-sm-10">
											<div class="radio3 radio-check radio-inline radio-danger">
												<input type="radio" id="radio5" name="sex" value="男"
													checked=""> <label for="radio5"> 男 </label>
											</div>
											<div class="radio3 radio-check radio-inline radio-danger">
												<input type="radio" id="radio6" name="sex" value="女">
												<label for="radio6"> 女 </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label for="position" class="col-sm-2 control-label">职位</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="position"
												name="position">
										</div>
									</div>
									<div class="form-group">
										<label for="mobile" class="col-sm-2 control-label">手机号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="mobile"
												name="mobile">
										</div>
									</div>
									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">邮箱</label>
										<div class="col-sm-10">
											<input type="email" class="form-control" id="email"
												name="email">
										</div>
									</div>

									<button type="button" class="btn btn-primary col-md-offset-2" id="submit-btn">添加用户</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->
				<footer>
					<p>
						Copyright &copy; 2016.Company name All rights reserved. <a
							target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
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
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
	<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
			$('#main-menu>li:eq(6)>a').addClass('active-menu');
			
			function GetRequest() {
				   var url = location.search; //获取url中"?"符后的字串
				   if (url.indexOf("?") != -1) {    //判断是否有参数
				      var str = url.substr(1); //从第一个字符开始 因为第0个是?号 获取所有除问号的所有符串
				      strs = str.split("=");   //用等号进行分隔 （因为知道只有一个参数 所以直接用等号进分隔 如果有多个参数 要用&号分隔 再用等号进行分隔）
				       return strs[1];          //直接弹出第一个参数 （如果有多个参数 还要进行循环的）
				   }
				}
	      
				
			if(GetRequest()=='1'){
				alert("添加成功！");
			}
			if(GetRequest()=='0'){
				alert("添加失败！");
			}			
			$('#submit-btn').click(function() {
				var userId = $("#userId").val();
				var userName = $("#userName").val();
				var password = $("#password").val();
				var mobile = $("#mobile").val();
				var email = $("#email").val();
 
				if (userId == "" || userId == null) {
					alert("请输入用户号");
					return false;}
				if (userName == "" || userName == null) {
					alert("请输入姓名");
					return false;	}	
				if (password == "" || password == null) {
					alert("请输入密码");
					return false;	}
				if (password.length < 6) {
					alert("密码长度至少6个字符");
					return false;	}				
				if (mobile == "" || mobile == null) {
					alert("请输入手机号码");
					return false;	}		
				if (mobile.length != 11) {
					alert("手机号码长度不对");
					return false;	}						
				if (email == "" || email == null) {
					alert("请输入邮件");
					return false;	}	
				var myReg=/^[a-zA-Z0-9_-]+@([a-zA-Z0-9]+\.)+(com|cn|net|org)$/;

				 if(!myReg.test(email)){
					alert("邮箱格式不对!");
					return ;}

				var form = document.getElementById('form');
				form.submit();
			});
		</script>

	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>

</html>