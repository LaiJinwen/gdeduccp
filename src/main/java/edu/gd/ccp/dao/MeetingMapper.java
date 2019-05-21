package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Meeting;

public interface MeetingMapper {
    int deleteByPrimaryKey(Integer meetingid);

    int insert(Meeting record);

    int insertSelective(Meeting record);

    Meeting selectByPrimaryKey(Integer meetingid);

    int updateByPrimaryKeySelective(Meeting record);

    int updateByPrimaryKeyWithBLOBs(Meeting record);

    int updateByPrimaryKey(Meeting record);
    
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
    List<Map> selectMeetingByTitle(@Param("meetingNo") String meetingNo,@Param("meetingTitle") String meetingTitle,@Param("offset") Integer offset,@Param("limit") Integer limit);
     //根据会议标题查找会议数量
    Integer getCountMeetingByTitle(@Param("meetingNo") String meetingNo,@Param("meetingTitle") String meetingTitle);
}