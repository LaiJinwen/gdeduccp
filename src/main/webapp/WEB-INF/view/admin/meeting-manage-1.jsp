<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta content="" name="description" />
		<meta content="webthemez" name="author" />
		<title>广东教育工委党建</title>
		<!-- Bootstrap Styles-->
		<link href="${pageContext.request.contextPath }/assets/css/bootstrap.css" rel="stylesheet" />
		<!-- FontAwesome Styles-->
		<link href="${pageContext.request.contextPath }/assets/css/font-awesome.css" rel="stylesheet" />
		<link href="${pageContext.request.contextPath }/assets/css/select2.min.css" rel="stylesheet">
		<link href="${pageContext.request.contextPath }/assets/css/checkbox3.min.css" rel="stylesheet">
		<!-- Custom Styles-->
		<link href="${pageContext.request.contextPath }/assets/css/custom-styles.css" rel="stylesheet" />
		<!-- Google Fonts-->
		<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
		<!--自定义-->
		<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/task-manage.css">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/css/common.css" />
		<style>
			.page-nav {
				width: auto;
				text-align: center;
			}
			.qrcode-btn {
				display: block;
				width: 100%;
				font-size: 16px;
			}
			
			.qrcode-tc {
				width: 500px;
				height: 500px;
				position: fixed;
				left: 50%;
				top: 50%;
				margin: -250px 0 0 -250px;
				background-color: #fff;
				z-index: 1000;
				display: flex;
				align-items: center;
				justify-content: center;
				display: none;
			}
			
			.qrcode-tc.on {
				display: flex;
			}
			
			.qrcode-tc .qrcode-img {
				width: 400px;
				height: 400px;
			}
			
			.qrcode-tc .qrcode-img img {
				width: 100%;
				height: 100%;
			}
			
			.zzc {
				width: 100%;
				height: 100%;
				position: fixed;
				left: 0;
				top: 0;
				background: rgba(0, 0, 0, 0.5);
				z-index: 999;
				display: none;
			}
			
			.meeting-detail,.meeting-modify {
				width: 60vw;
				height: 40vw;
				border: 3px solid palegoldenrod;
				position: fixed;
				top: 50%;
				left: 50%;
				margin: -20vw 0 0 -30vw;
				z-index: 1000;
				display: none;
				background-color: #fff;
				border-radius: 4vw;
				overflow: hidden;
				padding: 3vw 0;
			}
			
			.meeting-detail .box {
				width: 60vw;
				height: 40vw;
				min-width: 600px;
				padding: 0 3vw;
			}
			.meeting-detail.on,.meeting-modify.on{
				display: block;
			}
			.meeting-detail h2{
				font-size: 14px;
				color: #999;
				font-weight: 600;
				margin-bottom:5px ;
			}
			.participant-table {
				height: 35vw;
				position: relative;
				overflow-x: hidden;
			}
			
			.participant-table>div{
				overflow-y: auto;
				position: absolute;
				left: 0;
				top: 50px;
				right: -25px;
				bottom: 0;
				padding-right: 25px;
			}
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
			#form input,#form select  {
				width: 400px;
			}
			input::-webkit-inner-spin-button,
			input::-webkit-outer-spin-button{
				-webkit-appearance: none!important;
			}
			.meeting-modify .box {
				position:absolute;
				left:0;
				right: -25px;
				top:0;
				bottom:0;
				overflow-y:scroll;
				padding:20px 0;
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
							<a href="#">会议管理</a>
						</li>
						<li class="active">会议任务管理</li>
					</ol>

				</div>
				<div id="page-inner">
					<div class="row">
						<div class="col-xs-12">
							<div class="panel panel-default">
								<div class="panel-body">
									<form class="form-horizontal" role="form">
										<div class="form-group col-md-4">
											<label for="meeting-num" class="col-sm-4 control-label">会议编号</label>
											<div class="col-sm-8">
												<input type="text" name="meetingNo" class="form-control text-center" id="meeting-num" />
											</div>
										</div>
										<div class="form-group col-md-4">
											<label for="meeting-type" class="col-sm-4 control-label">会议类型</label>
											<div class="col-sm-8">
												<select class="selectbox form-control" id="meeting-type" name="meeting-type">
													<optgroup label="group1">
														<option value="a" disabled selected>请选择...</option>
														<option value="b">bbb</option>
													</optgroup>
												</select>
											</div>
										</div>
										<div class="form-group col-md-4">
											<label for="meeting-title" class="col-sm-4 control-label">会议标题</label>
											<div class="col-sm-8">
												<input type="text" class="form-control text-center" id="meeting-title" name="meetingTitle">
											</div>
										</div>
										<button type="submit" class="btn btn-primary">确定搜索</button>
									</form>
									<div class="table-responsive">
										<table class="table table-striped table-bordered table-hover" id="meeting-table">
											<thead>
												<tr>
													<th>序号</th>
													<th>会议编号</th>
													<th>会议类别</th>
													<th>会议名称</th>
													<th>会议时间</th>
													<th>参会情况</th>
													<th>签到二维码</th>
													<th>操作</th>
												</tr>
											</thead>
										</table>
									</div>
									<nav aria-label="Page navigation" class="page-nav">
										<ul class="pagination">
										</ul>
									</nav>
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

		<!--QRcode tc-->
		<section class="qrcode-tc">
			<div class="qrcode-img">
				<img src="" />
			</div>
		</section>

		<!--meeting-detail-->
		<section class="meeting-detail">
			<div class="box">
				<div class="col-md-6 meeting-info">
					<h2>会议信息</h2>
					<p>会议编号：<span class="no"></span></p>
					<p>会议类别：<span class="type"></span></p>
					<p>会议名称：<span class="title"></span></p>
					<p>会议时间：<span class="time"></span></p>
					<p>会议状态：<span class="state"></span></p>
				</div>
				<div class="col-md-6 participant-table">
					<h2>参会情况</h2>
					<div class="table-responsive">
						<table class="table table-bordered table-hover">
							<thead>
								<tr>
									<th>参会院校</th>
									<th>是否到会</th>
									<th>参会人</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>中山大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广东外语外贸大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>华南理工大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>暨南大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr class="warning">
									<td>XXXX大学</td>
									<td></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广州大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>中山大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广东外语外贸大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>华南理工大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>暨南大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr class="warning">
									<td>XXXX大学</td>
									<td></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广州大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>中山大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广东外语外贸大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>华南理工大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>暨南大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr class="warning">
									<td>XXXX大学</td>
									<td></td>
									<td>陈xx、王xx</td>
								</tr>
								<tr>
									<td>广州大学</td>
									<td><span class="fa fa-check"></span></td>
									<td>陈xx、王xx</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</section>
		
		<!-- meeting-modify -->
		<section class="meeting-modify">
			<div class="box">
				<form class="form-horizontal" role="form" name="form2">
										<div class="form-group col-md-12">
											<label for="meeting-nper" class="col-sm-2 control-label">会议期数</label>
											<div class="col-sm-10 nper-box">
												<i class="fa fa-minus-circle nper-icon minus"></i>
												<input type="number" class="form-control" id="meeting-nper" name="meetingNo" oninput="this.value=this.value.length>2?this.value.substr(0,2):this.value;">
												<i class="fa fa-plus-circle nper-icon plus"></i>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="meetingTitle" class="col-sm-2 control-label">会议标题</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="meetingTitle" name="meetingTitle">
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="meetingTime" class="col-sm-2 control-label">会议时间</label>
											<div class="col-sm-10">
												<input type="datetime-local" class="form-control" id="meetingTime" name="meetingTime" >
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="meetingAddresses" class="col-sm-2 control-label">会议地址</label>
											<div class="col-sm-10">
												<input type="text" class="form-control" id="meetingAddresses" name="meetingAddresses" >
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="meetingTypeId" class="col-sm-2 control-label">会议类别</label>
											<div class="col-sm-10">
												<select class="selectbox form-control" id="meetingTypeId" name="meetingTypeId">
													<optgroup label="group1">
														<option value="1">aaa</option>
														<option value="2">bbb</option>
														<option value="3">ccc</option>
														<option value="4">ddd</option>
													</optgroup>
												</select>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label class="col-sm-2 control-label">高校类别</label>
											<div class="col-sm-10">
												<div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
													<input type="checkbox" id="checkbox-fa-light-1" value="1" name="coll-type">
													<label for="checkbox-fa-light-1">
                                              公办本科
                                            </label>
												</div>
												<div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
													<input type="checkbox" id="checkbox-fa-light-2" value="2" name="coll-type">
													<label for="checkbox-fa-light-2">
                                              民办本科
                                            </label>
												</div>
												<div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
													<input type="checkbox" id="checkbox-fa-light-3" value="3" name="coll-type">
													<label for="checkbox-fa-light-3">
                                              	公办高职
                                            </label>
												</div>
												<div class="checkbox3 checkbox-inline checkbox-check checkbox-light">
													<input type="checkbox" id="checkbox-fa-light-4" value="4" name="coll-type">
													<label for="checkbox-fa-light-4">
                                              	民办高职
                                            </label>
												</div>
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="enrollDeadline" class="col-sm-2 control-label">报名截止时间</label>
											<div class="col-sm-10">
												<input type="datetime-local" class="form-control" id="enrollDeadline" name="enrollDeadline" >
											</div>
										</div>
										<div class="form-group col-md-12">
											<label for="meetingContent" class="col-sm-2 control-label">会议内容</label>
											<div class="col-sm-10">
												<textarea class="form-control" name="meetingContent" id="meetingContent" rows="10"></textarea>
											</div>
										</div>
										
										
										<button type="submit" class="btn btn-primary col-md-offset-2 confirm-modify">修改会议</button>
									</form>
			</div>
		</section>
		
		<!--zzc-->
		<section class="zzc"></section>
		
		<!-- /. WRAPPER  -->
		<!-- JS Scripts-->
		<!-- jQuery Js -->
		<script src="${pageContext.request.contextPath }/assets/js/jquery-1.10.2.js"></script>
		<!-- Bootstrap Js -->
		<script src="${pageContext.request.contextPath }/assets/js/bootstrap.min.js"></script>

		<!-- Metis Menu Js -->
		<script src="${pageContext.request.contextPath }/assets/js/jquery.metisMenu.js"></script>
		<script src="${pageContext.request.contextPath }/assets/js/select2.full.min.js"></script>
		<script type="text/javascript">
			//全局会议列表
			let meeting_list = [];
			//加载列表
			function loadList(){
				let url = '${pageContext.request.contextPath }/admin/getAllMeetings';
				$.ajax({
					type:'POST',
					url:url,
					dataType:"json",
					success:function(list){
//						console.log(list);
						meeting_list = list.data;
						//生成table
						let list_num = meeting_list.length;
						let page_num = Math.ceil(list_num / 10);
						loadPage(1,list_num,meeting_list);
						//生成分页
						$('.pagination li').remove();
						let lis = '';
						let show_page = page_num > 7?7:page_num;//控制最大显示7页
						//首页
						lis +=  <li class="first-page">
												<a href="javascript:;" aria-label="first-page">
													首页
												</a>
											</li>`;
						//上一页
						lis += `<li class="prev">
												<a href="javascript:;" aria-label="Previous">
													<span aria-hidden="true">&laquo;</span>
												</a>
											</li>`;
						//中间页码
						for(let i=0;i<show_page;i++) {
							let active = i == 0? 'active':'';
							lis += `<li class="`+active+`" data-num="`+(i+1)+`">
												<a href="javascript:;">`+(i+1)+`</a>
										</li>`;
						}
						//下一页
						lis +=  `<li class="next">
												<a href="javascript:;" aria-label="Next">
													<span aria-hidden="true">&raquo;</span>
												</a>
											</li>`;
						//尾页
						lis +=  `<li class="last-page">
												<a href="javascript:;" aria-label="last-page">
													尾页
												</a>
											</li>`;
						$('.pagination').append(lis).on('click','li',function(){
							if($(this).index()!=0 && $(this).index() != (show_page+2) && $(this).index()!=1 && $(this).index() != (show_page+3)) { //数字页码
								//样式变化
								$(this).addClass('active').siblings().removeClass('active');
								//表格数据变化
								loadPage($(this).attr('data-num'),list_num,meeting_list);
							}else {//上一页下一页首页尾页
								if($(this).index()==0) {
									//跳至首页
									//样式变化
									$('.pagination li:nth-child(3)').addClass('active').siblings().removeClass('active');
									loadPage(1,list_num,meeting_list);
								}else if($(this).index() == (show_page+3)) {
									//跳至尾页
									//样式变化
									$('.pagination li:nth-child('+(show_page+2)+')').addClass('active').siblings().removeClass('active');
									loadPage(page_num,list_num,meeting_list);
								}else if($(this).index()==1){
									//上一页
									let cur_page = $(this).siblings('.active').attr('data-num')*1;
									if(cur_page != 1){
										$('.pagination li:nth-child('+(cur_page+1)+')').addClass('active').siblings().removeClass('active');
										loadPage(cur_page-1,list_num,meeting_list);
									}
								}else {
									//下一页
									let cur_page = $(this).siblings('.active').attr('data-num')*1;
									if(cur_page != page_num){
										$('.pagination li:nth-child('+(cur_page+3)+')').addClass('active').siblings().removeClass('active');
										loadPage(cur_page+1,list_num,meeting_list);
									}
								}
							}
						});
						
					}
				});
				
			}
			loadList();
			function loadPage(num,list_num,meeting_list) {
				num = num*1;
				let start_index = (num-1)*10;
				let end_index = (list_num < num*10) ? (list_num-1):(num*10-1);
				//清除原table
				$('#meeting-table tbody').remove();
				let tbody = $('<tbody>');
				let trs;
//				console.log(start_index + ',' + end_index);
				for(let i=start_index; i<(end_index+1); i++) {
					trs += `<tr data-mid="`+meeting_list[i].meetingid+`" index="`+i+`">
													<td>`+meeting_list[i].meetingid+`</td>
													<td>`+meeting_list[i].meetingno+`</td>
													<td>`+meeting_list[i].meetingtypeid+`</td>
													<td>`+meeting_list[i].meetingtitle+`</td>
													<td>`+meeting_list[i].meetingtime+`</td>
													<td>99/100</td>
													<td>
														<a href="javascript:;" class="qrcode-btn"><span class="fa fa-qrcode"></span></a>
													</td>
													<td>
														<a href="${pageContext.request.contextPath }/admin/doDeleteMeeting?meetingId=`+meeting_list[i].meetingid+`" class="cancel">删除</a>&nbsp;
														<a href="javascript:;" class="modify-btn">修改</a>&nbsp;
														<a href="javascript:;" class="show-detail">查看参会情况</a>
													</td>
									</tr>`;
				}
				tbody.append(trs);
				$('#meeting-table').append(tbody);
			};
			
			
			$(document).ready(function() {
				$(".selectbox").select2();
			});
			$('#main-menu>li:eq(4)>a').addClass('active-menu');
			//qrcode
			$('#meeting-table').on('click','.qrcode-btn',function() {
				let src = '${pageContext.request.contextPath }/QRCode/QRCode' + $(this).closest('tr').attr('data-mid')+'.png';
				console.log(src);
				$('.qrcode-img img').attr('src')
				$('.zzc').show();
				$('.qrcode-tc').addClass('on');
			});
			
			//zzc
			$('.zzc').click(function() {
				$('.zzc').hide();
				$('.qrcode-tc').add('.meeting-detail').add('.meeting-modify').removeClass('on');
			});

			//cancel meeting
			$('#meeting-table').on('click','.cancel',function() {
				if(!confirm('确认删除此会议？')) {
					return false;
				}
				let url = $(this).attr('href');
				$.ajax({
					type:'post',
					url:url,
					success:function(src){
						alert('删除成功');
						window.location.reload();
					}
				});
				return false;
			});

			//meeting detail
			$('#meeting-table').on('click','.show-detail',function() {
				$('.zzc').show();
				$('.meeting-detail').addClass('on');
				let index = $(this).closest('tr').attr('index');
				$('.meeting-info .no').text(meeting_list[index].meetingno);
				$('.meeting-info .type').text(meeting_list[index].meetingtypeid);
				$('.meeting-info .title').text(meeting_list[index].meetingtitle);
				let date_obj = new Date(meeting_list[index].meetingtime);
				let date_str = date_obj.toISOString().substr(0,16).replace('T',' ');
				$('.meeting-info .time').text(date_str);
				$('.meeting-info .state').text('完成');
//				let url = $(this).attr('href');
//				$.ajax({
//					type:'get',
//					url:url,
//					success:function(obj){
//						console.log(obj);
//					}
//				});
				return false;
			});
			
			
			//meeting modify
			$('#meeting-table').on('click','.modify-btn',function() {
				$('.zzc').show();
				$('.meeting-modify').addClass('on');
				let index = $(this).closest('tr').attr('index');
				console.log(meeting_list[index]);
				$('#meeting-nper').val(meeting_list[index].meetingno);
				$('#meetingTitle').val(meeting_list[index].meetingtitle);
				let date_obj = new Date(meeting_list[index].meetingtime);
				let date_str = date_obj.toISOString().substr(0,16);
				console.log(date_str);
				$('#meetingTime').val(date_str);
				$('#meetingAddresses').val(meeting_list[index].meetingaddresses);
				$('#meetingTypeId').val(meeting_list[index].meetingtypeid);
				date_obj = new Date(meeting_list[index].enrolldeadline);
				date_str = date_obj.toISOString().substr(0,16);
				$('#enrollDeadline').val(date_str);
				$('#meetingContent').val(meeting_list[index].meetingcontent);
				
				return false;
			});
			//confirm modify
			$('.confirm-modify').click(function(){
				if(confirm('确认修改？')) {
					document.form2.submit();
				}
			});
			
			
			//修改会议期数
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
		</script>

		<!-- Custom Js -->
		<script src="${pageContext.request.contextPath }/assets/js/custom-scripts.js"></script>
	</body>

</html>