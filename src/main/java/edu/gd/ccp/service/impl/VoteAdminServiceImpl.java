package edu.gd.ccp.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import edu.gd.ccp.dao.*;
import edu.gd.ccp.entity.*;
import edu.gd.ccp.service.VoteAdminService;
import edu.gd.ccp.util.EmailUtil;

@Service("voteAdminService")
public class VoteAdminServiceImpl implements VoteAdminService {
	@Autowired
	private VotetaskMapper votetaskMapper;
	@Autowired
	private VoteCandidateMapper voteCandidateMapper;
	@Autowired
	private VoteResultMapper voteResultMapper;
	@Autowired
	OrganizationMapper organizationMapper;
	@Autowired
	VotersMapper votersMapper;
	@Autowired
	private UserMapper userMapper;	
	// 根据指定最大投票人数生成投票任务
	@Override
	public int publishVote(String url,String schoolLevel, String belong,
			String schoolType,Votetask votetask) {
		votetask.setPublishdate(new Date());
		int result = this.votetaskMapper.insert(votetask);
		int id = votetask.getVotetaskid();
		
		List<Organization> organizationList = organizationMapper.getOridganizationByCondation(schoolType, belong, schoolLevel);

		System.out.println("选票数"+votetask.getMaxvoternumber());
		// 生成选票
		for (Organization organization:organizationList) {
			//生成投票
//			VoteResult voteResult = new VoteResult();
//			voteResult.setVotetaskid(id);
//			int row=voteResultMapper.insert(voteResult);
			//生成投票人列表
			Voters voter=new Voters();
			voter.setVotetaskid(id);
			voter.setOrganizationno(organization.getOrganizationno());
			voter.setVoterstate("未投");
			int row2=votersMapper.insert(voter);
			//向该单位所有用户发送邮件
			List<Map<String, String>> maps = userMapper.selectUserIdAndOrganNo(organization.getOrganizationid());	
			for(Map<String, String> map:maps){
			String email=map.get("email");
			//发给单位的每个用户
			String content=organization.getOrganizationname()+"<br>,贵单位有一项投票任务，"+votetask.getTitle()+"请收到邮件后进入网站投票， "+url+"/gdeduccp/<br>";
			content=content+ "<br><a href='"+url+"/gdeduccp/doc/vote/"+ votetask.getTitle() +".pdf' target=_blank>下载投票说明</a><br>";
			content=content+ "<br><a href='"+url+"/gdeduccp/vote/intoUserVoteMobile.do?voteTaskId="+votetask.getVotetaskid()+"&organizationNo="+organization.getOrganizationno()+"'>手机投票</a>";
			if(email!=null && !email.trim().equals("")) {
			EmailUtil.sendMail(votetask.getTitle()+"投票通知",email,content);
			 }
			 }
			

		}
		System.out.println("id=" + id);
		return result;
	}

	@Override
	public int addCandidate(VoteCandidate voteCandidate) {
		// TODO Auto-generated method stub
		return this.voteCandidateMapper.insert(voteCandidate);
	}

	@Override
	public int newVoter(Voters voters) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Map> getVoteTaskList(Integer offset, Integer limit) {
		// TODO Auto-generated method stub
		return this.votetaskMapper.listVoteTask(offset, limit);
	}

	@Override
	public int getVoteTaskCount() {
		// TODO Auto-generated method stub
		return this.votetaskMapper.voteTaskCount();
	}

	@Override
	public List<Map> getVoteResultByTaskid(int taskid) {
		// TODO Auto-generated method stub
		return this.voteResultMapper.selectResultByVoteTaskid(taskid);
	}
    //根据投票任务id获取投票候选人
	@Override
	public List<Map> getVoteCandidateByTaskid(int taskid) {
		// TODO Auto-generated method stub
		return this.voteCandidateMapper.selectByTaskid(taskid);
	}

	@Override
	public int deleteCandidate(Integer candidateid) {
		// TODO Auto-generated method stub
		return this.voteCandidateMapper.deleteByPrimaryKey(candidateid);
	}

	@Override
	public VoteResult getVoteByPrimaryKey(Integer resultid) {
		// TODO Auto-generated method stub
		return this.voteResultMapper.selectByPrimaryKey(resultid);
	}

	@Override
	public int newVote(VoteResult record) {
		// TODO Auto-generated method stub
		return this.voteResultMapper.insertSelective(record);
	}

	@Override
	public int deleteVoterByVoterTaskId(Integer voteTaskId) {
		// TODO Auto-generated method stub
		return this.votersMapper.deleteVoterByVoterTaskId(voteTaskId);
	}

	@Override
	public int deleteVoterTaskByPrimaryKey(Integer voteTaskId) {
		// TODO Auto-generated method stub
		return this.votetaskMapper.deleteByPrimaryKey(voteTaskId);
	}
	//统计某次投票的应投和未投数
	public Map voteTaskCountByVoteTaskId( Integer voteTaskId) {
		return this.votersMapper.voteTaskCountByVoteTaskId(voteTaskId);
	}
	 //查询某次投票的情况
	public List<Map> selectVoterByVoteTaskId(  Integer voteTaskId) {
		return this.votersMapper.selectVoterByVoteTaskId(voteTaskId);
	}
	   //获取需要投票人
	public   Voters selectByPrimaryKey(Integer voterid) {
		   return this.votersMapper.selectByPrimaryKey(voterid);
	   }
	public int updateByPrimaryKeySelective(Voters record) {
		return this.votersMapper.updateByPrimaryKeySelective(record);
	}
}
