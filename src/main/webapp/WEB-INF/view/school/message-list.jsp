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
			.message-list {
				padding: 0;
			}
			.message-list li{
				list-style: none;
			}
			
			.message-box {
				border: 1px solid #ccc;
				border-radius: 10px;
				padding: 10px 20px;
				margin-bottom: 8px;
				position: relative;
			}
			
			.mess-heading {
				display: flex;
				align-items: center;
				justify-content: space-between;
			}
			
			.mess-heading h4 {
				font-weight: 600;
				padding: 0;
			}
			
			.unread:before {
				content: '';
				width: 10px;
				height: 10px;
				position: absolute;
				top: 4px;
				left: 4px;
				background-color: red;
				border-radius: 50%;
			}
			
			.mess-heading span {
				color: #666;
				margin-left: 20px;
			}
			
			.mess-content {
				display: none;
			}
			
			.mess-content.on {
				display: block;
			}
			
			.mess-content p {
				word-break: break-all;
				padding: 0;
			}
			.reply form {
				display: flex;
				
			}
			
			.reply button {
				margin-left: 20px;
			}
			.time{
				font-size: 14px;
				float: right;
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
			<ol class="breadcrumb" style="padding-top:30px;font-size:20px;">
			 
				<li><a href="#" style="color:#ae3a3a">消息管理</a></li>
				<li class="active">消息列表</li>
			</ol> 							
		</div>

            <div id="page-inner">
            <form role="form" class="form-inline" name="form1"
					method="post">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
								<input type='hidden' id='page' name='page'
										value='${message.currPage}' />
									<ul class="message-list">
									
									<c:forEach items="${message.lists}" var="m">
										<c:if test = "${m.state == '未读'}">
											<li class="message-box unread" id = "${m.msgId}">
										</c:if>
										<c:if test = "${m.state == '已读'}">
											<li class="message-box"  id = "${m.msgId}">
										</c:if>
											<div class="mess-heading">
												<h4>${m.title}</h4>
												<div>
													<span class="from">${m.userName}</span>
													<span class="time">
														<fmt:formatDate value="${m.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
													</span>
												</div>
											</div>		
						
											<div class="mess-content">
												<p>${m.content}</p>
												<!-- <div style="width:1000px;height:1px;border-top:solid rgb(0,0,0) 0.5px;"></div> -->
												<br /><br />
												<div class="reply">
													<c:forEach items = "${m.messages}" var = "mlist">
														<div>
															<span class="from">${mlist.userName}</span>
															<span class="time"><fmt:formatDate value="${mlist.sendTime}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
														</div>
														<div>
															<p>&emsp;&emsp;${mlist.content}</p>
														</div>
														
													</c:forEach>
												</div>

												<div class="reply clearfix">
													<div>
														<input type="text" name="replyText" id="replyText" value="" class="form-control col-xs-6" />
														<button type="button" class="btn btn-primary reply-btn sendMess">回复</button>
													</div>
												</div>
											</div>

										</li>
									</c:forEach>	
										
									</ul>

								<div class="text-center">
										<nav aria-label="Page navigation">
											<ul class="pagination">
												<c:set var="prepage" value="enabled" />
												<c:set var="nextpage" value="enabled" />
												<c:set var="endpage" value="${message.currPage+10}" />
												<c:set var="startpage" value="${message.currPage}" />
												<c:choose>
													<c:when test="${endpage > message.totalPage}">
														<c:set var="endpage" value="${message.totalPage}" />
														<c:set var="startpage" value="${message.totalPage-10}" />
														<c:set var="nextpage" value="disabled" />
													</c:when>
													<c:when test="${message.currPage+10 > message.totalPage}'}">
														<c:set var="endpage" value="${message.totalPage}" />
														<c:set var="startpage" value="${message.totalPage-10}" />
														<c:set var="nextpage" value="disabled" />
													</c:when>
													<c:when test="${message.currPage < 10}">
														<c:set var="endpage" value="10" />
														<c:set var="startpage" value="1" />
														<c:set var="prepage" value="disabled" />
													</c:when>
												</c:choose>
												<c:if test="${startpage<1}">
													<c:set var="startpage" value="1" />
												</c:if>
												<c:if test="${endpage>message.totalPage}">
													<c:set var="endpage" value="${message.totalPage}" />
												</c:if>

												<li class="${prepage}"><a href="#"
													aria-label="Previous" onclick='goToPage(${startpage-10})'>
														<span aria-hidden="true">&laquo;</span>
												</a></li>

												<c:forEach var="p" begin="${startpage}" end="${endpage}"
													step="1">
													<c:set var="active" value="" />
													<c:if test="${message.currPage == p }">
														<c:set var="active" value="active" />
													</c:if>
													<li class="${active}"><a href='#'
														onclick='goToPage(${p})'>${p}</a></li>
												</c:forEach>

												<li class="${nextpage}"><a href="#" aria-label="Next"
													onclick='goToPage(${endpage})'> <span
														aria-hidden="true">&raquo;</span>
												</a></li>
											</ul>
										</nav>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /. ROW  -->
					</form>
					<footer>
						<p>Copyright &copy; 2016.Company name All rights reserved.
							<a target="_blank" href="http://www.cssmoban.com/">&#x7F51;&#x9875;&#x6A21;&#x677F;</a>
						</p>

					</footer>
				</div>    

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
		function showDialog(url) {
    		var iWidth=1200; //窗口宽度
    		var iHeight=900;//窗口高度
   			var iTop=10;//(window.screen.height-iHeight)/2;
    		var iLeft=(window.screen.width-iWidth)/2;
    		window.open(url,"_blank","Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
	    };
		//页面跳转
 		function goToPage(page){
			document.form1.action="${pageContext.request.contextPath}/schoolMessage/intoListMessage.do"
			document.getElementById("page").value=page;	
			document.form1.submit();
		};
 			
		//消息框点击事件
		$('.message-list').on('click', '.message-box', function(){
			if($(this).hasClass('unread')) {
				//标记为已读
				$(this).removeClass('unread');
				//发送post请求将该记录设为已读
			
				let msgId = $(this).attr("id");
				$.ajax({
					type:'post',
					url:'${pageContext.request.contextPath}/schoolMessage/updateMessageStatus.do',
					datetype:'text',
					data:{
						'msgId':msgId
					},
 					success:function(res){
 					}
				});	
			}
			
			$(this).siblings().find('.mess-content').removeClass('on');
			$(this).find('.mess-content').addClass('on').find('input').focus();
		}); 

 			
		// 发送消息
		$('.sendMess').click(function(){ 
			let replyText = $(this).siblings().val();
			let msgId = $(this).parent().parent().parent().parent().attr('id');
			//let replyText = this.parentElement.childNodes.$('#replyText').val();
				
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath}/schoolMessage/replyMessage.do',
				datetype:'text',
				data:{
					'replyText':replyText,
					'msgId':msgId
				},
 				success:function(res){
		        	alert("发送成功\r\n" + replyText );
		        	location.reload();
 				}
			});	
		});
</script>

</body>

</html>