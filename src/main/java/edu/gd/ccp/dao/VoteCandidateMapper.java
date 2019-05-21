package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import edu.gd.ccp.entity.VoteCandidate;

public interface VoteCandidateMapper {
    int deleteByPrimaryKey(Integer candidateid);

    int insert(VoteCandidate record);

    int insertSelective(VoteCandidate record);

    VoteCandidate selectByPrimaryKey(Integer candidateid);

    int updateByPrimaryKeySelective(VoteCandidate record);

    int updateByPrimaryKey(VoteCandidate record);
    //根据投票任务id获取候选人
    List<Map> selectByTaskid(Integer votetaskid);
    // 2018.12.07
    // 列出所有候选人
    List<VoteCandidate> selectByVoteTaskId(int voteTaskId);
}