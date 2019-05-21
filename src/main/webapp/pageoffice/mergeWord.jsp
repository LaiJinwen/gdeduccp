<%@ page language="java"
	import="java.util.*,com.zhuozhengsoft.pageoffice.*,com.zhuozhengsoft.pageoffice.wordwriter.*"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.pageoffice.cn" prefix="po"%>
<%
	PageOfficeCtrl poCtrl = new PageOfficeCtrl(request);
	//设置服务器页面
	poCtrl.setServerPage(request.getContextPath() + "/poserver.zz");
	poCtrl.addCustomToolButton("保存", "Save()", 1);
	poCtrl.addCustomToolButton("打印", "PrintFile()", 6);
	poCtrl.addCustomToolButton("全屏/还原", "IsFullScreen()", 4);
	poCtrl.addCustomToolButton("关闭", "CloseFile()", 21);
	//设置保存页面
	poCtrl.setSaveFilePage("SaveFile.jsp");
	//打开Word文档
	poCtrl.webOpen("/gdeduccp/doc/test.doc", OpenModeType.docNormalEdit, "张佚名");
%>
<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>选项卡</title>
<style type="text/css">
/* CSS样式制作 */
* {
	padding: 0px;
	margin: 0px;
}

a {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: #336699;
}

#tab {
	width: auto;
	padding: 5px;
	height: 150px;
	margin: 20px;
}

#tab ul {
	list-style: none;
	height: 30px;
	line-height: 30px;
	border-bottom: 2px #C88 solid;
}

#tab ul li {
	background: #FFF;
	cursor: pointer;
	float: left;
	list-style: none height:29px;
	line-height: 29px;
	padding: 0px 10px;
	margin: 0px 3px;
	border: 1px solid #BBB;
	border-bottom: 2px solid #C88;
}

#tab ul li.on {
	border-top: 2px solid Saddlebrown;
	border-bottom: 2px solid #FFF;
}

#tab div {
	height: 700px;
	width: auto;
	line-height: 24px;
	border-top: none;
	padding: 1px;
	border: 1px solid #336699;
	padding: 10px;
}

.hide {
	display: none;
}

.show {
	display: block;
}

.page {
	
}
</style>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript">
	// JS实现选项卡切换
	window.onload = function() {
		var myTab = document.getElementById("tab"); //整个div
		var myUl = myTab.getElementsByTagName("ul")[0]; //一个节点
		var myLi = myUl.getElementsByTagName("li"); //数组
		var myDiv = $(".page"); //myTab.getElementsByTagName("div"); //数组

		for (var i = 0; i < myLi.length; i++) {
			myLi[i].index = i;
			myLi[i].onclick = function() {
				for (var j = 0; j < myLi.length; j++) {
					myLi[j].className = "off";
					myDiv[j].className = "hide";
				}
				this.className = "on";
				myDiv[this.index].className = "show";
			}
		}
	}
</script>

</head>
<body>

	<script type="text/javascript">
		function Save() {
			document.getElementById("PageOfficeCtrl1").WebSave();

		}
		function PrintFile() {
			document.getElementById("PageOfficeCtrl1").ShowDialog(4);

		}
		function IsFullScreen() {
			document.getElementById("PageOfficeCtrl1").FullScreen = !document
					.getElementById("PageOfficeCtrl1").FullScreen;

		}
		function CloseFile() {
			window.external.close();

		}
	</script>

	<div
		style="text-align: center; margin: 10px; background-color: #D19275; color: White; padding: 8px;">
		<h1>某某Web办公系统</h1>
	</div>
	<!-- HTML页面布局 -->
	<%
		WordDocument doc = new WordDocument();
		DataRegion dr1 = doc.createDataRegion("PO_dr1", DataRegionInsertType.After, "[End]");
		dr1.setValue("[Word]doc/1.doc[/Word]");
		DataRegion dr2 = doc.createDataRegion("PO_dr2", DataRegionInsertType.After, "[End]");
		dr2.setValue("[Word]doc/2.doc[/Word]");
		DataRegion dr3 = doc.createDataRegion("PO_dr3", DataRegionInsertType.After, "[End]");
		dr3.setValue("[Word]doc/3.doc[/Word]");

		poCtrl.setWriter(doc);
		//打开文件

		poCtrl.webOpen("doc/test1.doc", OpenModeType.docNormalEdit, "张三");

		poCtrl.setTagId("PageOfficeCtrl1"); //此行必须
	%>
</body>
</html>

