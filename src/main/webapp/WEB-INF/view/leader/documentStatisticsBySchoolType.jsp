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
		<title>文档统计</title>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/js/Lightweight-Chart/cssCharts.css">
	</head>
	<body>
	 <div id="wrapper">
		<%@ include file="navbar-top.jsp" %>
			<!-- /. NAV TOP  -->
			<%@ include file="navbar-side.jsp" %>
			<!-- /. NAV SIDE  -->
 
<!-- /. NAV SIDE  -->
<div id="page-wrapper">
	<div class="header" style="margin-top:10px;">
	 
		<ol class="breadcrumb">
			<li>文档任务管理</li>
			<li>文档搜索</li>
		</ol>

	</div>

	<div id="page-inner">

			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
							<form role="form" class="form-inline" name="form1"
			                                                   action="${pageContext.request.contextPath}/leader/documentStatBySchoolType" method="post">
								<div class="form-group">
									<label for="exampleInputName2">文档编号</label> 
									<input type="text"	class="form-control"  name="documentNo"
										value="${documentCondition.documentNo}" placeholder="文档编号">
									<button type="submit" class="btn btn-primary">确定查询</button>
								</div>
	                             </form>

							</div>
							<div class="row">
								<div class="col-sm-12 col-xs-12">
									<div class="table-responsive text-center">
										<div id="main" style="width: 600px; height: 400px;"></div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">高校类别</th>
											<th class="text-center">提交数量</th>
											<th class="text-center">未交数量</th>
											<th class="text-center">提交比例</th>

										</tr>
									</thead>
									<tbody>
										<c:set var="titles" value="" />
										<c:set var="datas1" value="" />
										<c:set var="datas2" value="" />
										<c:set var="total1" value="0" />
										<c:set var="total2" value="0" />
										<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${docCounts}">
											<c:set var="titles"
												value="${titles},'${doc.organizationType}'" />
											<c:set var="datas1" value="${datas1},${doc.count1}" />
											<c:set var="total1" value="${total1+doc.count1}" />
											<c:set var="total2" value="${total2+doc.count2}" />
											<tr>
												<c:set var="recno" value="${recno+1}" />
												<td>${recno}</td>
												<td>${doc.organizationType}</td>
												<td>${doc.count1}</td>
												<td><c:if test="${doc.count2>0}">
														<font color="red"> ${doc.count2}</font>
													</c:if></td>
												<td><fmt:formatNumber type="number"
														value="${doc.count1/(doc.count1+doc.count2)*100}"
														pattern="0.00" maxFractionDigits="2" />%</td>
											</tr>
										</c:forEach>
										<tr>
											<td>${recno}</td>
											<td>汇总</td>
											<td>${total1}</td>
											<td>${total2}</td>
											<td><fmt:formatNumber type="number"
													value="${total1/(total1+total2)*100}" pattern="0.00"
													maxFractionDigits="2" />%</td>
										</tr>
										<c:set var="datas1" value="${fn:substring(datas1,1,-1)}" />

										<c:set var="titles" value="${fn:substring(titles,1,-1)}" />
									</tbody>
								</table>
							</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		<footer>
			<p>广东省教育工委.</p>
		</footer>
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
        	        text: '各类高校提交文档数',
        	        subtext: '数量'
        	    },
        	    tooltip : {
        	        trigger: 'axis'
        	    },
        	    legend: {
        	        data:['提交数','未交数']
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
        	            data : [${xtitles}]
        	        }
        	    ],
        	    yAxis : [
        	        {
        	            type : 'value'
        	        }
        	    ],
        	    series : [
        	        {
        	            name:'提交数',
        	            type:'bar',
        	            data:[${ycount1}],

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
        	        },
        	        {
        	            name:'未交数',
        	            type:'bar',
        	            data:[${ycount2}],
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
        	                    
        	                ]
        	            }
        	        }
        	    ]
        	};
           // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>