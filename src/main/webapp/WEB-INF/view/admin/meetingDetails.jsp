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
		<title>文档检索</title>
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
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div class="header" style="margin-top:10px;">
	 
		<ol class="breadcrumb">
			<li>会议任务管理</li>
			<li>会议参加详情</li>
		</ol>

	</div>


	<div id="page-inner">
		<form role="form" class="form-inline" name="form1" id="form1"
			action="${pageContext.request.contextPath}/admin/meetingRemind?meetingId=${meeting.meetingid}" method="post">
					 
			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
					<div class="panel-body">
					<div class="col-xs-3">
					会议名称：${meeting.meetingtitle}
					
					</div>
					<div class="col-xs-3">
					会议时间：<fmt:formatDate value="${meeting.meetingtime}" pattern="yyyy-MM-dd"/>
					</div>
					<div class="col-xs-3">
					报名期限：<fmt:formatDate value="${meeting.enrolldeadline}" pattern="yyyy-MM-dd"/>
					</div>
					 <div class="col-xs-3">
			 			 
	  <a class="btn btn-primary navbar-btn" href="${pageContext.request.contextPath}/doc/xls/meeting${meeting.meetingno}.xls" download="${pageContext.request.contextPath}/doc/xls/meeting${meeting.meetingno}.xls"><i class="ti-download"></i>下载Excel</span></a>	
 	  <button type="button"   class="btn btn-primary" onclick='remind()'>会议报名提醒</button>					 
					</div>				
					</div>
						<div class="panel-body">
 
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">单位名称</th>
											<th class="text-center">参会人</th>
											<th class="text-center">性别</th>
											<th class="text-center">职务/职称</th>
											<th class="text-center">联系电话</th>
											<th class="text-center">电子邮件</th>
											<th class="text-center">是否住宿</th>
											<th class="text-center">住宿说明</th>
											<th class="text-center">发票内容</th>
											<th class="text-center">邮寄地址</th>
										</tr>
									</thead>
									<tbody>
									<c:set var="recno" value="0" />
										<c:forEach var="doc" items="${meetingAttendees}">
											<tr>
											<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>										
												<td>${doc.organizationName}</td>
												<td>
													${doc.attendeeName}										
												</td>
												<td>${doc.sex}</td>
												<td>${doc.duty} ${doc.jobTitle}</td>
												<td>${doc.telephone}</td>
												<td>${doc.email}</td>
												<td>${doc.stay}
												<c:if test="${doc.stay eq '1'}">是	</c:if>
												</td>
												<td>${doc.note}</td>
												<td>${doc.invoiceContent}</td>
												<td>${doc.address}</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
							</div>

							
						</div>
					</div>
				</div>
			</div>
		</form>



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
<script src="${pageContext.request.contextPath}/assets/js/morris/morris.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>


<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}

</script>

<SCRIPT> 
function showDialog(url) {
	  var iWidth=1000; //窗口宽度
	  var iHeight=600;//窗口高度
	  var iTop=(window.screen.height-iHeight)/2;
	  var iLeft=(window.screen.width-iWidth)/2;
	  window.open(url,"_blank","Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
	 }
</SCRIPT>
<script>
function remind(){
	 MaskUtil.mask();
	 document.getElementById('form1').submit()
}

 
	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在执行任务，请耐心等待完成...';
		function init(){
			if(!$mask){
				$mask = $("<div></div>")
				.css({
				  'position' : 'absolute'
				  ,'left' : '0'
				  ,'top' : '0'
				  ,'width' : '100%'
				  ,'height' : '100%'
				  ,'opacity' : '0.3'
				  ,'filter' : 'alpha(opacity=30)'
				  ,'display' : 'none'
				  ,'background-color': '#ccc'
				})
				.appendTo("body");
			}
			if(!$maskMsg){
				$maskMsg = $("<div></div>")
					.css({
					  'position': 'absolute'
					  ,'top': '50%'
					  ,'margin-top': '-20px'
					  ,'padding': '5px 20px 5px 20px'
					  ,'width': 'auto'
					  ,'border-width': '1px'
					  ,'border-style': 'solid'
					  ,'display': 'none'
					  ,'background-color': '#ffffff'
					  ,'font-size':'14px'
					})
					.appendTo("body");
			}
			
			$mask.css({width:"100%",height:$(document).height()});
			
			var scrollTop = $(document.body).scrollTop();
			
			$maskMsg.css({
				left:( $(document.body).outerWidth(true) - 190 ) / 2
				,top:( ($(window).height() - 45) / 2 ) + scrollTop
			}); 
					
		}
		
		return {
			mask:function(msg){
				init();
				$mask.show();
				$maskMsg.html(msg||defMsg).show();
			}
			,unmask:function(){
				$mask.hide();
				$maskMsg.hide();
			}
		}
		
	}());
	
	
</script>
</body>
</html>