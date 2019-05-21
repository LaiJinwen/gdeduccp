<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
    <!-- Morris Chart Styles-->
    <link href="${pageContext.request.contextPath}/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- <link rel="stylesheet" href="assets/js/Lightweight-Chart/cssCharts.css">  -->

    <style>
        body{
            background-color:#eee;
        }
        .top-navbar {
            background-color: #cf2124;
        }
        #sideNav{
            color:#fff;
        }
        #main-menu{
            background-color: #eee;
        }
        #page-wrapper{
            box-shadow:0 0 #fff;
            background-color: #fff;
        }
        .page-header{
            background-color: #fff;
        }
        .sidebar-collapse .nav > li > a {
            color: #ae3a3a;
            font-size: medium;
        }
        .sidebar-collapse .nav > li > a:hover, .sidebar-collapse .nav > li > a:focus{
            color:#fff;
        } 
        .nav > li > a > i{
            color: #fff;
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
							<a href="#">消息管理</a>
						</li>
						<li class="active">发送消息</li>
					</ol>
									
		</div>

            <div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" role="form"  id="messageForm"
										<%-- action="<%=request.getContextPath()%>/schoolMessage/sendingMessage.do" --%>
									>
										<div class="form-group col-md-12">
											<label for="messageTitle" class="col-sm-2 control-label">消息标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="title" name="title">
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="messageCont" class="col-sm-2 control-label">消息内容</label>
											<div class="col-sm-10">
												<textarea  id="content" name="content" class="form-control" id="content" rows="6"></textarea>
											</div>
										</div>
										
										<button type="button"  class="btn btn-primary col-md-offset-2 sendMess">发送消息</button>
										
										<!--  
										<div>
											<label for="messageTitle" class="col-sm-6 control-label">${msg}</label>
										</div>
										-->
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
    <!-- Custom Js -->
    <script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

<script type="text/javascript">
//发送按钮
//$('.messageForm').on('click', '.sendMess', function(){
$('.sendMess').click(function(){

	let title = $('#title').val();
	let content = $('#content').val();
	if (title == "" || title == null) {
		alert("请输入标题");
		return false;
	}
	if (content == "" || content == null) {
		alert("请输入内容");
		return false;
	}
	$.ajax({
		type:'post',
		url:'${pageContext.request.contextPath}/schoolMessage/sendingMessage.do',
		data:{
			'title':title,
			'content':content,
		},
		success:function(res){
			//console.log(res)
            if (res.state == 1) {
			 alert("发送消息成功！ \r\n标题："+title + "\r\n内容：" + content);
			window.location.href = '${pageContext.request.contextPath }/schoolMessage/intoMessageList';
			}
			else{ alert("发送消息失败！");
				}
			}
	});	
});

</script>


</body>

</html>