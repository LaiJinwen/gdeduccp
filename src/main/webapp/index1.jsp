<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



	
<script type="text/javascript" src="/gdeduccp/js/jquery.min.js"></script>
<script type="text/javascript" src="pageoffice.js" id="po_js_main"></script>

<!DOCTYPE html>
<html>
<body>
<h2>Hello World!</h2>

<a href="<%=PageOfficeLink.openWindow(request, "pageoffice/Word.jsp?id=12","width=800px;height=800px;")%>">open</a>
</body>
</html>
