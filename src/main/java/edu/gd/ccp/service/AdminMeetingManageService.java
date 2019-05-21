package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingAttendees;
import edu.gd.ccp.entity.MeetingTask;
//发布会议任务、会议任务管理、会议查询、会议统计、
public interface AdminMeetingManageService {
//	公告新闻管理

	// 2018 11 25新增内容
	
	/**
	 *  管理员发布会议,传入要参加学校的条件以及会议信息
	 * @param meeting
	 * @return 1:表示成功  0：表示失败
	 */
	public Integer publishMeeting(String url,Meeting meeting, String schoolLevel,String belong,
			String schoolType); 
	
	/**
	 * 在已知的会议任务下，根据组织类别发布会议任务信息
	 * @param meetingId 已知的会议ID
	 * @param attendeeNumber 应该参加的人数
	 * @param organType 要求参加的组织的类别
	 * @return 1：成功；否则：失败
	 */
	public Integer publishMeeintgTaskByOrType(String url,Meeting meeting,int meetingId,String meetingNo ,String schoolLevel,String belong,
			String schoolType);
	
	/**
	 * 在已知的会议任务下，根据组织id发布会议任务信息
	 * @param meetingId  已知的会议ID
	 * @param attendeeNumber 应该参加的人数
	 * @param organId	要求参加的组织id
	 * @return 1：成功；否则：失败
	 */
	public Integer publishMeeintgTaskByOrName(String attendeeNumber,Integer organId);
	
	/**
	 * 根据会议Id删除会议
	 * @param meetingId 会议id
	 * @return	1：成功 0：失败
	 */
	public int delectMeeting(int meetingId);
	
	/**
	 * 返回所有会议信息
	 * @return  List<Meeting>
	 */
	public List<Meeting> getAllMeetings();
	
	/**
	 * 根据会议标题查找会议
	 * @param title 会议标题
	 * @return 
	 */
	public List<Map> getMeetingsByTitle(String meeetingNo,String title, Integer offset, Integer limit);
	public int getMeetingCountByTitle(String meeetingNo,String title);
	//获取某次会议参加情况
	 List<Map> getMeetingAtendanceState( @Param("meetingId")int meetingId);
	 
	 Meeting selectByPrimaryKey(Integer meetingid);
	 //获取会议报名情况
	 List<Map> getMeetAttendeesByMeetingId(Integer meetingId);
	 int deletMeetingTaskByMeetingId(Integer meetingId);
	  //会议参加统计
	 List<Map> getMeetingAtendanceStatistics( String meetingNo, String organizationType, String organizationName,  String belong,  String schoolLevel);
	//获取会议参会情况
	 List<MeetingTask> selectAllMeetingTaskByMeetingId(Integer meetingId);
}
