package edu.gd.ccp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.MeetingAttendeesMapper;
import edu.gd.ccp.dao.MeetingMapper;
import edu.gd.ccp.dao.MeetingTaskMapper;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingAttendees;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.service.UserMeetingManageService;

@Service("userMeetingManageService")
public class UserMeetingManageServiceImpl implements UserMeetingManageService{
	@Autowired
	private MeetingTaskMapper meetingTaskMapper;
	@Autowired
	private MeetingMapper meetingMapper;
	@Autowired
	private MeetingAttendeesMapper meetingAttendeesMapper;	
	// 增加于2018/11/23
	@Override
	public List<Map> listAllMeeting(int offset, int limit,int organizationId, String attendanceState) {
		// 列出所有会议
		return meetingTaskMapper.listAllMeetingByOrganizationId(offset, limit, organizationId, attendanceState);
	}

	@Override
	public int getMeetingCount(int organizationId, String attendanceState) {
		// 分页所需，统计该组织的会议数量
		return meetingTaskMapper.getMeetingCountByOrganizationId(organizationId, attendanceState);
	}

	
	
	// 增加于2018/11/25
	@Override
	public List<Map> listMeetingDetail(int taskId) {
		// TODO 自动生成的方法存根
		return meetingTaskMapper.getMeetingDetailByTaskId(taskId);
	}

	@Override
	public void userMeetingSignature(@Param("organizationId")int organizationId, @Param("meetingId")int meetingId, 
			@Param("attendeeNumber")int attendeeNumber, 
			@Param("contacts")String contacts,
			@Param("Mobile")String Mobile, @Param("email")String email, @Param("attendeesName")String attendeesName) {
		// TODO 自动生成的方法存根
		 meetingTaskMapper.updateMeetingWhenSignature
		 (organizationId, meetingId, attendeeNumber, contacts, Mobile, email, attendeesName);
	}
	

	// 登陆后所填信息
	@Override
	public List<Map> getSignatureMessage(int organizationId, int meetingId) {
		// TODO 自动生成的方法存根
		return meetingTaskMapper.getUserSignatureMeetingMessage(organizationId, meetingId);
	}
	//获取会议报名情况
	@Override
	public List<Meeting> getMeetingMessageByMeetingId(int meetingId) {
		// TODO 自动生成的方法存根
		return meetingTaskMapper.getMeetingMessageByMeetingId(meetingId);
	}
 
	 //根据任务id获取报名情况
	//获取会议报名情况
	public List<MeetingAttendees> getMeetAttendeesByTaskId(Integer meetingTaskId){
		 return this.meetingAttendeesMapper.getMeetAttendeesByTaskId(meetingTaskId);
	 }
    //获取会议任务
	@Override
	public MeetingTask selectByPrimaryKey(Integer taskid) {
		// TODO Auto-generated method stub
		return this.meetingTaskMapper.selectByPrimaryKey(taskid);
	}

	@Override
	public int insertSelective(MeetingAttendees record) {
		// TODO Auto-generated method stub
		return this.meetingAttendeesMapper.insertSelective(record);
	}

	 //更新会议任务状态
	 public int updateByPrimaryKeySelective(MeetingTask record) {
		 return this.meetingTaskMapper.updateByPrimaryKey(record);
	 }
	 
	//删除会议报名
	 public	 int deleteByPrimaryKey(Integer attendeeid) {
		 return this.meetingAttendeesMapper.deleteByPrimaryKey(attendeeid);
	 }
}

