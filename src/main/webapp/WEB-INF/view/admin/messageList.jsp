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
		<title>广东教育工委党建</title>
		<!-- Bootstrap Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/assets/css/checkbox3.min.css" rel="stylesheet">
		<!-- FontAwesome Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Custom Styles-->
		<link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<style>
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
			.mess-heading {
				display: flex;
				align-items: center;
				justify-content: space-between;
				cursor: pointer;
			}
			
			.mess-heading h4 {
				font-weight: 600;
				padding: 0;
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
			
			.replied li{
				padding: 16px 0 0 0;
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
						<li class="active">消息列表</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<ul class="message-list">
								 <c:forEach items="${list }" var="m" varStatus="status">

									<c:if test="${m.state == '未读'}">
										<li class="message-box unread">
										
											 <div id= ${m.msgId}></div>
											 <div class="mess-heading">
												<h4>${m.title}</h4>
												<div>
													<span class="from">${m.fromOrg}</span>	
													<span class="time"><fmt:formatDate value="${m.sendTime}" pattern="yyyy-MM-dd"/></span>
												</div>
											</div>
											<div class="mess-content">
												<p>${m.content}</p>
												<div class="reply">
													<form>
													    <input type="hidden" name="mid" id="mid" value="${m.msgId}" class="form-control" />
														<input type="text" name="replyText" id="replyText" value="" class="form-control" />
														<button type="button" class="btn btn-primary reply-btn">回复</button>
													</form>
													<div class="replied">
													 
														<ul>
														
														<c:forEach items="${replyMessages[m.msgId]}" var="replymsg">
															<li>
																<span>${replymsg.fromOrg}<span class="time">(<fmt:formatDate value="${replymsg.sendTime}" pattern="yyyy-MM-dd"/>)</span>：</span>
																<span class="msg">${replymsg.content}</span>
															</li>
                                                       </c:forEach>
														</ul>
													</div>
												</div>
											</div>

										</li>
										</c:if>
								 </c:forEach>	
										
								 <c:forEach items="${list }" var="m" varStatus="status">
									<c:if test="${m.state == '已读'}">
										<li class="message-box">
											<div class="mess-heading">
												<h4>${m.title}</h4>
												<div>
													<span class="from">${m.fromOrg}</span>
													
													<span class="time"><fmt:formatDate value="${m.sendTime}" pattern="yyyy-MM-dd"/></span>
												</div>
											</div>
											<div class="mess-content">
												<p>${m.content}</p>
												<div class="reply">
													<form>
													    <input type="hidden" name="mid" id="mid" value="${m.msgId}" class="form-control" />
														<input type="text" name="replyText" id="replyText" value="" class="form-control" />
														<button type="button" class="btn btn-primary reply-btn">回复</button>
													</form>
													<div class="replied">
														<ul>
														 <c:forEach items="${replyMessages[m.msgId]}" var="replymsg">
															<li>
																<span>${replymsg.fromOrg}<span class="time">(<fmt:formatDate value="${replymsg.sendTime}" pattern="yyyy-MM-dd"/>)</span>：</span>
																<span class="msg">${replymsg.content}</span>
															</li>
                                                       </c:forEach>													
														</ul>
													</div>
												</div>
											</div>
										</li>
										</c:if>
										</c:forEach>											
									</ul>
								</div>
								
								<nav aria-label="Page navigation" class="page-nav" style="align:center">
										<ul class="pagination">
											<li>
												<a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=1" aria-label="Previous">
													<span aria-hidden="true">首页</span>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=${page.prePage}" aria-label="Previous">
													<span aria-hidden="true">上一页</span>
												</a>
											</li>
											<c:forEach items="${page.navigatepageNums }" var="each" >
												 <c:if test="${each==page.pageNum}">
				                                    <li class="active">
					                                    <a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=${each}"><span aria-hidden="true">${each}</a>
				                                    </li>
				                                </c:if>
				                                <c:if test="${each!=page.pageNum}">
				                                    <li class=""> 
					                                    <a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=${each}">${each}</a>
				                                    </li>
				                                </c:if>
											</c:forEach>
											<li>
												<a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=${page.pageNum+1}" aria-label="Previous">
													<span aria-hidden="true">下一页</span>
												</a>
											</li>
											<li>
												<a href="${pageContext.request.contextPath }/adminMessage/intoMessageList?page=${page.pages}" aria-label="Next">
													<span aria-hidden="true">尾页</span>
												</a>
											</li>
										</ul>
									</nav>
									
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
		<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
		<script type="text/javascript">
			$('#main-menu>li:eq(4)>a').addClass('active-menu');

			//消息框点击事件
			$('.message-list').on('click', '.message-box', function(){
				if($(this).hasClass('unread')) {
					//标记为已读
					 //获取id
					 $(this).removeClass('unread');
					let msg=$(this).find('div').attr("id");
					//alert('${pageContext.request.contextPath}/adminMessage/readMessage?msgId='+msg);
					//发送ajax请求
					$.ajax({
						type:'get',
						url:'${pageContext.request.contextPath}/adminMessage/readMessage?msgId='+msg,
						data:msg,
						success : function(result){
	 						}
					});
					//发送post请求将该记录设为已读
 					//$.post('${pageContext.request.contextPath}/adminMessage/readMessage?msgId='+msg);
				}
				
				$(this).siblings().find('.mess-content').removeClass('on');
				$(this).find('.mess-content').addClass('on').find('input').focus();
			});
			
			//回复按钮
			$('.message-list').on('click', '.reply-btn', function(){
				let msg = $(this).siblings("#replyText").val();
				let msgid = $(this).siblings("#mid").val(); 
				
				//let mid= $(this).attr('mid', value);
				 alert(msg+msgid);
				//alert(msgid);
				//发送ajax请求
				$.ajax({
					type:'get',
					url:'${pageContext.request.contextPath}/adminMessage/replyMessage?msgId='+msgid+'&msg='+msg,
					data:msg,
					success : function(result){
						//判断插入是否成功
						//返回插入时间
						let time = res.time;
						//将msg插入到回复框中
						let html = '<li><span>已回复<span class="time">(2018-12-24 13:09)</span>：</span><span class="msg">'+msg+'</span></li>'
						$(this).parent().siblings().find('ul').append(html);
					}
				});
				//供测试
				let html = '<li><span>已回复<span class="time">(2018-12-24 13:09)</span>：</span><span class="msg">'+msg+'</span></li>'
				$(this).parent().siblings().find('ul').append(html);
			});
			
		</script>
	</body>

</html>