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
        th{
            text-align: center;
        }
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
		<%@ include file="navbar-top.jsp"%>
		<!-- /. NAV TOP  -->
		<%@ include file="navbar-side.jsp"%>
		
 		<div id="page-wrapper">
		  <div class="header" style="margin-top:10px;"> 
                         
						<ol class="breadcrumb">
					  <!-- <li><a href="#">Home</a></li> -->
					  <li><a href="#">文档管理</a></li>
					  <li class="active">文档列表</li>
					</ol> 
									
		  </div>
            <div id="page-inner">
            <form role="form" class="form-inline" name="form1"
					action="${pageContext.request.contextPath}/school/listAllDocument.do"
					method="post">
                <div class="row">
                    <div class="col-xs-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <input type='hidden' id='page' name='page' value='${docs.currPage}' />
                                <table class="table table-bordered text-center" style="margin-top:20px;">
                                    <thead>
                                        <tr>
                                        	<th>序号</th>
                                            
                                            <th>文档名</th>
                                            <th>发布时间</th>
                                            <th>上传时间</th>
                                            <th>审批时间</th>
                                            <th>状态</th>
                                            <th>操作</th>
                                            <th>下载</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    
                                    <c:set var="recno" value="${(doc.currPage-1)*doc.pageSize}" />
                                    <c:forEach items="${doc.lists}" var="d">
                                	<tr>                          
										<c:set var="recno" value="${recno+1}" />
										<td>${recno}</td>
 
                                		<td>
                                		${d.title}
                                			
                                		
                                		</td>
                                		<td>
                                		<fmt:formatDate value="${d.publishDate}" pattern="yyyy-MM-dd"/>
                                		</td>
                                		<td>
                                		<fmt:formatDate value="${d.submitDate}" pattern="yyyy-MM-dd"/>
                                		</td>
                                		<td>
                                		<fmt:formatDate value="${d.approvalDate}" pattern="yyyy-MM-dd"/>
                                		
                                		</td>
                                		<td>
                                		<c:if test="${d.documentState == '未提交'}">
                                		<label style="color:red"> ${d.documentState}</label>
                                		</c:if>
                                		<c:if test="${d.documentState != '未提交'}">
                                		<label style="color:blue"> ${d.documentState}</label>
                                		</c:if>
                                		</td>
                                		<td style="color:blue">
                                			<c:if test="${d.documentState == '未提交'}">
                                				<a href="<%=request.getContextPath() %>/school/intoUploadDocument.do?docId=${d.documentId}&docTitle=${d.title}">上报</a>
                                			</c:if>
                                			<c:if test ="${d.documentState == '待审' || d.documentState == '修改待审'}">
                                				<a href="<%=request.getContextPath() %>/school/intoModifyDocument.do?docId=${d.documentId}&docTitle=${d.title}&docState=${d.documentState}">修改</a>
                                			</c:if>
                                			<c:if test="${d.documentState == '退回' }">
                                				<a href="<%=request.getContextPath() %>/school/intoReturnDocument.do?docId=${d.documentId}&docTitle=${d.title}&docState=${d.documentState}">查看批注 修改</a>
                                			</c:if>
                                			<c:if test="${d.documentState == '审核通过'}">
                                				<a href="#"> </a>
                                			</c:if>
                                		</td>
                                		<td style="color:blue">
                                			<c:if test ="${d.documentState != '未提交' }">
                                     				<a href="<%=request.getContextPath() %>/school/downloadDocument.do?docId=${d.documentId}">下载</a>
                                			</c:if>
                                			
                                		</td>
                                	</tr>   
                                    </c:forEach>    
                                        
                                    </tbody>
                                </table>

                                <div class="text-center">
                                    <nav aria-label="Page navigation">
										<ul class="pagination">
											<c:set var="prepage" value="enabled" />
											<c:set var="nextpage" value="enabled" />
											<c:set var="endpage" value="${doc.currPage+10}" />
											<c:set var="startpage" value="${doc.currPage}" />
											<c:choose>
												<c:when test="${endpage > doc.totalPage}">
													<c:set var="endpage" value="${doc.totalPage}" />
													<c:set var="startpage" value="${doc.totalPage-10}" />
													<c:set var="nextpage" value="disabled" />
												</c:when>
												<c:when test="${doc.currPage+10 > doc.totalPage}'}">
													<c:set var="endpage" value="${doc.totalPage}" />
													<c:set var="startpage" value="${doc.totalPage-10}" />
													<c:set var="nextpage" value="disabled" />
												</c:when>
												<c:when test="${doc.currPage < 10}">
													<c:set var="endpage" value="10" />
													<c:set var="startpage" value="1" />
													<c:set var="prepage" value="disabled" />
												</c:when>
											</c:choose>
											<c:if test="${startpage<1}">
												<c:set var="startpage" value="1" />
											</c:if>
											<c:if test="${endpage>doc.totalPage}">
												<c:set var="endpage" value="${doc.totalPage}" />
											</c:if>

											<li class="${prepage}"><a href="#" aria-label="Previous"
												onclick='goToPage(${startpage-10})'> <span
													aria-hidden="true">&laquo;</span>
											</a></li>
											
											<c:forEach var="p" begin="${startpage}" end="${endpage}"
												step="1">
												<c:set var="active" value="" />
												<c:if test="${doc.currPage == p }">
													<c:set var="active" value="active" />
												</c:if>
												<li class="${active}"><a href='#'
													onclick='goToPage(${p})'>${p}</a></li>
											</c:forEach>

											<li class="${nextpage}"><a href="#" aria-label="Next"
												onclick='goToPage(${endpage})'> <span aria-hidden="true">&raquo;</span>
											</a></li>
										</ul>
									</nav>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                
                </form>
				<footer><p>广东省教育工委.</p>
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

    <script type="${pageContext.request.contextPath}text/javascript"></script>
    <script>

		function goToPage(page){
			document.getElementById("page").value=page;
			document.form1.submit();
		}

    </script>

</body>

</html>