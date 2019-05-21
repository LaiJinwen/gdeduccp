package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.VoteResult;

public interface VoteResultMapper {
    int deleteByPrimaryKey(Integer resultid);

    int insert(VoteResult record);

    int insertSelective(VoteResult record);

    VoteResult selectByPrimaryKey(Integer resultid);

    int updateByPrimaryKeySelective(VoteResult record);

    int updateByPrimaryKey(VoteResult record);
    
    List<Map> selectResultByVoteTaskid(int voteTaskid);
    // 2018.12.07
    // 提交投票结果
    int updateWhenSubmitResult(@Param("voteResult")String voteResult,@Param("resultId")int resultId); 
}