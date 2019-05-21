package edu.gd.ccp.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.gd.ccp.dao.VoteResultMapper;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.VoteCandidate;
import edu.gd.ccp.entity.Voters;
import edu.gd.ccp.entity.Votetask;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.VoteAdminService;
import edu.gd.ccp.util.EmailUtil;
import edu.gd.ccp.util.QRCodeTool;

@Controller
@Scope(value = "prototype")
@RequestMapping("/vote")
class VoteAdminController {
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;
	@Resource
	private VoteAdminService voteAdminService;
	@Resource
	private VoteResultMapper voteResultMapper;
	@Resource
	private UserAccountService userAccountService;
	// 进入投票任务发布页面
	@RequestMapping(value = "/goToPublishVoteTask")
	public String goToPublishVoteTask(Model model, HttpServletRequest request) {

		return "vote/votetask-publish";
	}

	// 生成投票任务
	@RequestMapping(value = "/newVoteTask")
	public String newVoteTask(String schoolLevel, String belong, String schoolType, String title, String introduction,
			String deadline, Integer candidatenumber, Integer maxchoosenumber, @RequestParam("accessory") MultipartFile accessory,
			Model model, HttpServletRequest request) {

		// 简单的设置文档的最大大小
		Long maxTemplateSize = (long) (5 * 1024 * 1024);
		if (!accessory.isEmpty()) {
			Long size = accessory.getSize();
			if (size > maxTemplateSize) {
				// TODO
				model.addAttribute("msg", "上传文件过大，请判断是否上传正确");
				System.out.println("上传文件过大，请判断是否上传正确");
				return "vote/votetask-publish";
			}
		}
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/view/doc/vote/");
		String filename = filePath + title + ".pdf";

		File fileDir = new File(filePath);
		// 2.3 在目录下创建文件
		File dest = new File(fileDir, title + ".pdf");

		// 2.4 如果重复，则删除
		File uploadfile = new File(filePath, title + ".pdf");
		if (uploadfile.exists())
			uploadfile.delete();

		// 2.5 写入文件
		try {
			accessory.transferTo(dest);
		} catch (IOException e) {
			e.printStackTrace();
		}
		Votetask voteTask = new Votetask();
		voteTask.setTitle(title);
		voteTask.setIntroduction(introduction);
		voteTask.setCandidatenumber(candidatenumber);
		voteTask.setMaxchoosenumber(maxchoosenumber);
		System.out.println("日期1："+deadline);
		deadline = deadline + " 00:00";
		Timestamp votedeadline = new Timestamp(System.currentTimeMillis());
		votedeadline = Timestamp.valueOf(deadline.replaceAll("T", " ") + ":00");
		System.out.println("日期2："+votedeadline);
		voteTask.setPublishdate(new Date());
		voteTask.setDeadline(votedeadline);
		String servername=request.getServerName();
		InetAddress address;
		int row=0;
		try {
			address = InetAddress.getLocalHost();
			String ip =  address.getHostAddress();
			String port = String.valueOf(request.getServerPort());
			String url="http://"+ip+":"+port;
			row = this.voteAdminService.publishVote(url,schoolLevel, belong, schoolType, voteTask);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}//获取的是本地的IP地址
 		return "redirect:/vote/voteTaskList";
	}

