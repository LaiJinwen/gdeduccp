<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/frozen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css1.css">
<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
<script  type="text/javascript">
	
</script>

</head>

<body>
	
	
<ul class="ui-list ui-list-function ui-border-tb">
	    <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=公办&schoolLevel=本科院校">
            <h4 class="ui-nowrap">公办本科</h4>
            </a>
        </div>
    	</li>
	</ul>
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=民办&schoolLevel=本科院校">
            <h4 class="ui-nowrap">民办本科</h4>
            </a>
        </div>
    	</li>
	</ul>
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=合作办学&schoolLevel=本科院校">
            <h4 class="ui-nowrap">合作办学</h4>
            </a>
        </div>
    	</li>
	</ul>
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=独立学院&schoolLevel=本科院校">
            <h4 class="ui-nowrap">独立学院</h4>
            </a>
        </div>
    	</li>
	</ul>		
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
              <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=公办&schoolLevel=专科院校">
            <h4 class="ui-nowrap">公办高职</h4>
            </a>
        </div>
    	</li>
	</ul>
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
              <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?organizationType=民办&schoolLevel=专科院校">
            <h4 class="ui-nowrap">民办高职</h4>
            </a>
        </div>
    	</li>
	</ul>
<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
              <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?schoolLevel=成人高校">
            <h4 class="ui-nowrap">成人高校</h4>
            </a>
        </div>
    	</li>
	</ul>	
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/getSchoolsByTypes?schoolLevel=教育工委">
            <h4 class="ui-nowrap">教育工委</h4>
            </a>
        </div>
    	</li>
	</ul>
	<ul class="ui-list ui-list-function ui-border-tb">
	 <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/schools">
            <h4 class="ui-nowrap">所有学校</h4>
            </a>
        </div>
    	</li>
	</ul>				
</body>
</html>
