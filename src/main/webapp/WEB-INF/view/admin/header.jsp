<%@page language="java" import="com.zhuozhengsoft.pageoffice.*" %>
<%@taglib uri="http://java.pageoffice.cn" prefix="po" %>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>广东教育工委党建信息管理系统</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
     <link href="${pageContext.request.contextPath}/assets/css/select2.min.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/assets/css/checkbox3.min.css" rel="stylesheet">	   
    <!-- Morris Chart Styles-->
    <!--link href="/gdeduccp/assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" /-->
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/task-manage.css">    
     <!-- Google Fonts-->
   <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>

<body>
    <div id="wrapper">
        <nav class="navbar navbar-default top-navbar" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html"><strong><i class="fa fa-flag"></i> 广东教育工委党建</strong></a>
				
		<div id="sideNav" href="">
		<i class="fa fa-bars icon"></i> 
		</div>
            </div>

            <ul class="nav navbar-top-links navbar-right">
                
                <!-- /.dropdown -->
                
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 min</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="#"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
        </nav>
        <!--/. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a class="active-menu" href="#"><i class="fa fa-dashboard"></i> 功能菜单</a>
                    </li>

					 
					 <li>
                        <a href="#"><i class="fa fa-edit"></i>文档任务管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="chart.html">发布文档任务</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/admin/documentTaskManage">文档任务管理</a>
                            </li>              
							</ul>
						</li>	
					 <li>
                        <a href="#"><i class="fa fa-fw fa-file"></i>文档审核管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="chart.html">文档审核</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">文档修改</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">总结文档上传</a>
                            </li>                            
							</ul>
						</li>		
                       <li>
                        <a href="#"><i class="fa fa-table"></i>文档查询统计<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/leader/documentSearch">文档查询</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/leader/documentStatBySchool">按高校统计</a>
                            </li>  
                             <li>
                                <a href="${pageContext.request.contextPath}/leader/documentStatBySchoolType">按高校类别统计</a>
                            </li>                                                             
							</ul>
						</li>
 
                     <li>
                        <a href="#"><i class="fa fa-sitemap"></i>会议管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath }/admin/intoPublishMeeting.do">发布会议</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">会议维护</a>
                            </li>                                                            
							</ul>
						</li>                   												               
 
                     <li>
                        <a href="#"><i class="fa fa-sitemap"></i>会议查询统计<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="chart.html">按会议查询</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">按学校查询</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">按高校统计</a>
                            </li>  
                             <li>
                                <a href="morris-chart.html">按会议统计</a>
                            </li>                                                             
							</ul>
						</li>  												
                      <li>
                        <a href="#"><i class="fa fa-users"></i>账户管理<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="chart.html">添加账户</a>
                            </li>
                            <li>
                                <a href="morris-chart.html">账户维护</a>
                            </li>                                                       
							</ul>
						</li>                 												        
                   												
                    <li>
                        <a href="tab-panel.html"><i class="fa fa-wechat"></i> 消息互动</a>
                    </li>
      
                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->
      <!-- /. 主体开始  -->
      
      <!-- /. 主体结束  -->
		
     