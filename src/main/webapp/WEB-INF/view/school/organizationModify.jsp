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
<title>广东教育工委党建</title>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/assets/css/common.css" />
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
	display: none;
}

.page-nav {
	text-align: center;
}
</style>
</head>

<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>
		<!-- /. NAV SIDE  -->

		<!-- /. PAGE WRAPPER  -->
		<div id="page-wrapper">
			<div class="header" style="margin-top:10px;">
				 
				<ol class="breadcrumb">
					<li><a href="#">资料维护</a></li>
					<li class="active">单位信息修改</li>
				</ol>

			</div>

			<!-- /. WRAPPER  -->
			<!--修改弹窗-->
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<form method="post" class="form-horizontal" id="modify-form">
							<div class="form-group">
								<div class="col-sm-10">
									<input type="hidden" class="form-control" id="orId"
										name="orId" value="${organization.organizationid}">
								</div>
							</div>
							<div class="form-group">
								<label for="organizationNo" class="col-sm-2 control-label">单位编号</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="organizationNo"
										name="organizationNo"  value="${organization.organizationno}">
								</div>
							</div>
							<div class="form-group">
								<label for="organizationName" class="col-sm-2 control-label">组织名称</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="organizationName"
										name="organizationName" value="${organization.organizationname}">
								</div>
							</div>
							<div class="form-group">
								<label for="supervisorDepartment" class="col-sm-2 control-label">主管部门</label>
								<div class="col-sm-10">
									<input type="text" class="form-control"
										id="supervisorDepartment" name="supervisorDepartment" value="${organization.supervisordepartment}">
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">主管部门类型</label>
								<div class="col-sm-10">
										 										   											   											   
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="supervisoerType1"
											name="supervisoerType" value="部委属" 
                                                 <c:if test="${fn:contains(organization.supervisortype,'部委属')==true}">
													checked	 
										          </c:if>
                                        > <label
											for="supervisoerType1"> 部委属 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="supervisoerType2"
											name="supervisoerType" value="省属"  
                                                 <c:if test="${fn:contains(organization.supervisortype,'省属')==true}">
													checked	 
										          </c:if>
                                 > <label
											for="supervisoerType2"> 省属</label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="supervisoerType3"
											name="supervisoerType" value="市属" 
                                                 <c:if test="${fn:contains(organization.supervisortype,'市属')==true}">
													checked	 
										          </c:if>
>  <label
											for="supervisoerType3"> 市属 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="supervisoerType4"
											name="supervisoerType" value="其他" 
                                                 <c:if test="${fn:contains(organization.supervisortype,'其他')==true}">
													checked	 
										          </c:if>
> <label
											for="supervisoerType4"> 其他 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">组织归属</label>
								<div class="col-sm-10">
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="belong1" name="belong" value="省工委"
                                                 <c:if test="${fn:contains(organization.belong,'省工委')==true}">
													checked	 
										          </c:if>											

> <label for="belong1"> 省工委 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="belong2" name="belong" value="其他"
                                                 <c:if test="${fn:contains(organization.belong,'其他')==true}">
													checked	 
										          </c:if>											
										>
										<label for="belong2"> 其他 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">办学层次</label>
								<div class="col-sm-10">
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="schoolLevel1" name="schoolLevel"
											value="本科院校" 
                                                 <c:if test="${fn:contains(organization.schoollevel,'本科院校')==true}">
													checked	 
										          </c:if>		
> <label for="schoolLevel1">
											本科院校 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="schoolLevel2" name="schoolLevel"
											value="专科院校"
                                                 <c:if test="${fn:contains(organization.schoollevel,'专科院校')==true}">
													checked	 
										          </c:if>													
											> <label for="schoolLevel2"> 专科院校
										</label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="schoolLevel3" name="schoolLevel"
											value="成人高校"
                                                 <c:if test="${fn:contains(organization.schoollevel,'成人高校')==true}">
													checked	 
										          </c:if>												
											> <label for="schoolLevel3"> 成人高校
										</label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="schoolLevel4" name="schoolLevel"
											value="研究生"
                                                 <c:if test="${fn:contains(organization.schoollevel,'研究生')==true}">
													checked	 
										          </c:if>												
											> <label for="schoolLevel4"> 研究生 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="schoolLevel5" name="schoolLevel"
											value="其他"
                                                 <c:if test="${fn:contains(organization.schoollevel,'其他')==true}">
													checked	 
										          </c:if>													
											> <label for="schoolLevel5"> 其他 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-2 control-label">组织类型</label>
								<div class="col-sm-10">
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="organizationType1"
											name="organizationType" value="公办"
                                                 <c:if test="${fn:contains(organization.organizationtype,'公办')==true}">
													checked	 
										          </c:if>
