package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import edu.gd.ccp.entity.MeetingAttendees;

public interface MeetingAttendeesMapper {
    int deleteByPrimaryKey(Integer attendeeid);

    int insert(MeetingAttendees record);

    int insertSelective(MeetingAttendees record);

    MeetingAttendees selectByPrimaryKey(Integer attendeeid);

    int updateByPrimaryKeySelective(MeetingAttendees record);

    int updateByPrimaryKey(MeetingAttendees record);
    
    List<Map> getMeetAttendeesByMeetingId(Integer meetingId);
    
    List<MeetingAttendees> getMeetAttendeesByTaskId(Integer meetingTaskId);
}