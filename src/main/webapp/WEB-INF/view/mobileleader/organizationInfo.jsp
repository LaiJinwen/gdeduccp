<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css1.css">
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>

<script>
	$(document).ready(function(){
	$('#headnavbar li a').click(function () {
		$(this).removeClass('noactive');
		$(this).addClass('active');
        $('#headnavbar li a').not(this).removeClass('active');
        $('#headnavbar li a').not(this).addClass('noactive');
		})
	});

	$(window).bind('resize load', function(){
	$("body").css("zoom", $(window).width() / 414);
	$("body").css("display" , "block");
	});         
</script>

</head>
<body>
 <div data-role="page" id="indexUser">
	<div data-role="main" class="ui-content">
		<div id="infodiv">
			<ul data-role="listview" data-inset="true">
		      <li>
		      <c:if test="${organization.organizationtype=='公办'}">
		        <img id="photo" src="${pageContext.request.contextPath}/assets/mobile/img/9.png">
		        </c:if>
		      <c:if test="${organization.organizationtype=='民办'}">
		        <img id="photo" src="${pageContext.request.contextPath}/assets/mobile/img/66.png">
		        </c:if>		        
		        <h1 id="name">${organization.organizationname}</h1>
		        <p id="introduction">${organization.organizationno}</p>
 		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			主管部门：${organization.supervisordepartment}
		      		</p>
		      		</div>
		      	</li>
		      	<li>	
		      	<div>
		      		<p class="li-maininfo"  >
		      			主管属性：${organization.supervisortype}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			组织关系：${organization.belong}
		      		</p>
			      		</div>
		      	</li>
		      	<li>	
		      	<div>
		      		<p class="li-maininfo" id="duty">
		      			学校层次：${organization.schoollevel}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			学校类型：${organization.organizationtype}
		      		</p>
		      		</div>
		      	</li>
		      	<li>	
		      	<div>
		      		<p class="li-maininfo" id="gender">
		      			学校地址：${organization.address}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			电话号码：${organization.telephone}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			学生人数：${organization.numberofstudent}
		      		</p>
		      	</div>
		      </li>
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			学生党员：${organization.numberofstudentpartymember}
		      		</p>
		      	</div>
		      </li>		      
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			教工人数：${organization.numberofteacher}
		      		</p>
		      	</div>
		      </li>
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			教工党员：${organization.numberofteacherpartymember}
		      		</p>
		      	</div>
		      </li>		      		      
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			退休党员：${organization.numberofretirepartymember}
		      		</p>
		      	</div>
		      </li>

		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			二级党组织：${organization.numberofsecondpartyorganization}
		      		</p>
		      	</div>
		      </li>
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			教工党支部：${organization.numberofteacherpartybranch}
		      		</p>
		      	</div>
		      </li>
		      <li>
		      	<div>
		      		<p class="li-subtitle">
		      			学生党支部：${organization.numberofstudentpartybranch}
		      		</p>
		      	</div>
		      </li>
		      		      		      		      
    		</ul>
		</div>
	</div>
  
</div>
</body>
</html>