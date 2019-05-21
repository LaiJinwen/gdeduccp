<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>广东教育工委党建</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.css" />
<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
<script
	src="http://code.jquery.com/mobile/1.1.0/jquery.mobile-1.1.0.min.js"></script>
</head>
<body>
<!-- Start of first page -->
<div data-role="page" id="foo">

	<div data-role="header">
		<h1>Foo</h1>
	</div><!-- /header -->

	<div data-role="content">	
		<p>据《韩国时报》12日报道，韩国外长康京和日前表示，韩外交部正同有关部门就是否解除禁止韩朝经济合作的“5·24措施”进行讨论。康京和的表态迅速引起特朗普关注，他11日就此回应称，“未经美国批准，韩国不能取消对朝制裁!”这一言论立即点燃韩国朝野的怒火。有批评声音认为，国家间一般会使用“协调”“协商”等措辞，在平等的国家关系中，几乎不会出现上下级间使用的“批准”。特朗普对韩国使用这样的词汇，不仅体现出他对盟友居高临下的态度，还有无视盟国主权之嫌。韩国外交界普遍认为，即使考虑到特朗普独特的行事风格，称盟国的政策为需要“批准”的对象也十分罕见，非常失礼。韩国一位前外交官称，在其数十年的职业生涯中，第一次看到有美国总统使用此类表述，这让外界无法弄清美国究竟如何看待韩国。韩媒评论认为，特朗普此番“过激言论”似乎说明其对韩国缺乏信赖，特别担心韩国在对朝议题上“超速”。韩国《每日经济》称，已有韩国官员要求当局对特朗普这种侵害别国国家主权的行为给予强烈抗议。而针对特朗普对制裁的强硬表态，朝鲜《劳动新闻》12日称，就算面对100年的制裁，朝鲜也能凭自身能力生存下去。.</p>		
		<p>View internal page called <a href="#bar">bar</a></p>	
	</div><!-- /content -->

	<div data-role="footer">
		<h4>Page Footer</h4>
	</div><!-- /footer -->
</div><!-- /page -->


<!-- Start of second page -->
<div data-role="page" id="bar">

	<div data-role="header">
		<h1>Bar</h1>
	</div><!-- /header -->

	<div data-role="content">	
		<p>I'm the second in the source order so I'm hidden when the page loads. I'm just shown if a link that references my ID is beeing clicked.</p>		
		<p><a href="#foo">Back to foo</a></p>	
	</div><!-- /content -->

	<div data-role="footer">
						<div data-role="navbar" data-iconpos="top">
					<ul>
						<li><a href="#" data-icon="search">查询</a></li>
						<li><a href="#"data-icon="info">统计</a></li>
                        <li><a href="#"data-icon="gear">设置</a></li>
					</ul>
	</div>
				<!-- /navbar -->

	</div><!-- /footer -->
</div><!-- /page -->

</body>
</html>