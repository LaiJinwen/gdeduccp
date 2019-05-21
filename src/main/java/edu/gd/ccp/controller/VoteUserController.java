package edu.gd.ccp.controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingAttendees;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.VoteCandidate;
import edu.gd.ccp.entity.VoteResult;
import edu.gd.ccp.entity.VoterPhones;
import edu.gd.ccp.entity.Voters;
import edu.gd.ccp.entity.Votetask;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.service.UserMeetingManageService;
import edu.gd.ccp.service.UserMessageService;
import edu.gd.ccp.service.VoteUserService;
import net.sf.json.JSONObject;

@Controller
@Scope(value = "prototype")
@RequestMapping("/vote")
public class VoteUserController {
	@Resource
	VoteUserService voteUserService;
	@Resource
	UserAccountService userAccountService;

	@Resource
	private UserDocumentManageService userDocumentManageService;	
 
	@Resource
	private UserMeetingManageService userMeetingManageService;	
	@Resource
	private UserMessageService userMessageService;	
	/**
	 *	votetask:管理员设置投票参数
	 *		(voteTaskId, title, introduction, candidateNumber, 
	 *			maxChooseNumber, maxVoterNumber, publishDate)
	 *
	 *	voters:设置投票参数后，根据maxVoterNumber生成对应的条数
	 *		(voterId, voteTaskId, voteState, voteTime)	
	 *
	 * 	votecandidate:管理员设置投票参数后，设置投票人参数
	 * 		(candidateId, voteTaskId, name, introduction, nationality, 
	 * 			gender, duty, title, photo, birthDay, politicsStatus, votes)
	 * 
	 *	voteresult:扫码投票后，将投票结果写入voteResult，并写入voteTime
	 *		(resultId, voteTaskId, voterId, voteResult, voteTime)
	 * 
	 * 	voterphones:投票时将投票手机信息写入表中
	 * 		(Id, voteTaskId, phones, ips, mobileIds)
	 * 
	 * 
	 * 	备注：1、结束投票时，从voteresult中取出结果，写入到votecandidate表中的votes，
	 * 		同时将voters表中的voteState的所有结果设为已投
	 * 		2、扫码投票时，要注意该票是否已投，以及该手机是否已投
	 * 		3、进入投票时，要确定maxChooseNumber，写入voteResult中的数字应是candidateId（逗号隔开）
	 * 		4、关于IP地址，手机使用3g/4g信号上网，在同一归属地（可以理解为同个城市）只有1个IP，但连上WiFi时，地址又会变动
	 * 			获取手机号。。。。这个无法实现
	 * 			获取手机序列号，暂时存疑
	 * 		5、
	 * 
	 * */
	// 2018.12.07, 扫码进行投票,移动端（旧版）
	@RequestMapping("/intoVoteInteface.do")
	public String intoVote(HttpSession session, HttpServletRequest request,
			Model model) {
		
		// http://202.116.195.79/gdeduccp/vote/intoVoteInterface.do?resultId=?
		// 投票二维码对应的数据库每张选票的ID
		int resultId = Integer.parseInt(request.getParameter("resultId"));
		
		// 查询该票是否已投
//		Voters voters = voteUserService.selectFromVotersByVoterId(voterId);
		VoteResult voteResult=voteUserService.selectVoteResultByPrimaryKey(resultId);
		if(voteResult.getVoteresult() !=null && !voteResult.getVoteresult().trim().equals("")) {
			model.addAttribute("msg", "本张选票已被使用，请勿重复投票");
			return "vote/vote-afterVoteMessage";
		}
		// 查询该手机是否投过票
		// voterTaskId 某次投票任务id
//		session.setAttribute("voteTaskId", voteResult.getVotetaskid());
//		session.setAttribute("resultId", resultId);
		return "redirect:/vote/listVoteCandidate.do?voteTaskId="+voteResult.getVotetaskid()+"&resultId="+resultId;
	}
	
