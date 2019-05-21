 <!DOCTYPE html>
 <html>
<head>
<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=no,target-densitydpi=device-dpi">
<link rel="stylesheet" href="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.css">
<link rel="stylesheet" href="http://i.gtimg.cn/vipstyle/frozenui/2.0.0/css/frozen.css">
<link rel="stylesheet" href="css/css1.css">
</head>
<body>

<div data-role="page" id="search">
	<div class="ui-content" data-role="main">
		 <form>
			      <div id="inputarea">
			        <input type="search" name="search1" id="search1" placeholder="文档编号">
			        
			        <input type="search" name="search2" id="search2" placeholder="高校名称">
			       
			        <input type="search" name="search3" id="search3" placeholder="高校类别">
			      </div>
			      <div id="btnarea">
			      <input type="button" id="submit" data-inline="true" value="确定搜索" >
				  </div>
		</form>
	</div>
</div>

<div data-role="page" id="searchresult">
	<div class="ui-content" data-role="main" id="maincontent">
		<ul id="searchlist" class="ui-list ui-list-function ui-border-tb">
		    <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 <li class="ui-border-t ui-arrowlink">
		    	<a href="#eachdetail">
		        <div class="ui-list-info">
		            <h4 class="ui-nowrap">2018-1   党建工作台帐</h4>
		            <div id="lil-info">
		            	<div>
		            		 <p style="float: left;" class="ui-nowrap">党201801</p>
		            	</div>
		            	<div>
		            		 <p style="float: right;" class="ui-nowrap">2018-1-20</p>
		            	</div>
		            </div>	
		        </div>
		    	</a>
	    	</li>
	    	 

		</ul>
	</div>
</div>

<div data-role="page" id="eachdetail">
	<div class="ui-content" data-role="main">
		<div class="ui-field-contain">
			<h1>中山大学</h1>
		</div>
		<div id="passage">
			<h3>2018-1党建工作台账</h3>
			<p>djaskljdklas</p>	
		</div>
	</div>
</div>
<script src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script src="https://code.jquery.com/mobile/1.4.5/jquery.mobile-1.4.5.min.js"></script>
<script type="text/javascript">
	$("#submit").click(function(){
		$.mobile.changePage("#searchresult");
	})

	$(window).bind('resize load', function(){
	$("body").css("zoom", $(window).width() / 414);
	$("body").css("display" , "block");
	});  
</script>
</body>
</html>