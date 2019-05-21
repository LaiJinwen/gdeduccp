<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/assets/mobile/css/frozen.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css1.css">

</head>

<body>
	<c:set var="recno" value="1" />
	<c:forEach var="doc" items="${docCounts}">
		<c:set var="recno" value="${recno+1}" />
		<ul id="doclist" class="ui-list ui-list-function ui-border-tb">
			<li class="ui-border-t">
				<div id="listitem" class="ui-list-info">
					<div class="ui-row-flex ui-whitespace">

						<div id="div1">
							<div id="imagediv">
								<img src="${pageContext.request.contextPath}/assets/mobile/img/docs.png">
							</div>
							<div id="namediv">
								<p>
								 <a href="${pageContext.request.contextPath}/mobileleader/schoolDocumentStat?organizationId=${doc.organizationId}">
								  ${doc.organizationName}
								 </a>
								</p>
							</div>
						</div>
						<div id="progressdiv">
							<div class="ui-row-flex ui-whitespace ui-row-flex-ver">
								<div>
									<p>完成度：${doc.count1}/${doc.count1+doc.count2}</p>
								</div>
								<div>
									<div id="progressbar" class="ui-progress">
										<span style="width: ${doc.count1*100.0/(doc.count1+doc.count2)}%"></span>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</li>
		</ul>
	</c:forEach>
	
		<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>
	
  
</body>
</html>
