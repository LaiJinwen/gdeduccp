<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link href="${pageContext.request.contextPath}/assets/bootstrap-select/css/bootstrap-select.min.css" rel='stylesheet' type='text/css' />
		<style>
			.chooseCollege>div {
				margin-bottom: 10px;
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
									<form class="form-horizontal" role="form">
										<div class="form-group col-md-12">
											<label for="messageTitle" class="col-sm-2 control-label">消息标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="messageTitle" name="messageTitle">
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="messageCont" class="col-sm-2 control-label">消息内容</label>
											<div class="col-sm-10">
												<textarea name="messageCont" class="form-control" id="messageCont" rows="3"></textarea>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label class="col-sm-2 control-label">选择高校</label>
											<div class="col-sm-10 chooseCollege">
												<div>
													<label class="control-label">组织类型</label>
													<select class="selectpicker form-control condition" index="1" multiple  data-live-search="true" data-selected-text-format="count > 8" data-actions-box="true">
													    <option value="公办">公办高校</option>
													    <option value="民办">民办高校</option>
													    <option value="合作办学">合作办学</option>
													    <option value="独立学院">独立学院</option>                     
													</select>
												</div>
												<div>
													<label class="control-label">办学层次</label>
													<select class="selectpicker form-control condition" index="2" multiple  data-live-search="true" data-selected-text-format="count > 8" data-actions-box="true">
													    <option value="本科院校">本科院校</option>
													    <option value="专科院校">专科院校</option>
													    <option value="成人高校">成人高校</option>     
													    <option value="研究生">研究生</option>
													    <option value="其他">其他</option>          
													</select>
												</div>
												<div>
													<label class="control-label">组织关系</label>
													<select class="selectpicker form-control condition" index="3" multiple  data-live-search="true" data-selected-text-format="count > 8" data-actions-box="true">
													    <option value="省工委">省工委</option>
													    <option value="其他">其他</option>                      
													</select>
												</div>
												<div>
													<label class="control-label">高校</label>
													<select class="selectpicker form-control" id='colleges' multiple  data-live-search="true" data-selected-text-format="count > 8" data-actions-box="true">
													                              
													</select>
												</div>
											</div>
										</div>
										
										<button type="button" class="btn btn-primary col-md-offset-2 sendMess">发送消息</button>
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
		<script src="${pageContext.request.contextPath}/assets/bootstrap-select/js/bootstrap-select.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/bootstrap-select/js/defaults-zh_CN.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
		<script type="text/javascript">
			$('#main-menu>li:eq(4)>a').addClass('active-menu');
			
			$('.sendMess').click(function(){
				let arr = $('#colleges').val() || [];
				let title = $('#messageTitle').val();
				let cont = $('#messageCont').val();
				$.ajax({
					type:"post",
					url:"${pageContext.request.contextPath}/admin/doPublishMessage",
					data:{
						'title':title,
						'cont':cont,
						'arr':arr
					},
					success:function(res){
						console.log(res)
					}
				});
			});
			let query = [];
			$('.condition').change(function(){
				query[$(this).attr('index')-1] = $(this).val();
				let type = query[0] || [];
				let level = query[1] || [];
				let belong = query[2] || [];
				console.log(type);
				console.log(level);
				console.log(belong);
				console.log(query);
				$.ajax({
					type:'GET',
					url:'${pageContext.request.contextPath}/admin/handleFindSchoolWithBelongLevelType',
					data:{
						'type':type,
						'level':level,
						'belong':belong
						
					},
					success:function(res){
						let htmlstr = '';
						for(let obj of res.data) {
							htmlstr += '<option value="'+ obj.organizationid +'">'+obj.organizationname+'</option>'
						}
						$('#colleges').html(htmlstr).selectpicker('refresh');
					}
				});
				
		});
		</script>
	</body>

</html>