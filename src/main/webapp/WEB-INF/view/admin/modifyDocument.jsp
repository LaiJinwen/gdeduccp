<%@ page language="java" import="com.zhuozhengsoft.pageoffice.*" %>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<body>
<h2>文档上报列表</h2>

					<c:forEach var="doc" items="${docs}" begin="0" end ="5">
									<h3>
										<c:out value="${doc.documentTaskId}"></c:out>
                                        <c:out value="${doc.title}"></c:out>
									</h3>
					</c:forEach>
</body>
</html>
