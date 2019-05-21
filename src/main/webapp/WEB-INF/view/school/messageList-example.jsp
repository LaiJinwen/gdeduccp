<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta content="" name="description" />
		<meta content="webthemez" name="author" />
		<title>广东教育工委党建</title>
		<!-- Bootstrap Styles-->
		<link href="assets/css/bootstrap.css" rel="stylesheet" />
		<link href="assets/css/checkbox3.min.css" rel="stylesheet">
		<!-- FontAwesome Styles-->
		<link href="assets/css/font-awesome.css" rel="stylesheet" />
		<!-- Custom Styles-->
		<link href="assets/css/custom-styles.css" rel="stylesheet" />
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
				<div class="header">
					<h1 class="page-header">
                            Dashboard <small>Welcome John Doe</small>
                        </h1>
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
										<li class="message-box unread">
											<div class="mess-heading">
												<h4>标题</h4>
												<div>
													<span class="from">中山大学管理员</span>
													<span class="time">2018-12-15 20:37</span>
												</div>
											</div>
											<div class="mess-content">
												<p>afdssssssssssafsafdssssss</p>
												<div class="reply">
													<form>
														<input type="text" name="replyText" id="replyText" value="" class="form-control" />
														<button type="button" class="btn btn-primary reply-btn">回复</button>
													</form>
													<div class="replied">
														<ul>
															<li>
																<span>已回复<span class="time">(2018-12-24 13:09)</span>：</span>
																<span class="msg">qweqweweq</span>
															</li>
															<li>
																<span>已回复<span class="time">(2018-12-24 13:09)</span>：</span>
																<span class="msg">qweqweweq</span>
															</li>
														</ul>
													</div>
												</div>
											</div>

										</li>
										


									</ul>
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
		<script src="assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="assets/js/jquery.metisMenu.js"></script>

		<!-- Custom Js -->
		<script src="assets/js/custom-scripts.js"></script>
		<script type="text/javascript">
			$('#main-menu>li:eq(4)>a').addClass('active-menu');

			//消息框点击事件
			$('.message-list').on('click', '.message-box', function(){
				if($(this).hasClass('unread')) {
					//标记为已读
					$(this).removeClass('unread');
					//发送post请求将该记录设为已读
//					$.post('url');
				}
				
				$(this).siblings().find('.mess-content').removeClass('on');
				$(this).find('.mess-content').addClass('on').find('input').focus();
			});
			
			//回复按钮
			$('.message-list').on('click', '.reply-btn', function(){
				let msg = $(this).siblings().val();
				$(this).siblings().val('');
				//发送ajax请求
				$.ajax({
					type:'post',
					url:'',
					data:msg,
					success:function(res){
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