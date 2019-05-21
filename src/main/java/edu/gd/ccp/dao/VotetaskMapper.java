package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Votetask;

public interface VotetaskMapper {
    int deleteByPrimaryKey(Integer votetaskid);

    int insert(Votetask record);

    int insertSelective(Votetask record);

    Votetask selectByPrimaryKey(Integer votetaskid);

    int updateByPrimaryKeySelective(Votetask record);

    int updateByPrimaryKey(Votetask record);
    //投票任务列表
    List<Map> listVoteTask(@Param("offset") Integer offset,@Param("limit") Integer limit);
    //投票任务总数
    Integer voteTaskCount();
  //高校端投票任务数
    Integer voteTaskCountByOrganizationNo(@Param("organizationNo") String organizationNo);
    //高校端获取投票任务
    List<Map> getVoteTaskByOrganizationNo(@Param("organizationNo") String organizationNo);
}