	// 投票任务列表
	@RequestMapping(value = "/voteTaskList")
	public String voteTaskList(String page, Model model, HttpServletRequest request) {
		int counts = this.voteAdminService.getVoteTaskCount();
		System.out.println(counts);
		PageBean<Map> pageBean = new PageBean<Map>();
		int pageno = 1;
		if (page != null)
			pageno = Integer.parseInt(page);
		if (pageno < 1)
			pageno = 1;
		// 封装当前页数
		pageBean.setCurrPage(pageno);
		// 每页显示的数据条数
		pageBean.setPageSize(10);
		pageBean.setTotalCount(counts);
		// 封装总页数
		Double num = Math.ceil(1.0 * counts / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());

		List<Map> voteTasks = this.voteAdminService
				.getVoteTaskList((pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
		// 封装数据
		pageBean.setLists(voteTasks);
		model.addAttribute("voteTasks", pageBean);
		return "vote/adminVoteTaskList";
	}

	// 进入投票结果 voteResult
	@RequestMapping(value = "/voteResult")
	public String voteResult(int votetaskid, Model model, HttpServletRequest request) {
		List<Map> results = this.voteAdminService.getVoteResultByTaskid(votetaskid);
		System.out.println(results);
		// 投票结果统计 ，候选人，票数
		Map<String, Integer> voteResult = new HashMap<String, Integer>();
		int count = 0;
		for (Map result : results) {
			if (result.get("voteResult") == null || result.get("voteResult").toString().trim().equals(""))
				continue;
			count++;
			String[] names = result.get("voteResult").toString().split(",");
			for (String name : names) {
				if (voteResult.get(name) == null)
					voteResult.put(name, 1);
				else {
					voteResult.put(name, voteResult.get(name) + 1);
				}
			}
		}

		String titles = "";
		String count1 = "";
//		System.out.println(voteResult);

		for (String key : voteResult.keySet()) {
			if (key.trim().equals(""))
				continue;
			titles = titles + ",'" + key + "'";
			count1 = count1 + "," + voteResult.get(key);

		}
		if (!titles.equals(""))
			titles = titles.substring(1, titles.length());
		if (!count1.equals(""))
			count1 = count1.substring(1, count1.length());
//		System.out.println(titles);
//		System.out.println(count1);
		List<Map> voterList=this.voteAdminService.selectVoterByVoteTaskId(votetaskid);
        Map voteCount=this.voteAdminService.voteTaskCountByVoteTaskId(votetaskid);
        model.addAttribute("voterList", voterList);
        model.addAttribute("voteCount", voteCount);
		model.addAttribute("titles", titles);
		model.addAttribute("count1", count1);
		model.addAttribute("count", count);
		return "vote/voteResult";
	}

	// 投票任务的候选人
	@RequestMapping(value = "/voteCandidateList")
	public String voteCandidateList(Integer votetaskid, Model model, HttpServletRequest request) {
		List<Map> candidaters = this.voteAdminService.getVoteCandidateByTaskid(votetaskid);
		model.addAttribute("candidaters", candidaters);
		model.addAttribute("votetaskid", votetaskid);
		return "vote/addVotecandidate";
	}

	// 投票任务的候选人
	@RequestMapping(value = "/addCandidate", method = RequestMethod.POST)
	public String addCandidate(Integer votetaskid, VoteCandidate voteCandidate, Model model,
			HttpServletRequest request) {
		int row = this.voteAdminService.addCandidate(voteCandidate);
		return "redirect:/vote/voteCandidateList?votetaskid=" + votetaskid;
	}

	// 删除候选人
	@RequestMapping(value = "/deleteCandidate", method = RequestMethod.GET)
	public String deleteCandidate(Integer votetaskid, Integer candidateid, Model model, HttpServletRequest request) {
		int row = this.voteAdminService.deleteCandidate(candidateid);
		System.out.println(candidateid + "" + row);
		return "redirect:/vote/voteCandidateList?votetaskid=" + votetaskid;
	}

	// 生成投票二维码
	@RequestMapping(value = "/genVoteUrl", method = RequestMethod.GET)
	public String genVotes(Integer votetaskid, Model model, HttpServletRequest request) {
		List<Map> votes = this.voteAdminService.getVoteResultByTaskid(votetaskid);
		System.out.println(votes);
		model.addAttribute("votes", votes);
		return "vote/code";
	}

	/**
	 *  *
	 * <p>
	 * 二维码内容
	 * </p>
	 *  * @Description:  * @param request  * @param response  * @throws Exception
	 */
	@RequestMapping("/getQRCode")
	public void getQRCode(Integer resultId, HttpServletRequest request, HttpServletResponse response, Model model)
			throws Exception {
		InetAddress address = InetAddress.getLocalHost();
		String hostAddress = address.getHostAddress();
		String url = "http://" + hostAddress + ":8080/gdeduccp/vote/intoVoteInteface.do?resultId=" + resultId;
		encode(url, response);
	}

	/**
	 *  *
	 * <p>
	 * 生成二维码输出页面
	 * </p>
	 *  * @Description:  * @param content  * @param response  * @throws Exception
	 */
	public static void encode(String content, HttpServletResponse response) throws Exception {
		BufferedImage image = QRCodeTool.createImage(content);
		ImageIO.write(image, QRCodeTool.FORMAT_NAME, response.getOutputStream());
	}
	
	// 生成投票二维码,进入投票登录界面
	@RequestMapping("/getVoteQRCodeMobile")
	public void getVoteQRCodeMobile(Integer voteTaskId,String organizationNo, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {
		String servername=request.getServerName();
		InetAddress address = InetAddress.getLocalHost();//获取的是本地的IP地址
 		String ip =  address.getHostAddress();
		String url = "http://"+ip+":"+request.getServerPort()+"/gdeduccp/vote/intoUserVoteMobile.do?voteTaskId="+voteTaskId+"&organizationNo="+organizationNo;

		encode(url, response);
	}
	//删除投票任务
	@RequestMapping(value="/doDeleteVoteTask",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> doDeleteVoteTask(int voteTaskId) {
		//删除投票任务列表
		int row2 =this.voteAdminService.deleteVoterByVoterTaskId(voteTaskId);
		//删除投票任务
		int row=this.voteAdminService.deleteVoterTaskByPrimaryKey(voteTaskId);
		//删除所有该会议的参会任务
		 
		ResponseResult<Void> result = new ResponseResult<Void>();
		if (row >0)
			result.setState(ResponseResult.State_OK);
		else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}
	// 提醒投票
		@RequestMapping(value = "/voteRemind")
		public String voteRemind(Integer votetaskid, Model model, HttpServletRequest request) {
			// 获取所有参会任务
			List<Map> voterList=this.voteAdminService.selectVoterByVoteTaskId(votetaskid);			
			for (Map voter : voterList) {
				// 已投票的不提醒
				if (voter.get("voterState").equals("已投"))
					continue;
				Integer voterId=Integer.parseInt(voter.get("voterId").toString());
				Voters voter1=this.voteAdminService.selectByPrimaryKey(voterId);
				Integer remind = voter1.getRemind();
				if (remind == null)
					remind = 0;
				voter1.setRemind(remind + 1);
				// 更新提醒次数
				int result2 = this.voteAdminService.updateByPrimaryKeySelective(voter1);

				// 获取该单位所有用户
				List<User> users = this.userAccountService.selectUsersByIdOrNo(voter1.getOrganizationno(), null);
				for (User user : users) {
					String email = user.getEmail();
					String title = "投票任务温馨提醒";
					String servername = request.getServerName();
					InetAddress serveraddress;
					String url = "";
					String ip = "";
					try {
						serveraddress = InetAddress.getLocalHost();
						ip = serveraddress.getHostAddress();
						url = "http://" + ip + ":" + request.getServerPort();
					} catch (UnknownHostException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} // 获取的是本地的IP地址
					//发给单位的每个用户
					String content=voter.get("organizationName")+"<br>,贵单位有一项投票任务"+ voter.get("title") +"， 请收到邮件后进入网站投票， "+url+"/gdeduccp/<br>";
					content=content+ "<br><a href='"+url+"/gdeduccp/doc/vote/"+ voter.get("title") +".pdf' target=_blank>下载投票说明</a><br>";
					content=content+ "<br><a href='"+url+"/gdeduccp/vote/intoUserVoteMobile.do?voteTaskId="+voter.get("voteTaskId")+"&organizationNo="+voter.get("organizationNo")+"'>手机投票</a>";
 
					if (email != null && !email.trim().equals("")) {
						EmailUtil.sendMail(title, email, content);
					}
				}
			}
			return "redirect:/vote/voteResult?votetaskid="+votetaskid;
		}
}
