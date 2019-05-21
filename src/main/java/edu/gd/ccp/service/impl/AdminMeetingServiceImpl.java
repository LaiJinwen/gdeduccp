package edu.gd.ccp.service.impl;

import java.net.InetAddress;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gd.ccp.dao.MeetingAttendeesMapper;
import edu.gd.ccp.dao.MeetingMapper;
import edu.gd.ccp.dao.MeetingTaskMapper;
import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.dao.UserMapper;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.service.AdminMeetingManageService;
import edu.gd.ccp.service.ex.BaseException;
import edu.gd.ccp.util.EmailUtil;

/**
 * 2018 11 25
 * @author StevenLai
 */
@Service("meetingService")
public class AdminMeetingServiceImpl implements AdminMeetingManageService {

	@Autowired
	MeetingMapper meetingMapper;
	@Autowired
	MeetingTaskMapper taskMapper;
	@Autowired
	OrganizationMapper orMapper;
	@Autowired
	MeetingTaskMapper meetingTaskMapper;
	@Autowired
	MeetingAttendeesMapper meetingAttendeesMapper;
	@Autowired
	private UserMapper userMapper;		
	
	@Override
	public Integer publishMeeting(String url,Meeting meeting, String schoolLevel,String belong,
			String schoolType) throws BaseException{
		
		int result = meetingMapper.insertSelective(meeting);
//		System.out.println("result"+result);
//		System.out.println("meeting.getMeetingid()"+meeting.getMeetingid());
		if( result==1 && (meeting.getMeetingid()!=null) )
		{
			int meetingid = meeting.getMeetingid();
			System.out.println("meetingid"+meetingid);
			int result1 =publishMeeintgTaskByOrType(url,meeting,meetingid, meeting.getMeetingno(),schoolLevel,belong,schoolType);
			if(result1 ==1) {
				return 1;
			}
			else
				return 0;
		}
		else
		{return -2;
			//throw new BaseException("发布会议后台出错！");
		}
	}

	@Override
	@Transactional
	public Integer publishMeeintgTaskByOrType (String url,Meeting meeting,int meetingId,String meetingNo,  String schoolLevel,String belong,
			String schoolType) throws BaseException {
		// 发布相应的meetaTask   会议任务  
		// 会议id为meetingId 的组织会议任务
		// 获取满足条件的高校id+
		List<Integer> orIdList = orMapper.getOridganizationIdByCondation(schoolType, belong, schoolLevel);
//		System.out.println(orIdList);
		

		int count = 0;
		for(Integer orId : orIdList) 
		{	
			MeetingTask task = new MeetingTask();
		    task.setAttendancestate("未参加");
		    task.setMeetingid(meetingId);
		    task.setMeetingno(meetingNo);
			task.setOrganizationid(orId);
			count+=taskMapper.insertSelective(task);
			//向该单位所有用户发送邮件
			List<Map<String, String>> maps = userMapper.selectUserIdAndOrganNo(orId);	
			for(Map<String, String> map:maps){
			String email=map.get("email"); 
			//发给单位的每个用户
	 
			String content=map.get("userName")+"<br>,贵单位有一项会议报名参加任务，"+meeting.getMeetingtitle()+",请收到邮件后进入网站上报参加人员。<br>web端报名地址：<a href='"+url+"/gdeduccp/' target=_blank>web端登录后报名</a>"+"<br>";
			 content=content+ "手机会议报名地址： <a href='"+url+"/gdeduccp/schoolMeeting/intoMeetingLogin.do?meetingId=" + meeting.getMeetingid()+"'>手机报名</a>";
			content=content+ "<br><a href='"+url+"/gdeduccp/doc/meeting/"+ meeting.getMeetingno() +".pdf' target=_blank>下载会议通知</a><br>";
			//content=content+ "手机扫码会议报名二维码，登录后报名，<img style='float:right height=100 width=100' alt='扫描二维码' src='http://localhost:8080/gdeduccp/admin/getMeetingQRCode?meetingId="+meeting.getMeetingid()+"'>";
			if(email!=null && !email.trim().equals("")) {
			EmailUtil.sendMail(meeting.getMeetingtitle()+"会议通知",email,content);
			 }
			 }		
			
		}
		if(count!=orIdList.size()) {
			return 0;
			//throw new BaseException("后台繁忙，发布会议任务失败，请稍后再试~");
			}
		else
			return 1;
	}

	@Override
	public Integer publishMeeintgTaskByOrName(String attendeeNumber, Integer organId) {
		MeetingTask task = new MeetingTask();
		task.setAttendancestate("未参加");
		task.setOrganizationid(organId);
		int count = 0;
		count = taskMapper.insertSelective(task);
		if(count!=1)
			throw new BaseException("后台繁忙，发布会议任务失败，请稍后再试~");
		else
			return 1;
	}

	@Override
	public int delectMeeting(int meetingId) {
		return meetingMapper.deleteByPrimaryKey(meetingId);
	}

	@Override
	public List<Meeting> getAllMeetings() {
		List<Meeting> list= meetingMapper.selectAllMeetings();
		return list;
	}

	@Override
	public List<Map> getMeetingsByTitle(String meeetingNo,String meetingTitle, Integer offset, Integer limit) {
		List<Map> list = meetingMapper.selectMeetingByTitle(meeetingNo,meetingTitle,  offset,  limit);
		return list;
	}

	@Override
	public int getMeetingCountByTitle(String meeetingNo,String title) {
		// TODO Auto-generated method stub
		return this.meetingMapper.getCountMeetingByTitle(meeetingNo,title);
	}

	@Override
	public List<Map> getMeetingAtendanceState(int meetingId) {
		// TODO Auto-generated method stub
		return this.meetingTaskMapper.getMeetingAtendanceState(meetingId);
	}

	@Override
	public Meeting selectByPrimaryKey(Integer meetingid) {
		// TODO Auto-generated method stub
		return this.meetingMapper.selectByPrimaryKey(meetingid);
	}

	@Override
	public List<Map> getMeetAttendeesByMeetingId(Integer meetingId) {
		// TODO Auto-generated method stub
		return this.meetingAttendeesMapper.getMeetAttendeesByMeetingId(meetingId);
	}

	@Override
	public int deletMeetingTaskByMeetingId(Integer meetingId) {
		return this.meetingTaskMapper.deletMeetingTaskByMeetingId(meetingId);
	}

	@Override
	public List<Map> getMeetingAtendanceStatistics(String meetingNo, String organizationType, String organizationName,
			String belong, String schoolLevel) {
		// TODO Auto-generated method stub
		return this.meetingTaskMapper.getMeetingAtendanceStatistics(meetingNo, organizationType, organizationName, belong, schoolLevel);
	}
	//获取会议参会情况
	@Override
	public  List<MeetingTask> selectAllMeetingTaskByMeetingId(Integer meetingId){
		return this.meetingTaskMapper.selectAllMeetingTaskByMeetingId(meetingId);
	}
}