	// 列出所有投票候选人的信息
	@RequestMapping("listVoteCandidate.do")
	public String listVoteCandidate(Integer voteTaskId,Integer resultId, Model model, HttpSession session ) {
		
//		int voteTaskId = (int) session.getAttribute("voteTaskId");
		
		// 获取对应的投票任务voteTaskId
//		Voters voters = voteUserService.selectFromVotersByVoterId(voterId);
//		int voteTaskId = voters.getVotetaskid();
		
		// voteTaskId 也放入session中
//		session.setAttribute("voteTaskId", voteTaskId);
		
		// 获取投票信息（标题、备注、最大可选人数等）
		Votetask votetask = voteUserService.selectFromVoteTaskByVoteTaskId(voteTaskId);
		model.addAttribute("votetask", votetask);
		
		// 获取本次投票的所有候选人信息
		List<VoteCandidate> listAllVoteCandidate = voteUserService.selectFromVoteCandidateByVoteTaskId(voteTaskId);
		model.addAttribute("candidates", listAllVoteCandidate);
		model.addAttribute("resultId", resultId);
		menuSide(session,model);
		return "vote/chooseCandidate";
	}
	
	// 列出单独的投票候选人的信息
	@RequestMapping("listCandidateDetailMessage.do")
	public String intoCandidateDetailMessage(Model model, int candidateId) {
		VoteCandidate voteCandidate = voteUserService.selectFromVoteCandidateByCandidateId(candidateId);
		
		model.addAttribute("voteCandidate", voteCandidate);
		 
		return "vote/chooseCandidate";
	}
	
	/**
	 * 提交投票结果：
	 * 	0、获取属性voterId、voteTaskId、
	 * 	1、获取candidateId，以逗号隔开，写入到voteresult表中
	 * 	2、将voters中的状态改为已投
	 * 	3、记录投票者的手机信息
	 * 	4、移除所有session
	 * 	5、投票成功，跳转到成功界面（与已投票界面一致）
	 * 
	 */
	@RequestMapping("submitVoteResult.do")
	public String submitVoteTrsult(Integer resultId,HttpServletRequest request, HttpSession session,
			Model model) {
 	  System.out.println("test");
//		int voterId = (int) session.getAttribute("voterId");
//		int voteTaskId = (int) session.getAttribute("voteTaskId");
//		
		// 获取复选框中的值
		String[] result = request.getParameterValues("choosenames");
		
		String voteResult = "";
		if(result.length > 0) {
			for(int i = 0; i < result.length; i++) {
				voteResult += result[i]+","; 
			}
		}
		voteResult=voteResult.substring(0, voteResult.length()-1);
		// 更新数据库，将投票结果更新到记录里-voteresult
		voteUserService.updateStateOnVoteResult(voteResult, resultId);
		
		// 更新数据库-voters
//		voteUserService.updateStateOnVoters(voterId);
		
		
		// 记录手机信息
//		String ips = request.getRemoteAddr();
//		String mobileIds = null;
//		String phones = null;
//		
//		VoterPhones voterPhones = null;
//		voterPhones.setVotetaskid(voteTaskId);
//		voterPhones.setMobileids(mobileIds);
//		voterPhones.setIps(ips);
//		voterPhones.setPhones(phones);
		
		// 更新数据库- voterphones
//		voteUserService.insertIntoVoterPhones(voterPhones);
		
		// 清除所有session
		session.invalidate();
		
		model.addAttribute("msg","投票成功,请等待投票结果");

		return "vote/vote-afterVoteMessage";
	}
	//显示投票列表
	@RequestMapping("intoWebVoteTaskListUi")
	public String intoWebVoteUi(String organizationNo, String page,HttpServletRequest request, HttpSession session,
			Model model) {
		if(organizationNo == null) {
		String userId = (String) session.getAttribute("userId");
		User user=  this.userAccountService.getOneUserByPrimaryKey(userId);
		   organizationNo=user.getOrganizationno();
		}
		// 分页
				PageBean<Map> pageBean = new PageBean<Map>();

				int pageno = 1;
				if (page == null)
					pageno = 1;
				else
					pageno = Integer.parseInt(page);

				if (pageno < 1)
					pageno = 1;

				// 封装当前页数
				pageBean.setCurrPage(pageno);
				// 每页显示的数据条数
				pageBean.setPageSize(10);
				// 获取总记录数
		     
				int totalCount=this.voteUserService.voteTaskCountByOrganizationNo(organizationNo);
				// 封装总记录数
				pageBean.setTotalCount(totalCount);
				// 封装总页数
				Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
				pageBean.setTotalPage(num.intValue());
				
				List<Map> voteTasks=this.voteUserService.getVoteTaskByOrganizationNo(organizationNo);
				System.out.println(voteTasks);
				System.out.println(totalCount);
				// 封装数据
				pageBean.setLists(voteTasks);
				model.addAttribute("doc", pageBean);
				menuSide(session,model);
		return "school/userVoteTaskList";
	}
	
