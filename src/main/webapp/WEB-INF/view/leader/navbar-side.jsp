<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar-default navbar-side" role="navigation">
	<div class="sidebar-collapse">
		<ul class="nav" id="main-menu">
			<li>
				<a href="#">系统功能菜单</a>
			</li>
			<li>
				<a href="#">文档任务管理<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoDocumentPublish.do">发布文档任务</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/documentTaskManage">文档任务管理</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/documentList">文档审核修订</a>
					</li>
                            <li>
                                <a href="${pageContext.request.contextPath}/leader/documentSearch">文档提交查询</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/leader/documentStatBySchool">文档提交统计</a>
                            </li>  					
				</ul>
			</li>

			<li>
				<a href="#">会议投票管理<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoPublishMeeting">发布会议</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoManageMeeting.do">会议维护</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/meetingStatBySchool">会议统计</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/vote/goToPublishVoteTask">发布投票</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/vote/voteTaskList">投票管理</a>
					</li>					
				</ul>
			</li>

			
			<li>
				<a href="#">用户信息管理<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoAddUserAccount">增加用户</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoUserList">账户维护</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoAddOrganization">添加单位</a>
					</li>							
					<li>
						<a href="${pageContext.request.contextPath}/admin/intoOrganizationList">单位维护</a>
					</li>					
					
					
				</ul>
			</li>

			<li>
				<a href="#">互动消息管理<span class="fa arrow"></span></a>
				  <ul class="nav nav-second-level">
					<li>
						<a href="${pageContext.request.contextPath}/adminMessage/intoSendingMessage.do">发送消息</a>
					</li>
					<li>
						<a href="${pageContext.request.contextPath}/adminMessage/intoMessageList.do">消息列表</a>
					</li>
				</ul>
				
			</li>

		</ul>

	</div>
</nav>