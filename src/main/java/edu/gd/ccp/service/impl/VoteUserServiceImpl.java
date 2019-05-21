package edu.gd.ccp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.gd.ccp.dao.*;
import edu.gd.ccp.entity.VoteCandidate;
import edu.gd.ccp.entity.VoteResult;
import edu.gd.ccp.entity.VoterPhones;
import edu.gd.ccp.entity.Voters;
import edu.gd.ccp.entity.Votetask;
import edu.gd.ccp.service.VoteUserService;

@Service("voteUserService")
public class VoteUserServiceImpl implements VoteUserService {
	@Autowired
	private VotetaskMapper votetaskMapper;
	
	@Autowired
	private VotersMapper votersMapper;
	
	@Autowired
	private VoteCandidateMapper voteCandidateMapper;
	
	@Autowired
	private VoteResultMapper voteResultMapper;
	
	@Autowired
	private VoterPhonesMapper votePhonesMapper;
	

	@Override
	public Voters selectFromVotersByVoterId(int voterId) {
		// votersMapper已有方法
		return votersMapper.selectByPrimaryKey(voterId);
	}

	@Override
	public Votetask selectFromVoteTaskByVoteTaskId(int voteTaskId) {
		// VotetaskMapper已有方法
		return votetaskMapper.selectByPrimaryKey(voteTaskId);
	}

	@Override
	public List<VoteCandidate> selectFromVoteCandidateByVoteTaskId(int voteTaskId) {
		// TODO 自动生成的方法存根
		return voteCandidateMapper.selectByVoteTaskId(voteTaskId);
	}

	@Override
	public VoteCandidate selectFromVoteCandidateByCandidateId(int candidateId) {
		// votecandidateMapper已有方法
		return voteCandidateMapper.selectByPrimaryKey(candidateId);
	}

	@Override
	public int updateStateOnVoteResult(String voteResult, int resultId) {
		// TODO 自动生成的方法存根
		return voteResultMapper.updateWhenSubmitResult(voteResult , resultId);
	}

	@Override
	public int updateStateOnVoters(int voterId) {
		// TODO 自动生成的方法存根
		return votersMapper.updateStateOnVoters(voterId);
	}

	@Override
	public int insertIntoVoterPhones(VoterPhones voterPhones) {
		// 已有方法
		return votePhonesMapper.insertSelective(voterPhones);
	}

	@Override
	public VoteResult selectVoteResultByPrimaryKey(Integer resultid) {
		// TODO Auto-generated method stub
		return this.voteResultMapper.selectByPrimaryKey(resultid);
	}
	//高校端获取投票任务
	public List<Map> getVoteTaskByOrganizationNo( String organizationNo){
		return this.votetaskMapper.getVoteTaskByOrganizationNo(organizationNo);
	}
	public Integer voteTaskCountByOrganizationNo(String organizationNo) {
		return this.votetaskMapper.voteTaskCountByOrganizationNo(organizationNo);
	}
	
	public Votetask selectByPrimaryKey(Integer votetaskid) {
		return this.votetaskMapper.selectByPrimaryKey(votetaskid);
	}
	
	 //根据任务和单位获取投票任务
	public Voters selectVoterByOrganizationNo(Integer voteTaskId, String organizationNo) {
		return this.votersMapper.selectVoterByOrganizationNo(voteTaskId, organizationNo);
	}
	//生成投票
	public int insertVote(VoteResult record) {
	   return this.voteResultMapper.insertSelective(record);
	}
    //更新投票者投票状体
	public int updateVoterByPrimaryKeySelective(Voters record) {
    	return this.votersMapper.updateByPrimaryKeySelective(record);
    }
	
    public int unvoteTaskCountByOrganizationNo(  String organizationNo) {
    	return this.votersMapper.unvoteTaskCountByOrganizationNo(organizationNo);
    }
}
