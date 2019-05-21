<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">

                    <li>
                        <a href="#"  class="active-menu"><i class="fa fa-dashboard"></i>功能模块</a>
                    </li>

                    <li>
                       <a href="<%=request.getContextPath() %>/school/listAllDocument.do"><i class="fa fa-file"></i>文档管理<span class="badge pull-right">${documentNums}</span></a>
                    
                    </li>

                    <li>
                        <a href="<%=request.getContextPath() %>/schoolMeeting/listMeeting.do"><i class="fa fa-sitemap"></i>会议管理<span class="badge pull-right">${meetingNums}</span> </a>
                    </li>
                     <li>
                        <a href="<%=request.getContextPath() %>/vote/intoWebVoteTaskListUi"><i class="fa fa-thumbs-up"></i>投票管理<span class="badge pull-right">${unvoteTaskNum}</span></a>
                    </li>
                     <li>
                        <a href="<%=request.getContextPath() %>/schoolMessage/intoMessageList"><i class="fa fa-comments"></i>消息列表<span class="badge pull-right">${unReadMsg}</span></a>
                    </li>
                       <li>
                        <a href="<%=request.getContextPath() %>/schoolMessage/intoSendingMessage.do"><i class="fa fa-comment-o"></i>发送消息&nbsp;&nbsp;&nbsp;&nbsp;</a>
                    </li>

                </ul>

            </div>

        </nav>
        <!-- /. NAV SIDE  -->