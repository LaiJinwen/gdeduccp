package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.*;

//发布投票
public interface VoteAdminService {
	//发布一次投票，参数：投票最大人数,url为服务器地址
   public int publishVote(String url,String schoolLevel, String belong,
			String schoolType,Votetask votetask);
   //创建候选人
   public int addCandidate(VoteCandidate voteCandidate);
   //生成投票
   public int newVoter(Voters voters);
   //投票任务列表
   public List<Map> getVoteTaskList(Integer offset, Integer limit);
   //投票任务数
   public int getVoteTaskCount();
   //根据投票任务id获取投票结果
   public List<Map> getVoteResultByTaskid(int taskid);
   //根据投票任务id获取投票候选人
   public List<Map> getVoteCandidateByTaskid(int taskid);
   //删除投票人
   public int deleteCandidate(Integer candidateid);  
   //根据选票id获取唯一投票
   VoteResult getVoteByPrimaryKey(Integer resultid);
   //进行投票
   int newVote(VoteResult record);
   //删除某一投票任务的所有单位任务
   int deleteVoterByVoterTaskId( Integer  voteTaskId); 
   //删除投票任务
   int deleteVoterTaskByPrimaryKey(Integer voteTaskId);
 //统计某次投票的应投和未投数,
   Map voteTaskCountByVoteTaskId( Integer voteTaskId);
 //查询某次投票的情况
   List<Map> selectVoterByVoteTaskId(  Integer voteTaskId);
   //获取需要投票人
   Voters selectByPrimaryKey(Integer voterid);
   
   int updateByPrimaryKeySelective(Voters record);
}
