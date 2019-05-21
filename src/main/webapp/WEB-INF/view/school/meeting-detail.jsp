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
					   
					  <li><a href="<%=request.getContextPath() %>/schoolMeeting/listMeeting.do">会议管理</a></li>
					  <li class="active">会议详情</li>
					</ol> 
									
		</div>
            <div id="page-inner">
            
            <div class="row">
                <div class="col-xs-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                                <form class="form-horizontal" role="form" >
                                	<c:forEach items="${meetingDetail}" var="m" >
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会议编号：</label>
                                                <div class="col-sm-3" style="line-height:32px;">
                                                    
                                                   ${m.meetingNo}
                                                </div>
                                            </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会议类别：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.meetingType}
                                                
                                            </div>
                                        </div>
                                        <div class="form-group">
		                                    <label class="col-sm-2 control-label">会议名称：</label>
                                            <div class="col-sm-6" style="line-height:32px;">
		                                        ${m.meetingTitle}
                                        	</div>
	                                    </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">发布时间：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                                ${m.publishDate}
                                                
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会议时间：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.meetingTime}
                                                
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会议地点：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.meetingAddresses}
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">会议时间：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.meetingTime}
                                                
                                            </div>
                                        </div> 
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">参会状态：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.attendanceState}
                                                
                                            </div>
                                        </div> 
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">参会人员：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.attendeesName}
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">联系人：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.contacts}
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">联系人手机号：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.Mobile}
                                                
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">联系人邮箱：</label>
                                            <div class="col-sm-3" style="line-height:32px;">
                                            	${m.email}
                                                
                                            </div>
                                        </div>
                                     </c:forEach>     
                           </form>
                            
                        </div>
                    </div>
                </div>
            </div>

				<footer><p>广东省党委.</p>
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

    <script src="${pageContext.request.contextPath}/assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				$(".selectbox").select2();
			});
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/wangEditor.min.js"></script>

</body>

</html>