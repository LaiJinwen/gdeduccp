<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link href="${pageContext.request.contextPath}/assets/css/select2.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath}/assets/css/checkbox3.min.css" rel="stylesheet">
		<!-- Custom Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<!--自定义-->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/task-manage.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css"/>
<%-- 		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/account-list.css"/> --%>
		<style type="text/css">
			.modify-tc {
	position: fixed;
	width: 50vw;
	top: 50%;
	left: 50%;
	margin: -20vw 0 0 -25vw;
	background-color: palegoldenrod;
	z-index: 9999;
	border-radius: 2vw;
	padding: 2vw 2vw 1vw;
	display: none;
}
.modify-tc .btn-box {
	text-align: right;
}

.modify-tc .btn {
	display: inline-block;
	margin: 10px;
}
			
		</style>
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
						<li class="active">账户列表</li>
					</ol>

				</div>
				<div id="page-inner">
				<form role="form" class="form-inline" name="form1"
			action="${pageContext.request.contextPath}/admin/intoUserList" method="post">
			 
								<div class="row">
								<div class="form-group col-md-6">
										<label for="doc-num" class="col-sm-2 control-label">文档编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="doc-title"
												name="documentNo" value="${documentCondition.documentNo}"
												placeholder="文档编号">
										</div>
									</div>
									<div class="form-group col-md-6">
										<button type="button" class="btn btn-primary" onclick='goToPage(1)'>确定查询</button>
 									</div>
			                  </div>
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table table-striped table-hover">
											<thead>
												<tr>
													<th>序号</th>
													<th>用户姓名</th>
													<th>用户ID</th>
													<th>手机</th>
													<th>邮箱</th>
													<th>单位</th>
													<th>用户类型</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="user" varStatus="status" >
													<tr>
														<td>${status.index+1 }</td>
														<td>${user.username}</td>
														<td>${user.userid}</td>
														<td>${user.mobile }</td>
														<td>${user.email }</td>
														<td>${user.organizationName }</td>
														<td>${user.usertype }</td>
														 
														
														<td>
															<a href="${pageContext.request.contextPath}/admin/intomodifyUser?userId=${user.userid}" class="modify-btn">修改</a>&nbsp;
															<a href="${pageContext.request.contextPath}/admin/deleteUser?userId=${user.userid}" class="delete-item">删除</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<nav aria-label="Page navigation" class="page-nav" style="width:530px;margin:0 auto">
										<ul class="pagination">
											<li class="">							
												<a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=1" aria-label="Previous">
													<span aria-hidden="true">首页</span>
												</a>
											</li>
											<li class="">							
												<a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=${page.prePage}" aria-label="Previous">
													<span aria-hidden="true">上一页</span>
												</a>
											</li>
												<c:forEach items="${page.navigatepageNums }" var="each" >
													<c:if test="${each==page.pageNum}">
														<li class="active"><a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=${each}">${each }</a>
													</c:if>		
													<c:if test="${each!=page.pageNum}">
														<li class=""><a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=${each}">${each }</a>
													</c:if>											
												</c:forEach>
											<li>
												<a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=${page.nextPage}" aria-label="Next">
													<span aria-hidden="true">下一页</span>
												</a>
											</li>
											<li class="">							
												<a href="${pageContext.request.contextPath }/adminAccount/intoUserList.do?page=${page.pages}" aria-label="Previous">
													<span aria-hidden="true">尾页</span>
												</a>
											</li>
										</ul>
									</nav>
								</div>
							</div>
						</div>
					</div>
					</form>
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
		<!--修改弹窗-->
		<section class="modify-tc">
			<form   class="form-horizontal"  id="modify-form">
				<div class="form-group">
					<label for="userId" class="col-sm-2 control-label">用户ID</label>
					<div class="col-sm-10">
						<p type="text" class="form-control-static" id="userId" name="userId"></p>
					</div>
				</div>
				<div class="form-group">
					<label for="userName" class="col-sm-2 control-label">用户名</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="userName" name="userName">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">用户类型</label>
					<div class="col-sm-10">
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="usertype1" name="userType" value="1">
							<label for="usertype1">
		                                              	省委教育工委领导
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="usertype2" name="userType" value="2">
							<label for="usertype2">
		                                              	高校党建信息管理员
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="usertype3" name="userType" value="3">
							<label for="usertype2">
		                                              	省委教育工委信息管理员
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
				<div class="btn-box">
					<input type="submit" class="btn btn-danger" value="确认修改" />
					<input type="button" class="btn btn-default cancel" value="取消修改" />
				</div>
			</form>
		</section>
		
		<!-- JS Scripts-->
		<!-- jQuery Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
		<script src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
			$('#main-menu>li:eq(6)>a').addClass('active-menu');
		
			//修改
			$('.modify-btn').click(function(){
				let url = $(this).attr('href');
				$.ajax({
					type:"GET",
					url:url,
					success:function(obj) {
						console.log(obj.data);
						$('#userId').text(obj.data.userid);
						$('#userName').val(obj.data.username);
						if(obj.data.usertype == 'user') {
							$('#usertype2').attr('checked',true);
						}else if(obj.data.usertype == 'admin' ){
							$('#usertype3').attr('checked',true);
						}else{
							$('#usertype1').attr('checked',true);
						}
						if(obj.data.sex == '男') {
							$('#radio5').attr('checked',true);
						}else{
							$('#radio6').attr('checked',true);
						}
						$('#position').val(obj.data.position);
						$('#mobile').val(obj.data.mobile);
						$('#email').val(obj.data.email);
					}
				});
				$('.modify-tc').show();
				return false;
			});
			$('.cancel').click(function(){
				$('.modify-tc').hide();
				return false;
			});
			
			$('.delete-item').click(function(){
				let tmp = confirm('确认删除？');
				if(tmp) {
					
				}else {
					return false;
				}
			});
		</script>

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
	</body>

</html>