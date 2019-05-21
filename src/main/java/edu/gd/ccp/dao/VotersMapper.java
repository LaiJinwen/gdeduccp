package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.VoteCandidate;
import edu.gd.ccp.entity.Voters;

public interface VotersMapper {
    int deleteByPrimaryKey(Integer voterid);

    int insert(Voters record);

    int insertSelective(Voters record);

    Voters selectByPrimaryKey(Integer voterid);

    int updateByPrimaryKeySelective(Voters record);

    int updateByPrimaryKey(Voters record);

    // 2018.12.7
    // 提交数据时，该票作废
    int updateStateOnVoters(int voterId);  
    
    Voters selectVoterByOrganizationNo(@Param("voteTaskId") Integer voteTaskId,@Param("organizationNo") String organizationNo);
    
    int deleteVoterByVoterTaskId(@Param("voteTaskId") Integer  voteTaskId);
    // 高校未完成投票任务数
    int unvoteTaskCountByOrganizationNo(@Param("organizationNo") String organizationNo);
    //统计某次投票的应投和未投数
    Map voteTaskCountByVoteTaskId(@Param("voteTaskId") Integer voteTaskId);
    //查询某次投票的情况
    List<Map> selectVoterByVoteTaskId(@Param("voteTaskId") Integer voteTaskId);
     
    
}