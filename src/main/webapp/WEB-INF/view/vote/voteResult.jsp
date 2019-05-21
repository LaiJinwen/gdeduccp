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
<title>投票统计</title>
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

		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div class="header">
				<h1 class="page-header"></h1>
				<ol class="breadcrumb">
					<li>投票管理</li>
					<li>投票结果</li>
				</ol>

			</div>

			<div id="page-inner">

				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<p>共收到${count}张投票，应投${voteCount.count1}票，尚有${voteCount.count2}票未投</p>
								<br>
								<div class="row">
									<div class="col-sm-12 col-xs-12">
										<div class="table-responsive text-center">
											<div id="main" style="width: 600px; height: 400px;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-xs-12">
						<div class="panel panel-default">
							<div class="panel-body">
								<div class="table-responsive text-center">
									<div class="row">
										<div class="col-sm-6 col-xs-6">
										<div align="left">
											<form role="form" class="form-inline" name="form1" id="form1"
			action="${pageContext.request.contextPath}/vote/voteRemind?votetaskid=${param.votetaskid}" method="post">
										<button type="button"   class="btn btn-primary" onclick='remind()'>投票提醒</button>
										</form>
										</div>
											<table class="table table-striped table-bordered table-hover">
												<thead>
													<tr>
														<th class="text-center">序号</th>
														<th class="text-center">高校名称</th>
														<th class="text-center">投票状态</th>
													</tr>
												</thead>
												<tbody>

													<c:set var="recno" value="0" />
													<c:forEach var="voter" items="${voterList}">

														<tr>
															<c:set var="recno" value="${recno+1}" />
															<td>${recno}</td>
															<td>${voter.organizationName}</td>
															<td>
															 
												<c:if test="${voteCount.count1/2 > voteCount.count2  }">			
											     <c:if test="${voter.voterState == '未投'}">
												      <font color="red">未投</font>
											     </c:if>
											     <c:if test="${voter.voterState == '已投'}">
												      已投
											     </c:if>
											     </c:if>
											     <c:if test="${voteCount.count1/2 <= voteCount.count2  }">	
											        未投过半，隐藏状态
											     </c:if>
															</td>

														</tr>
													</c:forEach>

												</tbody>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /. PAGE INNER  -->
		</div>
		<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script src="/gdeduccp/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script src="/gdeduccp/assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script src="/gdeduccp/assets/js/jquery.metisMenu.js"></script>
	<script src="/gdeduccp/assets/js/select2.full.min.js"></script>

	<!-- Custom Js -->
	<script src="/gdeduccp/assets/js/custom-scripts.js"></script>


	<script>
function goToPage(page){
	document.getElementById("page").value=page;
	document.form1.submit();
}
</script>

	<!-- 引入 echarts.js -->
	<script src="/gdeduccp/assets/js/echarts.min.js"></script>
	<script src="/gdeduccp/assets/echart/echarts.min.js"></script>
	<script>
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
         option = {
        	    title : {
        	        text: '投票结果',
        	        subtext: ''
        	    },
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['票数']
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            magicType : {show: true, type: ['line', 'bar']},
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    calculable : true,
        	    xAxis : [
        	        {
        	            type : 'category',
        	            data : [${titles}]
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value'
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'得票数',
        	            type:'bar',
        	            data:[${count1}],

						itemStyle: {
							normal: {
								label: {
									show: true, //开启显示
									position: 'top', //在上方显示
									textStyle: { //数值样式
										color: 'black',
										fontSize: 16
								 	       }
								       }
        	                        }
        	                       },      	            
        	            markPoint : {
        	                data : [

        	                ]
        	            },
        	            markLine : {
        	                data : [
        	                    {type : 'max', name: '最高值'}
        	                ]
        	            }
        	        }
        	    ]
        	};
           // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
    
    <script>
function remind(){
	 MaskUtil.mask();
	 document.getElementById('form1').submit()
}

 
	var MaskUtil = (function(){
		var $mask,$maskMsg;
		var defMsg = '正在执行任务，请耐心等待完成...';
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