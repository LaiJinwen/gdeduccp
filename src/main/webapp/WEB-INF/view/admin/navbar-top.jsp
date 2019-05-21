<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<nav class="navbar navbar-default top-navbar" role="navigation">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
               </button>

		<div id="sideNav" href="">
			<i>
			<span></span>
			<span></span>
			<span></span>
			</i>
		</div>
		<a class="navbar-brand" href="#"><strong><i class="logo"></i>广东省高校党建工作信息管理系统</strong></a>
	</div>

	<ul class="nav navbar-top-links navbar-right">
		<span class="welcome-msg">欢迎您！${userName}</span>
		                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" aria-expanded="false">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#" onclick="showDialog('${pageContext.request.contextPath}/intoUserInfo.do')"><i class="fa fa-user fa-fw"></i> 资料修改</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i>退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
		<!-- /.dropdown -->
	</ul>
</nav>
<SCRIPT> 
function showDialog(url) {
	  var iWidth=1200; //窗口宽度
	  var iHeight=900;//窗口高度
	  var iTop=10;//(window.screen.height-iHeight)/2;
	  var iLeft=(window.screen.width-iWidth)/2;
	  window.open(url,"_blank","Scrollbars=yes,Toolbar=no,titlebar=no,Location=no,help=0,status=no,Direction=no,Resizeable=no, Width="+iWidth+" ,Height="+iHeight+",top="+iTop+",left="+iLeft);
	 }
</SCRIPT>