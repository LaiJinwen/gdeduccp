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
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Morris Chart Styles-->
<link
	href="${pageContext.request.contextPath}/assets/js/morris/morris-0.4.3.min.css"
	rel="stylesheet" />


<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
	
  
  
<script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>  
<link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
<script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>  

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
				width: 50px!important;
				text-align: center;
			}
			#vote-max {
				margin-left: 28px;
				width: 50px!important;
				text-align: center;
			}			
			
			#form input,#form select  {
				width: 400px;
			}
			input::-webkit-inner-spin-button,
			input::-webkit-outer-spin-button{
				-webkit-appearance: none!important;
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
				<div class="header">
					<h1 class="page-header">
                             
                        </h1>
					<ol class="breadcrumb">
						<li>
							<a href="#">投票管理</a>
						</li>
						<li>
							<a href="task-manage.html">投票任务管理</a>
						</li>
						<li class="active">发布投票任务</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">																																		
									<form class="form-horizontal" role="form" id="form1" name="form1" action="<%=request.getContextPath() %>/vote/newVoteTask" method="post"  enctype ="multipart/form-data" >
										<div class="form-group col-md-12">
											<label for="title" class="col-sm-2 control-label">投票标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="title" name="title" placeholder="请输入投票标题">
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="introduction" class="col-sm-2 control-label">投票简介</label>
											<div class="col-sm-10">
											<textarea class="form-control" rows="4" id="introduction" name="introduction" placeholder="投票内容简介"></textarea>
												
											</div>
										</div>
 
									<div class="form-group col-md-12">
											<label for="meeting-nper" class="col-sm-2 control-label">候选人数</label>
											<div class="col-sm-10 nper-box">
												<i class="fa fa-minus-circle nper-icon minus"></i>
												<input type="number" class="form-control" id="meeting-nper" name="candidatenumber" value="10" oninput="this.value=this.value.length>2?this.value.substr(0,2):this.value;">
												<i class="fa fa-plus-circle nper-icon plus"></i>
											</div>
										</div>		
																																		
									<div class="form-group col-md-12">
											<label for="meeting-nper" class="col-sm-2 control-label">选择人数</label>
											<div class="col-sm-10 max-box">
												<i class="fa fa-minus-circle nper-icon minus"></i>
												<input type="number" class="form-control" id="vote-max" name="maxchoosenumber" value="5" oninput="this.value=this.value.length>2?this.value.substr(0,2):this.value;">
												<i class="fa fa-plus-circle nper-icon plus"></i>
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
										<label class="col-sm-2 control-label" for="template">投票介绍</label>
										<div class="col-sm-10">
											<input type="file" id="accessory" name="accessory" accept=".pdf" >(只接受pdf文件)
										</div>

									</div>																			
										 
										 <button type="button" id="publishVote" class="btn btn-primary col-md-offset-2" onclick="startPublish()">发布投票任务</button>
										
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
		<script src="../assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="../assets/js/bootstrap.min.js"></script>
	<script language="javascript" type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/My97DatePicker/WdatePicker.js"></script>
		<!-- Metis Menu Js -->
		<script src="../assets/js/jquery.metisMenu.js"></script>
		<script src="../assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
		</script>
		<!-- Custom Js -->
		<script src="../assets/js/custom-scripts.js"></script>
		<!--上传模板-->
		<script type="text/javascript">
			$('input[id=upload]').change(function() {
				$('#file_name').val($(this).val());
			});
		</script>
		
	  <script>
        $(function () {
            $("#datetime").datetimepicker({
                format: 'YYYY-MM-DD hh:mm',
                locale: moment.locale('zh-cn')
            });
        });
    </script>
	<script type="text/javascript">
			$('#main-menu>li:eq(4)>a').addClass('active-menu');
			
			$('.nper-box .plus').click(function(){
				if(!$('#meeting-nper').val()){
						$('#meeting-nper').val(1);
				}else if($('#meeting-nper').val()<99) {
					$('#meeting-nper').val($('#meeting-nper').val()*1+1);
				}
			});
			
			$('.nper-box .minus').click(function(){
				if(!$('#meeting-nper').val()){
						$('#meeting-nper').val(1);
				}else if($('#meeting-nper').val()>1) {
					$('#meeting-nper').val($('#meeting-nper').val()*1-1);
				}
			});
			$('.max-box .plus').click(function(){
				if(!$('#vote-max').val()){
						$('#vote-max').val(1);
				}else if($('#vote-max').val()<99) {
					$('#vote-max').val($('#vote-max').val()*1+1);
				}
			});
			
			$('.max-box .minus').click(function(){
				if(!$('#vote-max').val()){
						$('#vote-max').val(1);
				}else if($('#vote-max').val()>1) {
					$('#vote-max').val($('#vote-max').val()*1-1);
				}
			});			
		</script>	
		<script>
function startPublish(){
	var title = $("#title").val();
	var introduction = $("#introduction").val();
 
	if (title == "" || title == null) {
		alert("请输入标题");
		return false;
	}
	
      MaskUtil.mask();
	 document.getElementById('form1').submit()
}

	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在发布投票任务，请等待完成...';
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
					  ,'font-size':'16px'
					})
					.appendTo("body");
			}
			
			$mask.css({width:"100%",height:$(document).height()});
			
			var scrollTop = $(document.body).scrollTop();
			
			$maskMsg.css({
				left:( $(document.body).outerWidth(true) - 150 ) / 2
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