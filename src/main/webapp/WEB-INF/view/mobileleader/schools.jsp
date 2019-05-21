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
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css1.css">
<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
<script
	src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
<script  type="text/javascript">
	
</script>

</head>

<body>
	
	<c:forEach var="school" items="${schools}">
    <ul class="ui-list ui-list-function ui-border-tb">
	    <li class="ui-border-t ui-arrowlink" >
        <div class="ui-list-info">
            <a href="${pageContext.request.contextPath}/mobileleader/schoolDocuments?organizationId=${school.organizationid}">
            <h4 class="ui-nowrap">${school.organizationname}</h4>
            </a>
        </div>
    	</li>
	</ul>
	</c:forEach>
</body>
</html>
