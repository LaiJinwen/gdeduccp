package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.VoteCandidate;
import edu.gd.ccp.entity.VoteResult;
import edu.gd.ccp.entity.VoterPhones;
import edu.gd.ccp.entity.Voters;
import edu.gd.ccp.entity.Votetask;

public interface VoteUserService {
	
	// 2018.12.07， 查询voters表
	public Voters selectFromVotersByVoterId(int voterId);
	
	// 查询 votetask表
	public Votetask selectFromVoteTaskByVoteTaskId(int voteTaskId);
	
	// 查询 votecandidate表
	public List<VoteCandidate> selectFromVoteCandidateByVoteTaskId(int voteTaskId);
	
	public VoteCandidate selectFromVoteCandidateByCandidateId(int candidateId);
	
	// 提交数据时更新voteresult表
	public int updateStateOnVoteResult(String voteResult, int resultId);
	
	// 提交数据时更新voters表
	public int updateStateOnVoters(int voterId);
	
	// 提交数据时更新voterphones表
	public int insertIntoVoterPhones(VoterPhones voterPhones);
	
	//获取某张选票
	VoteResult selectVoteResultByPrimaryKey(Integer resultid);
	//高校端获取投票任务
    List<Map> getVoteTaskByOrganizationNo( String organizationNo);
  //高校端投票任务数
    Integer voteTaskCountByOrganizationNo( String organizationNo);
    
    Votetask selectByPrimaryKey(Integer votetaskid);
    //根据任务和单位获取投票任务
    Voters selectVoterByOrganizationNo(Integer voteTaskId, String organizationNo);
    //生成投票
    int insertVote(VoteResult record);
    //更新投票者投票状体
    int updateVoterByPrimaryKeySelective(Voters record);
    int unvoteTaskCountByOrganizationNo(  String organizationNo);
}
