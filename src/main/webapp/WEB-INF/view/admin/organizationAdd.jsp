<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
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
							<a href="#">组织管理</a>
						</li>
						<li class="active">添加组织</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<form method="post" class="form-horizontal" id="add-form">
										<div class="form-group">
											<label for="organizationNo" class="col-sm-2 control-label">组织编号</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="organizationNo"  name="organizationNo">
											</div>
										</div>
										<div class="form-group">
											<label for="organizationName" class="col-sm-2 control-label">组织名称</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="organizationName" name="organizationName">
											</div>
										</div>
										<div class="form-group">
											<label for="supervisorDepartment" class="col-sm-2 control-label">主管部门</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="supervisorDepartment" name="supervisorDepartment">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">主管部门类型</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="supervisoerType1" name="supervisoerType" value="1" checked="">
		                                            <label for="supervisoerType1">
		                                              	部委属
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="supervisoerType2" name="supervisoerType" value="2">
		                                            <label for="supervisoerType2">
		                                              	省属
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="supervisoerType3" name="supervisoerType" value="3">
		                                            <label for="supervisoerType3">
		                                              	市属
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="supervisoerType4" name="supervisoerType" value="4">
		                                            <label for="supervisoerType4">
		                                              	其他
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">组织归属</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="belong1" name="belong" value="1" checked="">
		                                            <label for="belong1">
		                                              	省工委
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="belong2" name="belong" value="2">
		                                            <label for="belong2">
		                                              	其他
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">办学层次</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="schoolLevel1" name="schoolLevel" value="1" checked="">
		                                            <label for="schoolLevel1">
		                                              	本科院校
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="schoolLevel2" name="schoolLevel" value="2">
		                                            <label for="schoolLevel2">
		                                              	专科院校
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="schoolLevel3" name="schoolLevel" value="3">
		                                            <label for="schoolLevel3">
		                                              	成人高校
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="schoolLevel4" name="schoolLevel" value="4">
		                                            <label for="schoolLevel4">
		                                              	研究生
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="schoolLevel5" name="schoolLevel" value="5">
		                                            <label for="schoolLevel5">
		                                              	其他
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-2 control-label">组织类型</label>
											<div class="col-sm-10">
												<div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="organizationType1" name="organizationType" value="1" checked="">
		                                            <label for="organizationType1">
		                                              	公办
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="organizationType2" name="organizationType" value="2">
		                                            <label for="organizationType2">
		                                              	民办
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="organizationType3" name="organizationType" value="3">
		                                            <label for="organizationType3">
		                                              	合作办学
		                                            </label>
		                                          </div>
		                                          <div class="radio3 radio-check radio-inline radio-danger">
		                                            <input type="radio" id="organizationType4" name="organizationType" value="4">
		                                            <label for="organizationType4">
		                                              	独立学院
		                                            </label>
		                                          </div>
											</div>
										</div>
										<div class="form-group">
											<label for="address" class="col-sm-2 control-label">详细地址</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="address" name="address">
											</div>
										</div>
										<div class="form-group">
											<label for="telephone" class="col-sm-2 control-label">联系电话</label>
											<div class="col-sm-10">
												<input type="tel" class="form-control" id="telephone" name="telephone">
											</div>
										</div>
										<div class="form-group">
											<label for="faxNo" class="col-sm-2 control-label">传真号码</label>
											<div class="col-sm-10">
												<input type="tel" class="form-control" id="faxNo" name="faxNo">
											</div>
										</div>
										<div class="form-group">
											<label for="postcode" class="col-sm-2 control-label">邮政编号</label>
											<div class="col-sm-10">
												<input type="tel" class="form-control" id="postcode" name="postcode">
											</div>
										</div>
										<div class="form-group">
											<label for="note" class="col-sm-2 control-label">备注说明</label>
											<div class="col-sm-10">
												<input type="tel" class="form-control" id="note" name="note">
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
			
			//表单提交
			$('#add-form').submit(function(detail){
				var organizationNo = $("#organizationNo").val();
				var organizationName = $("#organizationName").val();
 
				if (organizationNo == "" || organizationNo == null) {
					alert("请输入单位编号");
					return false;}				
				if (organizationName == "" || organizationName == null) {
					alert("请输入单位名称");
					return false;}
				//获取表单数据
				let data = {};
			    let t = $('#add-form').serializeArray();
			    $.each(t,function() {
			      data[this.name] = this.value;
			    });
				$.post('${pageContext.request.contextPath}/admin/doAddOrganization',data,function(res){
					if(res.state == 1) {
						alert('创建成功');
						$(location).attr('href', '${pageContext.request.contextPath}/admin/intoOrganizationList');
					}
				});
				 
			})
		</script>

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
	</body>

</html>