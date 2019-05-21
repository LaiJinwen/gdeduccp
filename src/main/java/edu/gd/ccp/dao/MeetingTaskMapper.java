package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingTask;

public interface MeetingTaskMapper {
    int deleteByPrimaryKey(Integer taskid);

    int insert(MeetingTask record);

    int insertSelective(MeetingTask record);

    MeetingTask selectByPrimaryKey(Integer taskid);

    int updateByPrimaryKeySelective(MeetingTask record);

    int updateByPrimaryKey(MeetingTask record);
    
    // 增加于2018/11/23, 列出该组织所有会议
    List<Map> listAllMeetingByOrganizationId(@Param("offset") Integer offset,@Param("limit") Integer limit, 
    		@Param("organizationId")int organizationId, @Param("attendanceState")String attendanceState);
    
    // 统计该组织会议总数
    int getMeetingCountByOrganizationId(@Param("organizationId")int organizationId, @Param("attendanceState")String attendanceState);
    
    List<Map> getMeetingDetailByTaskId(int taskId);
    
    
    
    // 增加于2018/11/25
    // 组织进行签到
    int updateMeetingWhenSignature(@Param("organizationId")int organizationId, @Param("meetingId")int meetingId, 
    		@Param("attendeeNumber")int attendeeNumber, @Param("contacts")String contacts, 
    		@Param("Mobile")String Mobile, @Param("email")String email, @Param("attendeesName")String attendeesName);
    
    // 用于用户查询自身是否有资格签到，以及二次填写用
    List<Map> getUserSignatureMeetingMessage(@Param("organizationId")int organizationId, @Param("meetingId")int meetingId);
    
    
    // 由meetingId获取会议信息
    List<Meeting> getMeetingMessageByMeetingId(int meetingId);

    /**
     * 2018 11 27
     * @return 返回所有记录信息   ： List<Meeting>
     */
    List<Meeting> selectAllMeetings();
    
    /**
     * 根据会议自编号查找会议
     * @param meetingNo 会议自编号
     * @return List<Meeting>
     */
    List<Meeting> selectMeetingByMeetingNo(String meetingNo);
    
    /**
     * 根据发布者ID查找会议
     * @param userId 发布者ID
     * @return   List<Meeting>
     */
    List<Meeting> selectMeetingByPublishUserId(String userId);
    
    /**
     * 根据会议类型查找会议
     * @param typeId 会议类型
     * @return	 List<Meeting>
     */
    List<Meeting> selectMeetingByTypeId(Integer typeId);
    
    /**
     * 查询总的会议数
     * @return
     */
    Integer selectCountAllMeeting();
    
    /**
     * 在该会议自编号下会议数
     * @param meetingNo String
     * @return 查询到的会议总数
     */
    Integer selectCountMeetingInMeetingNo(String meetingNo);
    
    /**
     * 在该会议发布人Id下的会议数
     * @param publishUserId 发布者Id
     * @return 查询到的会议总数
     */
    Integer selectCountMeetingInPublishUserId(String publishUserId);
    
    /**
     * 某类别下会议总数
     * @param typrId Integer 会议类别
     * @return 查询到的会议总数
     */
    Integer selectCountMeetingInMeetingTypeId(Integer typeId);
    
    
    // ~~~~~~~12月新增
    /**
     * 根据会议标题查找会议
     * @param meetingTitle
     * @return	List<Meeting>
     */
    List<Meeting> selectMeetingByTitle(String meetingTitle);
    //获取某次会议参加情况
    List<Map> getMeetingAtendanceState( @Param("meetingId")int meetingId);
    //删除某次会议的参会任务
    int deletMeetingTaskByMeetingId( @Param("meetingId")int meetingId);
  //获取会议参加统计情况
    List<Map> getMeetingAtendanceStatistics(@Param("meetingNo") String meetingNo,@Param("organizationType") String organizationType,@Param("organizationName") String organizationName,@Param("belong") String belong,@Param("schoolLevel") String schoolLevel);
    //获取会议参会情况
    List<MeetingTask> selectAllMeetingTaskByMeetingId(@Param("meetingId") Integer meetingId);
     
}