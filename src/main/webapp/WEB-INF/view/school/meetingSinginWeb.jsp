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
<title>会议报名</title>
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
					<li><a href="#">会议管理</a></li>
					<li class="active">会议报名</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
				<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
							   <div class="col-sm-4">
							   会议名称：${meeting.meetingtitle}
							   </div>
							   <div class="col-sm-4">
							   会议时间：  <fmt:formatDate value="${meeting.meetingtime}" pattern="yyyy-MM-dd"/>
							   </div>
								   <div class="col-sm-4">
							   会议地点：${meeting.meetingaddresses}
							   </div>						   							   
						    </div>
						</div>
				</div>
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form action="${pageContext.request.contextPath}/schoolMeeting/meetingSign"
									method="post" id="form1">
                          <input type="hidden" class="form-control" id="taskId" name="taskId" value="${meetingTask.taskid}">
                          <input type="hidden" class="form-control" id="meetingId" name="meetingId" value="${meeting.meetingid}">
									<div class="form-group">
										<div class="sub-title">姓名</div>
										<div>
											<input type="text" class="form-control" id="attendeename" name="attendeename" >
										</div>
										 <c:if test="${meeting.sex  eq 1}">
										   <div class="sub-title">性别</div>
										   <div>
										  	 
			                                <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="radio4" name="sex" value="男"  checked>
                                            <label for="radio4">
                                                                                     男
                                            </label>
                                          </div>
                                          <div class="radio3 radio-check radio-success radio-inline">
                                            <input type="radio" id="radio5" name="sex" value="女">
                                            <label for="radio5">
                                                                               女
                                            </label>
                                          </div>
                                          							  	 
   										    </div>											       
										  </c:if>

										 <c:if test="${meeting.duty  eq 1}">
										   <div class="sub-title">职务</div>
										   <div>
										  	 <input type="text" class="form-control" id="duty" name="duty">
   										    </div>											       
										  </c:if>
										  
										 <c:if test="${meeting.jobtitle  eq 1}">
										   <div class="sub-title">职称</div>
										   <div>
										  	 <input type="text" class="form-control" id="jobTitle" name="jobtitle">
   										    </div>											       
										  </c:if>	
										 <c:if test="${meeting.email  eq 1}">
										   <div class="sub-title">邮件</div>
										   <div>
										  	 <input type="text" class="form-control" id="email" name="email">
   										    </div>											       
										  </c:if>	
										 <c:if test="${meeting.telephone  eq 1}">
										   <div class="sub-title">电话</div>
										   <div>
										  	 <input type="text" class="form-control" id="telephone" name="telephone">
   										    </div>											       
										  </c:if>											  

										 <c:if test="${meeting.invoicecontent  eq 1}">
										   <div class="sub-title">发票内容</div>
										   <div>
										  	 <input type="text" class="form-control" id="invoiceContent" name="invoicecontent">
   										    </div>											       
										  </c:if>
										 <c:if test="${meeting.address  eq 1}">
										   <div class="sub-title">邮寄地址</div>
										   <div>
										  	 <input type="text" class="form-control" id="address" name="address" >
   										    </div>											       
										  </c:if>
										 <c:if test="${meeting.stay  eq 1}">
										   <div class="sub-title">是否住宿</div>
										    <div>
										    
										    <div class="radio3 radio-check radio-inline">
                                            <input type="radio" id="radio6" name="stay" value="是" >
                                            <label for="radio6">
                                                                                     是
                                            </label>
                                          </div>
                                          <div class="radio3 radio-check radio-success radio-inline">
                                            <input type="radio" id="radio7" name="stay" value="否" checked>
                                            <label for="radio7">
                                                                               否
                                            </label>
                                          </div>
                                          
										  	  
   										    </div>
   										    <div class="sub-title">住宿备注</div>
   										   <div>
   										   <textarea class="form-control" rows="3" name='note'></textarea>
										  </div>									       
										  </c:if>										  										  										  										  																			
										 
										<input type="button" value="添加" onclick="startPublish()"/>
									</div>

								</form>
							</div>


							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">参会人</th>
											<th class="text-center">性别</th>
											<th class="text-center">职务/职称</th>
											<th class="text-center">联系电话</th>
											<th class="text-center">电子邮件</th>
											<th class="text-center">是否住宿</th>
											<th class="text-center">住宿说明</th>
											<th class="text-center">发票内容</th>
											<th class="text-center">邮寄地址</th>
											<th class="text-center">操作</th>
										</tr>
									</thead>
									<tbody>
                                   <c:set var="recno" value="0" />
										<c:forEach var="doc" items="${meetingAttendees}">
											<tr>
											<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>										
												<td>
													${doc.attendeename}										
												</td>
												<td>${doc.sex}</td>
												<td>${doc.duty} ${doc.jobtitle}</td>
												<td>${doc.telephone}</td>
												<td>${doc.email}</td>
												<td>${doc.stay}
												
												</td>
												<td>${doc.note}</td>
												<td>${doc.invoicecontent}</td>
												<td>${doc.address}</td>
												<td>
												<a href="${pageContext.request.contextPath}/schoolMeeting/cancelSigninWeb?attendId=${doc.attendeeid}&meetingId=${meeting.meetingid}&taskId=${meetingTask.taskid}">删除</a>
												</td>
											</tr>
										</c:forEach>                                    

									</tbody>
								</table>
							</div>
						</div>

					</div>
				</div>
				<!-- /. ROW  -->
				<footer>
					<p align=center>
						广东教育工委
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
	</script>

	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
<script>
function startPublish(){
    var regBox = {
            regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,//邮箱
            regName : /^[a-z0-9_-]{3,16}$/,//用户名
            regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//手机
            regTel : /^0[\d]{2,3}-[\d]{7,8}$/
        }
    var attendeename = $("#attendeename").val();
 	if (attendeename == "" || attendeename == null) {
		alert("请输入姓名");
		document.getElementById("attendeename").focus();
		return false;
	}
	if(document.getElementById("duty")){
		var duty = $("#duty").val();
	 	if (duty == "" || duty == null) {
			alert("请输入职务");
			document.getElementById("duty").focus();
			return false;
		}
	}
	if(document.getElementById("jobTitle")){
		var jobTitle = $("#jobTitle").val();
	 	if (jobTitle == "" || jobTitle == null) {
			alert("请输入职称");
			document.getElementById("jobTitle").focus();
			return false;
		}
	}
	if(document.getElementById("email")){
		var email = $("#email").val();
	 	if (email == "" || email == null) {
			alert("请输入邮件");
			document.getElementById("email").focus();
			return false;
		}
	    //varreg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	    var  isok=  regBox.regEmail.test(email);
	       if(!isok) {
	            alert("邮箱格式不正确，请重新输入！");
	            document.getElementById("email").focus();
	            returnfalse;
	        }
	}
	if(document.getElementById("telephone")){
		var telephone = $("#telephone").val();
	 	if (telephone == "" || telephone == null) {
			alert("请输入电话");
			document.getElementById("telephone").focus();
			return false;
		}
	    var  isok=  regBox.regMobile.test(telephone);
	       if(!isok) {
	            alert("手机号码格式不正确，请重新输入！");
	            document.getElementById("telephone").focus();
	            returnfalse;
	        }
	}
	
 	 document.getElementById('form1').submit()
}


</script>
</html>