<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/common.css" />
		<style>
		.modify-tc {
			position: fixed;
			width: 50vw;
			top: 2vw;
			left: 50%;
			margin: 0 0 0 -25vw;
			background-color: palegoldenrod;
			z-index: 9999;
			border-radius: 2vw;
			padding: 2vw 2vw 1vw;
			display:none;
		}
		.page-nav {
			text-align:center;
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
				
						<div class="row">
					<div class="col-xs-12">
					<div class="panel panel-default">
							<div class="panel-body">
						<form role="form" class="form-inline" name="form1"
							action="${pageContext.request.contextPath}/admin/intoOrganizationList"
							method="post">
							 <div class="form-group">
								<label for="searchOrganizationName" class="control-label">单位名称</label>
									<input type="text" class="form-control" id="searchOrganizationName"
										name="searchOrganizationName" value="${organizationName}"
										placeholder="单位名称">
							    </div><div class="form-group">
								<button    type="submit" class="btn btn-primary">确定查询</button> 
								</div>
	 						</form>
						</div>
						</div>
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
													<th>#</th>
													<th>组织编号</th>
													<th>组织名称</th>
													<th>主管部门</th>
													<th>组织归属</th>
													<th>办学层次</th>
													<th>组织类型</th>
													<th>操作</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list }" var="organization" varStatus="varIndex" >
													<tr>
														<td>${varIndex.count }</td>
														<td>${organization.organizationno}</td>
														<td>${organization.organizationname}</td>
														<td>${organization.supervisordepartment}</td>
														<td>${organization.belong }</td>
														<td>${organization.schoollevel }</td>
														<td>${organization.organizationtype }</td>
														<td>
															<!-- a href="${pageContext.request.contextPath }/admin/doDeleteOrganization?organId=${organization.organizationid}" class="delete-item">删除</a -->
															<a href="${pageContext.request.contextPath }/admin/intoUpdateOrganization?organId=${organization.organizationid}" class="modify-btn">修改</a>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
									<nav aria-label="Page navigation" class="page-nav">
										<ul class="pagination">
											<li>
												<a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=1" aria-label="Previous">
													<span aria-hidden="true">首页</span>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=${page.prePage}" aria-label="Previous">
													<span aria-hidden="true">上一页</span>
												</a>
											</li>
											<c:forEach items="${page.navigatepageNums }" var="each" >
												 <c:if test="${each==page.pageNum}">
				                                    <li class="active">
					                                    <a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=${each}"><span aria-hidden="true">${each}</a>
				                                    </li>
				                                </c:if>
				                                <c:if test="${each!=page.pageNum}">
				                                    <li class=""> 
					                                    <a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=${each}">${each}</a>
				                                    </li>
				                                </c:if>
											</c:forEach>
											<li>
												<a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=${page.pageNum+1}" aria-label="Previous">
													<span aria-hidden="true">下一页</span>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath }/admin/intoOrganizationList?page=${page.pages}" aria-label="Next">
													<span aria-hidden="true">尾页</span>
												</a>
											</li>
										</ul>
									</nav>
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
		<!--修改弹窗-->
		<section class="modify-tc">
			<form method="post" class="form-horizontal" id="modify-form">
				<div class="form-group">
					<div class="col-sm-10">
						<input type="hidden" class="form-control" id="organizationId" name="orId">
					</div>
				</div>
				<div class="form-group">
					<label for="organizationNo" class="col-sm-2 control-label">组织编号</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="organizationNo" name="organizationNo">
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
							<input type="radio" id="supervisoerType1" name="supervisoerType" value="部委属" checked="">
							<label for="supervisoerType1">
		                                              	部委属
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="supervisoerType2" name="supervisoerType" value="省属">
							<label for="supervisoerType2">
		                                              	省属
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="supervisoerType3" name="supervisoerType" value="市属">
							<label for="supervisoerType3">
		                                              	市属
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="supervisoerType4" name="supervisoerType" value="其他">
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
							<input type="radio" id="belong1" name="belong" value="省工委" checked="">
							<label for="belong1">
		                                              	省工委
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="belong2" name="belong" value="其他">
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
							<input type="radio" id="schoolLevel1" name="schoolLevel" value="本科院校" checked="">
							<label for="schoolLevel1">
		                                              	本科院校
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="schoolLevel2" name="schoolLevel" value="专科院校">
							<label for="schoolLevel2">
		                                              	专科院校
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="schoolLevel3" name="schoolLevel" value="成人高校">
							<label for="schoolLevel3">
		                                              	成人高校
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="schoolLevel4" name="schoolLevel" value="研究生">
							<label for="schoolLevel4">
		                                              	研究生
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="schoolLevel5" name="schoolLevel" value="其他">
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
							<input type="radio" id="organizationType1" name="organizationType" value="公办" checked="">
							<label for="organizationType1">
		                                              	公办
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="organizationType2" name="organizationType" value="民办">
							<label for="organizationType2">
		                                              	民办
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="organizationType3" name="organizationType" value="合作办学">
							<label for="organizationType3">
		                                              	合作办学
		                                            </label>
						</div>
						<div class="radio3 radio-check radio-inline radio-danger">
							<input type="radio" id="organizationType4" name="organizationType" value="独立学院">
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
					<label for="note" class="col-sm-2 control-label">其他说明</label>
					<div class="col-sm-10">
						<input type="tel" class="form-control" id="note" name="note">
					</div>
				</div>
				<input type="button" class="btn btn-danger submit" value="提交" />
				<input type="button" class="btn btn-danger cancel" value="取消修改" />
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
			$('.modify-btn').click(function() {
				let url = $(this).attr('href');
				$.ajax({
					type: "GET",
					url: url,
					success: function(res) {
						if(res.state == 1) {
							//将数据写入
							console.log(res.data);
							let data = res.data;
							$('#organizationId').val(data.organizationid);
							$('#organizationNo').val(data.organizationno);
							$('#organizationName').val(data.organizationname);
							$('#supervisorDepartment').val(data.supervisordepartment);
							$('#address').val(data.address);
							$('#telephone').val(data.telephone);
							$('#faxNo').val(data.faxno);
							$('#postcode').val(data.postcode);
							$('#note').val(data.note);
							$("input[type=radio][name=supervisoerType][value="+data.supervisortype+"]").attr("checked",'checked');
							$("input[type=radio][name=belong][value="+data.belong+"]").attr("checked",'checked');
							$("input[type=radio][name=schoolLevel][value="+data.schoollevel+"]").attr("checked",'checked');
							$("input[type=radio][name=organizationType][value="+data.organizationtype+"]").attr("checked",'checked');
						}
					}
				}); 
				$('.modify-tc').show();
				return false;
			});
			$('.cancel').click(function() {
				$('.modify-tc').hide();
				return false;
			});

			$('.delete-item').click(function() {
				let tmp = confirm('确认删除？');
				if(tmp) {
					//发送删除请求
					let url = $(this).attr('href');
					$.get(url,function(res){
						if(res.state == 1) {
							window.location.reload();
						}
					})
				}
				return false;
			});
			
			/* 提交修改 */
			$('body').on('click','.submit',function(){
				//获取表单数据
				let data = {};
			    let t = $('#modify-form').serializeArray();
			    $.each(t,function() {
				      data[this.name] = this.value;
				});
			    //修改接口
			    let url = '${pageContext.request.contextPath}/admin/doUpdateOrganization';
				$.post(url,data,function(res){
					if(res.state == 1) {
						alert('修改成功');
						window.location.reload();
					}
				});
			});
		</script>
		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
	</body>

</html>