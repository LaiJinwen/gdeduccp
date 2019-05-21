<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/mobile/css/css4.css">
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery-1.11.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/mobile/css/jquery.mobile-1.4.5.min.js"></script>	
	<script type="text/javascript">
		$(window).bind('resize load', function(){
		$("body").css("zoom", $(window).width() / 414);
		$("body").css("display" , "block");
		}); 
	</script>
<script type="text/javascript">
function setHeight(nextPage) {
    var screen = $.mobile.getScreenHeight();
    var header = nextPage.children(".ui-header").hasClass("ui-header-fixed") ? nextPage.children(".ui-header").outerHeight() - 1 : nextPage.children(".ui-header").outerHeight();
    var footer = nextPage.children(".ui-footer").hasClass("ui-footer-fixed") ? nextPage.children(".ui-footer").outerHeight() - 1 : nextPage.children(".ui-footer").outerHeight()
    var contentCurrent = nextPage.children(".ui-content").outerHeight() - nextPage.children(".ui-content").height();
    var content = screen - header - footer - contentCurrent;
    nextPage.children(".ui-content").height(content);
}

/// 初始化高度设置函数.
function initHeightSetting(yourFirstPageId) {
    // 这段代码在初始化的时候执行.设置第一个页面的高度
    setHeight($(yourFirstPageId));

    // 在页面显示前会执行下面代码.设置高度
    $( "body" ).on( "pagecontainershow", function( event, ui ) {
        var nextPage = $(ui.toPage[0]);
        setHeight(nextPage);
    });
}
initHeightSetting(success);
</script>	
</head>
<body>
	<div data-role="page" id="success">
		<div class="ui-content" data-role="main">
			<div id="outcometitlediv">
				<h1>
				 投票系统				
				</h1>
			</div>
			<div id="outcomediv">
				<p>${msg}</p>
				<p></p>
			</div>			
		</div>
		<div id="footer"  data-position="fixed">
			<img src="${pageContext.request.contextPath}/assets/img/paint.png">
		</div>
	</div>
</body>

</html>