	// 2018.12.23, web端进入投票
		@RequestMapping("/intoVoteWebUI")
		public String intoVoteWebUI(Integer voteTaskId,String organizationNo,HttpSession session, HttpServletRequest request,
				Model model) {
			Votetask voteTask=this.voteUserService.selectByPrimaryKey(voteTaskId);
			if(organizationNo == null) {
				String userId = (String) session.getAttribute("userId");
				User user=  this.userAccountService.getOneUserByPrimaryKey(userId);
				   organizationNo=user.getOrganizationno();
				}			
            Voters voter=this.voteUserService.selectVoterByOrganizationNo(voteTaskId, organizationNo);
			if(voter.getVoterstate().trim().equals("已投")){
				return "redirect:/vote/intoWebVoteTaskListUi";
			}
            // 查询该手机是否投过票
			// voterTaskId 某次投票任务id
    		// 获取本次投票的所有候选人信息
    		List<VoteCandidate> listAllVoteCandidate = voteUserService.selectFromVoteCandidateByVoteTaskId(voteTaskId);
    		model.addAttribute("candidates", listAllVoteCandidate);
            
            model.addAttribute("voter", voter);
            model.addAttribute("voteTask", voteTask);
            menuSide(session,model);
			return "school/voteWebUI";
		}
		//投票
		@RequestMapping(value ="/submitVote", method = RequestMethod.POST)
		@ResponseBody
		public ResponseResult<Void> submitVote(Integer voterId,Integer voteTaskId,String choosenames,HttpSession session, HttpServletRequest request,
				Model model) {
			System.out.println("投票了");
			ResponseResult<Void> result = new ResponseResult<Void>();
			System.out.println(choosenames);
			//生成投票
			VoteResult voteResult=new VoteResult();
			voteResult.setVoteresult(choosenames);
			voteResult.setVotetaskid(voteTaskId);
			voteResult.setVotetime(new Date());
		    int row1=this.voteUserService.insertVote(voteResult);
		    System.out.println(voterId);
		    //更新投票状体
		    Voters voter=this.voteUserService.selectFromVotersByVoterId(voterId);
		    
		    voter.setVoterstate("已投");
		    int row2=this.voteUserService.updateVoterByPrimaryKeySelective(voter);
			if(row2>0) {
				result.setState(1);
				return result;
			}
			else {
				result.setState(-1);
				return result;
			}
		     
		}
		// 手机端，通过扫码进入投票登录界面
		@RequestMapping("/intoUserVoteMobile.do")
		public String intoUserVoteMobile(HttpServletRequest request, Model model, Integer voteTaskId,  HttpSession session) {

			Votetask voteTask=this.voteUserService.selectByPrimaryKey(voteTaskId);
 
			model.addAttribute("voteTask", voteTask);
			return "vote/vote-login";
		}
		
