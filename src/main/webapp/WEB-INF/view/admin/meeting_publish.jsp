<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<li><a href="#">会议管理</a></li>
					<li class="active">发布会议</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form class="form-horizontal" role="form" id="form1" name="form1" enctype="multipart/form-data">
									<div class="form-group col-md-12">
										<label for="meetingNo" class="col-sm-2 control-label">会议编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="meetingNo"
												name="meetingNo">
										</div>
									</div>
									<div class="form-group col-md-12">
										<label for="meetingTitle" class="col-sm-2 control-label">会议标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="meetingTitle"
												name="meetingTitle">
										</div>
									</div>
									<div class="form-group col-md-12">
										<label for="meetingTime" class="col-sm-2 control-label">会议时间</label>
										<div class="col-sm-10">
											<input class="Wdate" id="meetingTime" name="meetingTime"
												type="text"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />

										</div>
									</div>
									<div class="form-group col-md-12">
										<label for="deadline" class="col-sm-2 control-label">截止报名</label>
										<div class="col-sm-10">
											<input class="Wdate" id="deadline" name="deadline"
												type="text"
												onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />

										</div>
									</div>
									<div class="form-group col-md-12">
										<label for="meeting-address" class="col-sm-2 control-label">会议地址</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="meeting-address"
												name="meetingAddresses">
										</div>
									</div>

									<div class="form-group col-md-12">

										<label class="col-sm-2 control-label">办学层次</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="本科院校"
													name="schoolLevel" checked> <label
													for="checkbox-fa-light-1">本科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="专科院校"
													name="schoolLevel" checked> <label
													for="checkbox-fa-light-2">专科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-3" value="成人高校"
													name="schoolLevel" checked> <label
													for="checkbox-fa-light-3">成人高校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="研究生"
													name="schoolLevel" checked> <label
													for="checkbox-fa-light-4">研究生</label>
											</div>
										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">办学性质</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-5" value="公办"
													name="schoolType" checked> <label
													for="checkbox-fa-light-5">公办 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-6" value="民办"
													name="schoolType" checked> <label
													for="checkbox-fa-light-6">民办</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-7" value="独立学院"
													name="schoolType" checked> <label
													for="checkbox-fa-light-7">独立学院</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-8" value="合作办学"
													name="schoolType" checked> <label
													for="checkbox-fa-light-8">合作办学</label>
											</div>
										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">组织关系</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-9" value="省工委"
													name="belong" checked> <label
													for="checkbox-fa-light-9"> 工委 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-10" value="其他"
													name="belong" checked> <label
													for="checkbox-fa-light-10"> 其他 </label>
											</div>
										</div>
									</div>

									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">报名选项</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-11" value="1"
													name="email" checked> <label
													for="checkbox-fa-light-11">Email</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-12" value="1"
													name="telephone" checked> <label
													for="checkbox-fa-light-12">电话 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-13" value="1"
													name="duty" checked> <label
													for="checkbox-fa-light-13">职务</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-14" value="1"
													name="jobTitle" checked> <label
													for="checkbox-fa-light-14">职称</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-15" value="1"
													name="sex" checked> <label
													for="checkbox-fa-light-15">性别</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-16" value="1"
													name="stay" checked> <label
													for="checkbox-fa-light-16">是否住宿</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-17" value="1"
													name="invoiceContent" checked> <label
													for="checkbox-fa-light-17">发票内容</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-18" value="1"
													name="address" checked> <label
													for="checkbox-fa-light-18">邮寄地址</label>
											</div>
										</div>
									</div>

									<div class="form-group col-md-12">
										<label for="meetingCont" class="col-sm-2 control-label">会议内容</label>
										<div class="col-sm-10">
											<textarea class="form-control" name="meetingCont"
												id="meetingContent" rows="10"></textarea>
										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label" for="accessory">会议通知</label>
										<div class="col-sm-10">
											<input type="file" id="accessory" name="accessory"  accept=".pdf" >(只接受pdf文件)
										</div>

									</div>

									<button type="button" class="btn btn-primary col-md-offset-2"
										id="submit-btn">发布会议</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- /. ROW  -->

				<footer>
					<p>
						 
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
		$('#main-menu>li:eq(4)>a').addClass('active-menu');

		$('.nper-box .plus').click(function() {
			if (!$('#meeting-nper').val()) {
				$('#meeting-nper').val(1);
			} else if ($('#meeting-nper').val() < 99) {
				$('#meeting-nper').val($('#meeting-nper').val() * 1 + 1);
			}
		});

		$('.nper-box .minus').click(function() {
			if (!$('#meeting-nper').val()) {
				$('#meeting-nper').val(1);
			} else if ($('#meeting-nper').val() > 1) {
				$('#meeting-nper').val($('#meeting-nper').val() * 1 - 1);
			}
		});

		//form submit
		$('#submit-btn').click(function(){
							var meetingNo = $("#meetingNo").val();
							var meetingTitle = $("#meetingTitle").val();
							var meetingTime = $("#meetingTime").val();
							var deadline = $("#deadline").val();
							var accessory = $("#accessory").val();
							if (meetingNo == "" || meetingNo == null) {
								alert("请输入会议号");
								return false;
							}
							if (meetingTime == "" || meetingTime == null) {
								alert("请输入会议时间");
								return false;
							}
							if (meetingTitle == "" || meetingTitle == null) {
								alert("请输入会议时间");
								return false;
							}
							if (deadline == "" || deadline == null) {
								alert("请输入会议截止报名时间");
								return false;
							}							
							if (accessory == "" || accessory == null) {
								alert("请上传会议通知");
								return false;
							}		
							//等待发布会议
							 MaskUtil.mask();
							 
 						 	 var form1 = new FormData(document.getElementById("form1"));
							// console.log(form1);
							$.ajax({
								type : 'post',
								url : '${pageContext.request.contextPath }/admin/doPublishMeeting',
								data :form1,
								contentType: false,
								processData: false, 
								success : function(result) {
									  if (result.state == 1) {
											alert('会议发布成功！');
											window.location.href = '${pageContext.request.contextPath}/admin/intoManageMeeting.do';
										} else if (result.state == -1) {
											alert('文件太大，请压缩至5M以内！');
										} else if (result.state == 0) {
											alert('会议通知部分失败');
										}
										else{//-2
											alert('会议发布失败');
										}
									  MaskUtil.unmask();
										},
								 error : function() {  
										  alert('会议发布异常！');
										  MaskUtil.unmask();
									     }  
									});
						});
	
		var MaskUtil = (function(){
			var $mask,$maskMsg;
			var defMsg = '正在发布会议任务，请等待完成...';
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