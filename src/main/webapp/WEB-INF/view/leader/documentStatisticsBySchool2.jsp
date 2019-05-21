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
	 
	
 
<!-- /. NAV SIDE  -->
 
 

	<div id="page-inner">

			<div class="row">
				<div class="col-xs-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<div class="panel-body">
							 

							</div>
							<div class="row">
								<div class="col-sm-12 col-xs-12">
									<div class="table-responsive text-center">
										<div id="main" style="width: 600px; height: 400px;"></div>
									</div>
								</div>
							</div>
							<div class="col-md-8">
							<div class="table-responsive text-center">
								<table class="table table-striped table-bordered table-hover">
									<thead>
										<tr>
											<th class="text-center">序号</th>
											<th class="text-center">文档名称</th>
											<th class="text-center">文档编号</th>
											<th class="text-center">文档状态</th>
											<th class="text-center">提交时间</th>

										</tr>
									</thead>
									<tbody>
									 
										<c:set var="recno" value="${(docs.currPage-1)*docs.pageSize}" />
										<c:forEach var="doc" items="${documents}">
									 
											<tr>
												<c:set var="recno" value="${recno+1}" />
												<td> ${recno}</td>
												<td>${doc.title}</td>
												<td>${doc.documentno}</td>
												<td>${doc.documentstate}</td>
												<td>${doc.submitdate}</td>
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
		<footer>
			<p>广东省教育工委.</p>
		</footer>
	</div>
	<!-- /. PAGE INNER  -->

<!-- /. PAGE WRAPPER  -->
 
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

        option = {
        	    title : {
        	        text: '${doc_counts.organizationName}',
        	        subtext: '',
        	        x:'center'
        	    },
        	    tooltip : {
        	        trigger: 'item',
        	        formatter: "{a} <br/>{b} : {c} ({d}%)"
        	    },
        	    legend: {
        	        orient : 'vertical',
        	        x : 'left',
        	        data:['已提交数','未提交数']
        	    },
        	    toolbox: {
        	        show : true,
        	        feature : {
        	            mark : {show: true},
        	            dataView : {show: true, readOnly: false},
        	            magicType : {
        	                show: true, 
        	                type: ['pie', 'funnel'],
        	                option: {
        	                    funnel: {
        	                        x: '25%',
        	                        width: '50%',
        	                        funnelAlign: 'left',
        	                        max: 1548
        	                    }
        	                }
        	            },
        	            restore : {show: true},
        	            saveAsImage : {show: true}
        	        }
        	    },
        	    calculable : true,
        	    series : [
        	        {
        	            name:'文档提交情况',
        	            type:'pie',
        	            radius : '55%',
        	            center: ['50%', '60%'],
        	            data:[
        	                {value:${doc_counts.count1}, name:'已提交数'},
        	                {value:${doc_counts.count2}, name:'未提交数'},
  
        	            ]
        	        }
        	    ]
        	};       
           // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
</body>
</html>