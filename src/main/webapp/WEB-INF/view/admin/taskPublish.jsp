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





</head>
<body>
	<div id="wrapper">
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>


		<!-- /. NAV SIDE  -->
		<div id="page-wrapper" >
			<div class="header" style="margin-top:10px;">
				 
				<ol class="breadcrumb">
					<li><a href="#">文档管理</a></li>
					<li><a href="task-manage.html">文档任务管理</a></li>
					<li class="active">发布文档任务</li>
				</ol>

			</div>
			<div id="page-inner">
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<form class="form-horizontal" role="form" id="form1"
									action="<%=request.getContextPath()%>/admin/publishDocument.do"
									method="post" enctype="multipart/form-data">
									<div class="form-group col-md-12">
										<label for="documentNo" class="col-sm-2 control-label">文档编号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="documentNo"
												name="documentNo" placeholder="请输入文档自编号" style="width:500px;">
										</div>
									</div>
									<div class="form-group col-md-12">
										<label for="tittle" class="col-sm-2 control-label">文档标题</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="tittle"
												name="tittle" placeholder="请输入文档标题" style="width:500px;" >
										</div>
									</div>
								 
									<div class="form-group col-md-12">
										<label for="endTime" class="col-sm-2 control-label">提交期限</label>
										<div class="col-sm-10">
											<input  class="Wdate" id="endTime" name="endTime"
												type="text"  onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})" />

										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">办学层次</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="本科院校"
													name="level" checked> <label
													for="checkbox-fa-light-1">本科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="专科院校"
													name="level" checked> <label
													for="checkbox-fa-light-2">专科院校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-3" value="成人高校"
													name="level" checked> <label
													for="checkbox-fa-light-3">成人高校</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="研究生"
													name="level" checked> <label
													for="checkbox-fa-light-4">研究生</label>
											</div>
										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">办学性质</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="公办"
													name="orType" checked> <label
													for="checkbox-fa-light-1">公办 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="民办"
													name="orType" checked> <label
													for="checkbox-fa-light-2">民办</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-3" value="独立学院"
													name="orType" checked> <label
													for="checkbox-fa-light-3">独立学院</label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-4" value="合作办学"
													name="orType" checked> <label
													for="checkbox-fa-light-4">合作办学</label>
											</div>
										</div>
									</div>
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label">组织关系</label>
										<div class="col-sm-10">
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-1" value="省工委"
													name="belong" checked> <label
													for="checkbox-fa-light-1"> 工委 </label>
											</div>
											<div
												class="checkbox3 checkbox-inline checkbox-check checkbox-light">
												<input type="checkbox" id="checkbox-fa-light-2" value="其他"
													name="belong" checked> <label
													for="checkbox-fa-light-2"> 其他 </label>
											</div>
										</div>
									</div>
								
									<div class="form-group col-md-12">
										<label class="col-sm-2 control-label" for="template">上传模板</label>
										<div class="col-sm-10">
										<input type="file"   id="template" name="template"  accept=".docx">（请上传docx格式文件）
										</div>
										<!-- <div class="col-md-6">
													<input id="file_name" class="col-sm-8 form-control" type="text">
												</div>
											<a class="btn btn-default" onclick="$('input[id=upload]').click();">上传模板</a> -->
									</div>
									 
									 <button type="button" id="mergebutton" class="btn btn-primary col-md-offset-2" onclick="startPublish()">发布文档任务</button>
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
		$(function() {
			$("#datetime").datetimepicker({
				format : 'YYYY-MM-DD hh:mm',
				locale : moment.locale('zh-cn')
			});
		});
	</script>
<script type="text/javascript">

$(function(){
    setdate();
});

//日期框添加默认值
function  setdate(){
    var sd=new Date();
    sd.setDate(sd.getDate()-1);
    var sy=sd.getFullYear();
    var sm = sd.getMonth()+1;
    var sdd=sd.getDate();
    if (sm >= 1 && sm <= 9) {
        sm = "0" + sm;
    }
    if (sdd >= 0 && sdd <= 9) {
        sdd = "0" + sdd;
    }

    var ed=new Date();
    ed.setDate(ed.getDate()+1);
    var ey=ed.getFullYear();
    var em = ed.getMonth()+1;
    var edd=ed.getDate();
    if (em >= 1 && em <= 9) {
        em = "0" + em;
    }
    if (edd >= 0 && edd <= 9) {
        edd = "0" + edd;
    }
    $("#endTime").val(ey+"-"+em+"-"+edd);
}

</script>

<script>
function startPublish(){
	var documentNo = $("#documentNo").val();
	var tittle = $("#tittle").val();
	var endTime = $("#endTime").val();
	var template = $("#template").val();
	
	if (documentNo == "" || documentNo == null) {
		alert("请输入文档号");
		return false;
	}
	if (tittle == "" || tittle == null) {
		alert("请输入文档标题");
		return false;
	}
	if (endTime == "" || endTime == null) {
		alert("请输入截止期限");
		return false;
	}	
	if (template == "" || template == null) {
		alert("请上传模板");
		return false;
	}		
	  var fileNameArray = template.split('.');
      
      var fileTypeValue = "";
      if (fileNameArray.length > 1) {
          fileTypeValue = fileNameArray[fileNameArray.length - 1];
      }
      if ((fileTypeValue == "docx" )) {

      } else {
      	alert("请上传docx类型的文件");
          return false;
      }
    MaskUtil.mask();
	 document.getElementById('form1').submit()
}

	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在发布文档任务，请等待完成...';
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