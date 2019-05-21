<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>广东教育工委党建</title>
<!-- Bootstrap Styles-->

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<link
	href="${pageContext.request.contextPath }/assets/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/assets/css/checkbox3.min.css"
	rel="stylesheet">
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath }/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath }/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<style>
.nper-box {
	position: relative;
}

.nper-icon {
	color: #CF2124;
	position: absolute;
	top: 2px;
	font-size: 30px;
	left: 10px;
	cursor: pointer;
}

.nper-icon.plus {
	left: 100px;
}

#meeting-nper {
	margin-left: 28px;
	width: 50px !important;
	text-align: center;
}

#form input, #form select {
	width: 400px;
}

input::-webkit-inner-spin-button, input::-webkit-outer-spin-button {
	-webkit-appearance: none !important;
}
</style>
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
					<li><a href="#">投票管理</a></li>
					<li class="active">投票</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="col-md-4">
									<b>投票标题：</b>${voteTask.title}</div>
								<div class="col-md-4">
									<b>最多可选：</b>${voteTask.maxchoosenumber}</div>
								<div class="col-md-4">
									<b>候选人/单位介绍：</b> <a
										href="${pageContext.request.contextPath}/doc/vote/${voteTask.title}.pdf"
										target=_blank>下载</a>
								</div>
								<div class="col-md-12">
									<b>投票简介：</b><br>
									&nbsp;&nbsp;&nbsp;&nbsp;${voteTask.introduction}
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form class="form-horizontal" role="form" id="form"	enctype="multipart/form-data">
									<input type="hidden" class="form-control" id="voterId"
										name="voterId" value=${voter.voterid}> <input
										type="hidden" class="form-control" id="voteTaskId"
										name="voteTaskId" value=${voteTask.votetaskid}>
									<div id="inputarea">
										<fieldset data-role="controlgroup">
											<label style="color: red">特别注意：每个单位仅有一次投票机会，提交后无法更改，请慎重投票！</label>		
											<br>								
											<label>请在以下候选人/单位中选取不超过${voteTask.maxchoosenumber}人/单位</label>
											<br>
											<c:set var="recno" value="1" />
											<c:forEach items="${candidates}" var="candidate">
											 
												<div class="col-md-12" style="margin-bottom: 10px;">
												  <div class="checkbox"  style="margin-bottom: 5px;"> 
													  <label for="checkbox${recno}" style="color:black"> 
													  <input type="checkbox" name="choosenames" id="checkbox${recno}" onclick="checkSelectNum('checkbox${recno}',${voteTask.maxchoosenumber})" value="${candidate.name}">
											          <b>${recno}. &nbsp; ${candidate.name}</b></label>
											     </div>
													<c:set var="recno" value="${recno+1}" />
													<div>&nbsp;&nbsp;&nbsp;&nbsp;
														${candidate.introduction}</div>
												  
												</div>
											</c:forEach>
										</fieldset>
									</div>
									
										 
										<button type="button" class="btn btn-primary col-md-offset-2"
										id="submitbtn">提交投票</button>	
									 
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->

				<footer>
					<p>
						Copyright &copy; 2020.Company name All rights reserved. <a
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
		src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script
		src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>

	<!-- Metis Menu Js -->
	<script
		src="${pageContext.request.contextPath }/assets/js/jquery.metisMenu.js"></script>
	<script language="javascript" type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/My97DatePicker/WdatePicker.js"></script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath }/assets/js/custom-scripts.js"></script>
	<script type="text/javascript">

	
	function checkSelectNum(checkname,max){
		if(getSelectNum()>max){
			alert("超过可选数量");
			var el = document.getElementById(checkname)
			el.checked = false;
		}
	}
	function getSelectNum(){
		var strgetSelectValue=0;
		var getSelectValueMenbers = $("input[name='choosenames']:checked").each(function(j) {
		    if (j >= 0) {
		    	strgetSelectValue++;
		       // strgetSelectValue += $(this).val() + ","
		    }
		});
		return strgetSelectValue;
	}
		//form submit
		$('#submitbtn').click(function() {
							if(getSelectNum()==0){
								alert("最少选一个");
								return false;
							}
								
							//let str = '';
							//let data = [];
							//let t = $('form').serializeArray();
							//$.each(t, function() {
							//	data.push(this.name + '=' + this.value);
							//});
							//str = data.join('&');
							//	 var data = new FormData();
							//      data.append("meetingNo", meetingNo.value);
							//      data.append("accessory", document.querySelector("#accessory").files[0]);
							//var form = new FormData(document.getElementById("form"));
							//	console.log(str);
							$.ajax({
										type : 'POST',
										url : '${pageContext.request.contextPath }/vote/submitVote',
										data : $("form").serialize(),
										success : function(result) {
											 
											if (result.state == 1) {
												alert('投票成功！');
												window.location.href = '${pageContext.request.contextPath }/vote/intoWebVoteTaskListUi';
											} else {
												alert('投票失败，请重新进入');
											}
										}
									});
						});
	</script>
 
	
</body>

</html>