> <label
											for="organizationType1"> 公办 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="organizationType2"
											name="organizationType" value="民办"
                                                 <c:if test="${fn:contains(organization.organizationtype,'民办')==true}">
													checked	 
										          </c:if>											
											> <label
											for="organizationType2"> 民办 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="organizationType3"
											name="organizationType" value="合作办学"
                                                 <c:if test="${fn:contains(organization.organizationtype,'合作办学')==true}">
													checked	 
										          </c:if>													
											> <label
											for="organizationType3"> 合作办学 </label>
									</div>
									<div class="radio3 radio-check radio-inline radio-danger">
										<input type="radio" id="organizationType4"
											name="organizationType" value="独立学院"
                                                 <c:if test="${fn:contains(organization.organizationtype,'独立学院')==true}">
													checked	 
										          </c:if>													
											> <label
											for="organizationType4"> 独立学院 </label>
									</div>
								</div>
							</div>
							<div class="form-group">
								<label for="address" class="col-sm-2 control-label">详细地址</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" id="address"
										name="address"  value="${organization.address}">
								</div>
							</div>
							<div class="form-group">
								<label for="telephone" class="col-sm-2 control-label">联系电话</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="telephone"
										name="telephone" value="${organization.telephone}">
								</div>
							</div>
							<div class="form-group">
								<label for="faxNo" class="col-sm-2 control-label">传真号码</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="faxNo" name="faxNo" value="${organization.faxno}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">邮政编号</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="postcode"
										name="postcode" value="${organization.postcode}">
								</div>
							</div>

							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">税识别号</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="taxpayerId"
										name="taxpayerId" value="${organization.taxpayerid}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">发票抬头</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="invoiceName"
										name="invoiceName" value="${organization.invoicename}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">学生人数</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfStudent"
										name="numberOfStudent" value="${organization.numberofstudent}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">教师人数</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfTeacher"
										name="numberOfTeacher" value="${organization.numberofteacher}"  onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">学生党员</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfStudentPartyMember"
										name="numberOfStudentPartyMember" value="${organization.numberofstudentpartymember}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">教工党员</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfTeacherPartyMember"
										name="numberOfTeacherPartyMember" value="${organization.numberofteacherpartymember}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">退休党员</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfRetirePartyMember"
										name="numberOfRetirePartyMember"  value="${organization.numberofretirepartymember}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">二级组织</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfSecondPartyOrganization"
										name="numberOfSecondPartyOrganization" value="${organization.numberofsecondpartyorganization}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">教工支部</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfTeacherPartyBranch"
										name="numberOfTeacherPartyBranch" value="${organization.numberofteacherpartybranch}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
							<div class="form-group">
								<label for="postcode" class="col-sm-2 control-label">学生支部</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="numberOfStudentPartyBranch"
										name="numberOfStudentPartyBranch" value="${organization.numberofstudentpartybranch}" onkeyup="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}" onafterpaste="if(this.value.length==1){this.value=this.value.replace(/[^1-9]/g,'')}else{this.value=this.value.replace(/\D/g,'')}">
								</div>
							</div>
														
							<div class="form-group">
								<label for="note" class="col-sm-2 control-label">其他说明</label>
								<div class="col-sm-10">
									<input type="tel" class="form-control" id="note" name="note" value="${organization.note}">
								</div>
							</div>
							<div class="form-group">
							 	<label   class="col-sm-2 control-label"> </label>
								<div class="col-sm-10">
									<input type="button" id="modify-btn" class="btn btn-danger submit" value="提交" />
								</div>
							 
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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

		/* 提交修改 */
$('#modify-btn').click(function() {
	 var form1 = new FormData(document.getElementById("modify-form"));
		// console.log(form1);
		$.ajax({
			type : 'post',
			url : '${pageContext.request.contextPath }/admin/doUpdateOrganization',
			data :form1,
			contentType: false,
			processData: false, 
			success : function(result) {
				  if (result.state == 1) {
						alert('更新成功！');

					}   else {
						alert('更新失败');
					}
					},
			 error : function() {  
					  alert('更新异常！');

				     }  
				});
	});
	</script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>

</html>