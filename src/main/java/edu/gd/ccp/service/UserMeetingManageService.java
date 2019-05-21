package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingAttendees;
import edu.gd.ccp.entity.MeetingTask;
 
//高校用户会议报名、会议浏览
public interface UserMeetingManageService {
//	公告新闻管理

	// 增加于2018/11/23
	public List<Map> listAllMeeting(int offset, int limit,int organizationId, String attendanceState);
	
	public int getMeetingCount(int organizationId, String attendanceState);

	// 列出单个会议的详细情况
	public List<Map> listMeetingDetail(int taskId);
	
	
	// 增加于2018/11/25
	// 学校提交会议签到信息
	public void userMeetingSignature(int organizationId, int meetingId,int attendeeNumber, 
			String contacts, String Mobile, String email, String attendeesName);
	
	// 进入签到页面，填写签到信息
	public List<Map> getSignatureMessage(int organizationId, int meetingId);
	
	// 由meetingId 列出会议信息
	public List<Meeting> getMeetingMessageByMeetingId(int meetingId);
	//获取会议报名任务
	MeetingTask selectByPrimaryKey(Integer taskid);
	
	 //根据任务id获取报名情况
	 List<MeetingAttendees> getMeetAttendeesByTaskId(Integer meetingTaskId);
      //报名
	 int insertSelective(MeetingAttendees record);
	 //更新会议任务状态
	 int updateByPrimaryKeySelective(MeetingTask record);
	 //删除报名
	 int deleteByPrimaryKey(Integer attendeeid);
}