		// 手机端投票流程中的登录模块,手机端
		@RequestMapping("/voteLogin.do")
		public String login(User user, Integer voteTaskId,Model model, HttpServletRequest request, HttpSession session,
				RedirectAttributes redirectAttributes) {
			JSONObject result = this.userAccountService.userLogin(user.getUserid(), user.getPassword());
			System.out.println(user.getUserid() );
			System.out.println(result);

			if (result.getInt("status") == 1) {// 登录成功
				// 查询用户签到信息

				// 登录成功的话，先查询有无投票资格
				 user=  this.userAccountService.getOneUserByPrimaryKey(user.getUserid());
				 String organizationNo=user.getOrganizationno();
				 System.out.println(voteTaskId);
				 System.out.println(organizationNo);
 				// 获取投票任务
	            Voters voter=this.voteUserService.selectVoterByOrganizationNo(voteTaskId, organizationNo);
	            if(voter==null) {
	            	return "vote/voteNoneed";
	            }else if(voter.getVoterstate().trim().equals("已投")){//投过不可以再投
					return "vote/voteDone";
				}else {		
				
				Votetask voteTask=this.voteUserService.selectByPrimaryKey(voteTaskId);
				Date now=new Date();
				DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Date nowdate;
				try {
					nowdate = df.parse(now.toString());
		            Date deadline = df.parse(voteTask.getDeadline().toString());
					if(deadline.getTime() < nowdate.getTime()) {
						return "/vote/voteNoneed";
					}
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
	
		          // 查询该手机是否投过票
				// voterTaskId 某次投票任务id
	    		// 获取本次投票的所有候选人信息
	    		List<VoteCandidate> listAllVoteCandidate = voteUserService.selectFromVoteCandidateByVoteTaskId(voteTaskId);
	    		model.addAttribute("candidates", listAllVoteCandidate);
	            model.addAttribute("voter", voter);
	            model.addAttribute("voteTask", voteTask);
	            return "/vote/voteMobileUI";
	            }
		}else {
			//重新进入
			return "redirect:/vote/intoUserVoteMobile.do?voteTaskId="+voteTaskId;
		}		
    }
		
		//投票
				@RequestMapping(value ="/submitVoteMobile", method = RequestMethod.POST)
				@ResponseBody
				public ResponseResult<Void> submitVoteMobile(Integer voterId,Integer voteTaskId,String choosenames,HttpSession session, HttpServletRequest request,
						Model model) {
					System.out.println("投票了");
					ResponseResult<Void> result = new ResponseResult<Void>();
					System.out.println(choosenames);
					//生成投票
					VoteResult voteResult=new VoteResult();
					voteResult.setVoteresult(choosenames);
					voteResult.setVotetaskid(voteTaskId);
					voteResult.setVotetime(new Date());
				    int row1=this.voteUserService.insertVote(voteResult);
				    System.out.println(voterId);
				    //更新投票状体
				    Voters voter=this.voteUserService.selectFromVotersByVoterId(voterId);
				    
				    voter.setVoterstate("已投");
				    int row2=this.voteUserService.updateVoterByPrimaryKeySelective(voter);
					if(row2>0) {
						result.setState(1);
						return result;
					}
					else {
						result.setState(-1);
						return result;
					}
				     
				}
				

				public  void menuSide(HttpSession session,Model model) {
					String userId = (String)session.getAttribute("userId");
					User user=this.userAccountService.getOneUserByPrimaryKey(userId);
					//待提交文档任务数量
					Integer documentNums = userDocumentManageService.getUnsubmitDocumentCounts(user.getOrganizationid());
					//未投票数
					int unvoteTaskNum=this.voteUserService.unvoteTaskCountByOrganizationNo(user.getOrganizationno());
					// 这里要根据查询状态来查询总数,待报名总数
					int meetingNums = userMeetingManageService.getMeetingCount(user.getOrganizationid(), "未参加");
					String idUnreadState=String.valueOf(user.getOrganizationid()+":0");
					int unReadMsg=this.userMessageService.countUnreadMessageNum(userId, user.getOrganizationno(), user.getOrganizationid(), 0,idUnreadState);
		            model.addAttribute("documentNums", documentNums);
		            model.addAttribute("unvoteTaskNum", unvoteTaskNum);
		            model.addAttribute("meetingNums", meetingNums);
		            model.addAttribute("unReadMsg", unReadMsg);
		            //return "/school/navbar-side";
				}
}
