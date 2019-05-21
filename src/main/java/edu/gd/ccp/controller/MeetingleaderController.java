package edu.gd.ccp.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.MeetingTask;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminMeetingManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserMeetingManageService;
import edu.gd.ccp.util.EmailUtil;
import edu.gd.ccp.util.ExcelUtil;
import edu.gd.ccp.util.QRCodeTool;
import edu.gd.ccp.util.QRCodeUtil;

@Controller
@Scope(value = "prototype")
@RequestMapping("/admin")

public class MeetingleaderController {
	@Resource
	private AdminMeetingManageService meetingService;
	@Resource
	private UserMeetingManageService userMeetingManageService;
	@Resource
	private UserAccountService userAccountService;
	
	@RequestMapping("/createMeetingCode.do")
	public String createCode(int meetingId, Model model, HttpServletRequest request) {
		// 将二维码放在新建的文件夹下,对应的二维码命名为${meetingId}.png
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/QRCode/") + meetingId + ".png";
		File fileDir = new File(filePath);
		// 如果不存在该二维码，则生成
		if (!fileDir.exists()) {
			fileDir.mkdirs();
			// 项目布置地址，
			String ipAddress = "http://202.116.195.79/gdeduccp/schoolMeeting/intoMeetingLogin.do";

			// 二维码内容
			String QRCodeData = ipAddress + "?meetingId=" + meetingId;

			try {
				QRCodeUtil.qrCodeEncode(QRCodeData, "QRCode" + meetingId);
			} catch (IOException e) {
				// TODO 自动生成的 catch 块
				e.printStackTrace();
			}
		}

		return "";
	}

	@RequestMapping("/intoPublishMeeting")
	public String intoPublishMeeting() {
		return "/admin/meeting_publish";
	}

	@RequestMapping(value = "/doPublishMeeting", method = RequestMethod.POST)
	@ResponseBody
	public ResponseResult<Void> doPublishMeeting(HttpServletRequest request, String meetingNo, String meetingTime,
			String deadline, String meetingTitle, String meetingAddresses, String schoolLevel, String belong,
			String schoolType, String meetingCont, Byte email, Byte telephone, Byte duty, Byte jobTitle, Byte sex,
			Byte stay, Byte invoiceContent, Byte address, @RequestParam("accessory") MultipartFile accessory,
			Model model, HttpSession session) {

		System.out.println(schoolType);
		meetingTime = meetingTime + " 00:00";
		System.out.println(meetingTime);
		ResponseResult<Void> result = new ResponseResult<Void>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
		Timestamp meetingtime = new Timestamp(System.currentTimeMillis());
		System.out.println(meetingtime);
		meetingtime = Timestamp.valueOf(meetingTime.replaceAll("T", " ") + ":00");
		System.out.println(meetingtime);
		deadline = deadline + " 00:00";
		Timestamp meetingdeadline = new Timestamp(System.currentTimeMillis());
		meetingdeadline = Timestamp.valueOf(deadline.replaceAll("T", " ") + ":00");
		System.out.println(meetingdeadline);
		Meeting meeting = new Meeting();
		meeting.setMeetingtitle(meetingTitle);
		meeting.setMeetingno(meetingNo);
		meeting.setPublishdate(new Date());
		meeting.setMeetingtime(meetingtime);
		meeting.setEnrolldeadline(meetingtime);
		meeting.setMeetingaddresses(meetingAddresses);
		meeting.setEmail(email);
		meeting.setTelephone(telephone);
		meeting.setDuty(duty);
		meeting.setJobtitle(jobTitle);
		meeting.setSex(sex);
		meeting.setStay(stay);
		meeting.setInvoicecontent(invoiceContent);

		String userId = "";
		if (session.getAttribute("userId") != null) {
			userId = session.getAttribute("userId").toString();
			meeting.setPublishuserid(userId);
		}

		// 简单的设置文档的最大大小
		Long maxTemplateSize = (long) (5 * 1024 * 1024);
		if (!accessory.isEmpty()) {
			Long size = accessory.getSize();
			if (size > maxTemplateSize) {
				// TODO
				model.addAttribute("msg", "上传文件过大，请判断是否上传正确");
				result.setState(-1);
				return result;
			}
		}
		String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/view/doc/meeting/");
		String filename = filePath + meetingNo + ".pdf";

		File fileDir = new File(filePath);
		// 2.3 在目录下创建文件
		File dest = new File(fileDir, meetingNo + ".pdf");

		// 2.4 如果重复，则删除
		File uploadfile = new File(filePath, meetingNo + ".pdf");
		if (uploadfile.exists())
			uploadfile.delete();

		// 2.5 写入文件
		try {
			accessory.transferTo(dest);
		} catch (IOException e) {
			e.printStackTrace();
			result.setState(-1);
			// 返回错误页面
			return result;
		}
		meeting.setMeetingcontent(meetingCont);
		String servername = request.getServerName();
		InetAddress serveraddress;
		try {
			serveraddress = InetAddress.getLocalHost();
			String ip = serveraddress.getHostAddress();
			String url = "http://" + ip + ":" + request.getServerPort();
			int result1 = meetingService.publishMeeting(url, meeting, schoolLevel, belong, schoolType);
			result.setState(result1);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // 获取的是本地的IP地址

		// if (result1 == 1) {
		// result.setState(1);
		// } else {
		// result.setState(-2);
		//
		// }
		return result;
	}

	@RequestMapping(value = "/doDeleteMeeting", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> doDeleteMeeting(int meetingId) {
		int row = meetingService.delectMeeting(meetingId);
		// 删除所有该会议的参会任务
		int row2 = meetingService.deletMeetingTaskByMeetingId(meetingId);
		ResponseResult<Void> result = new ResponseResult<Void>();
		if (row > 0)
			result.setState(ResponseResult.State_OK);
		else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	@RequestMapping("/intoManageMeeting")
	public String intoManageMeeting(String page, String meetingNo, String meetingTitle, Model model) {
		if (meetingTitle != null)
			if (meetingTitle.trim().equals(""))
				meetingTitle = null;
		PageBean<Map> pageBean = new PageBean<Map>();
		int pageno = 1;
		if (page == null)
			pageno = 1;
		else
			pageno = Integer.parseInt(page);
		if (pageno < 1)
			pageno = 1;
		// System.out.println("pageno:"+pageno);
		// 封装当前页数
		pageBean.setCurrPage(pageno);
		// 每页显示的数据条数
		pageBean.setPageSize(10);
		List<Map> meetings = this.meetingService.getMeetingsByTitle(meetingNo, meetingTitle,
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize());
		int recCount = this.meetingService.getMeetingCountByTitle(meetingNo, meetingTitle);
		pageBean.setTotalCount(recCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * recCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());
		// 封装数据
		pageBean.setLists(meetings);
		model.addAttribute("meetings", pageBean);
		return "/admin/meeting-manage";
	}

	// ~~~~12月新增!@~!~~!!~

	@RequestMapping("/getMeetingsByTitle")
	@ResponseBody
	public ResponseResult<List<Meeting>> getMeetingsBytitle(String meeetingNo, String title) {
		ResponseResult<List<Meeting>> result = new ResponseResult<List<Meeting>>();
		List<Map> list = meetingService.getMeetingsByTitle(meeetingNo, title, 0, 10);
		if (list != null) {
			result.setState(ResponseResult.State_OK);
			// result.setData(list);
			result.setMessage("成功返回数据~~");
			return result;
		}
		result.setData(null);
		result.setState(ResponseResult.State_ERR);
		result.setMessage("获取数据失败，请稍后再试");
		return result;
	}

	@RequestMapping("/getAllMeetings")
	@ResponseBody
	public ResponseResult<List<Meeting>> getAllMeetings() {
		ResponseResult<List<Meeting>> result = new ResponseResult<List<Meeting>>();
		System.out.println("~~~~~~~~~~~~~~~~~~~~~~");
		List<Meeting> list = meetingService.getAllMeetings();
		if (list != null) {
			result.setState(ResponseResult.State_OK);
			result.setData(list);
			result.setMessage("成功返回数据~~");
			return result;
		}
		result.setData(null);
		result.setState(ResponseResult.State_ERR);
		result.setMessage("获取数据失败，请稍后再试");
		return result;
	}

	// 生成会议二维码
	@RequestMapping("/getMeetingQRCode")
	public void getMeetingQRCode(Integer meetingId, HttpServletRequest request, HttpServletResponse response,
			Model model) throws Exception {
		String servername = request.getServerName();
		InetAddress address = InetAddress.getLocalHost();// 获取的是本地的IP地址
		String ip = address.getHostAddress();
		String url = "http://" + ip + ":" + request.getServerPort()
				+ "/gdeduccp/schoolMeeting/intoMeetingLogin.do?meetingId=" + meetingId;

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

	// 获取某次会议参加情况
	@RequestMapping("/getMeetingDetails")
	public String getMeetingDetails(int meetingId, Model model, HttpServletRequest request) {
		Meeting meeting = this.meetingService.selectByPrimaryKey(meetingId);
		List<Map> meetingTasks = this.meetingService.getMeetingAtendanceState(meetingId);
		List<Map> meetingAttendees = this.meetingService.getMeetAttendeesByMeetingId(meetingId);
		model.addAttribute("meetingTasks", meetingTasks);
		model.addAttribute("meeting", meeting);
		model.addAttribute("meetingAttendees", meetingAttendees);

		List<String> header = new ArrayList<>(); // 第一行标题数据
		header.add("单位名称");
		header.add("参会人");
		header.add("性别");
		header.add("职务");
		header.add("职称");
		header.add("电话");
		header.add("邮件");
		header.add("是否住宿");
		header.add("发票内容");
		header.add("邮寄地址");
		List<List<String>> body = new ArrayList<>();

		for (Map doc : meetingAttendees) {
			List<String> data1 = new ArrayList<>(); // 第二行数据
			data1.add(doc.get("organizationName").toString());
			if (doc.get("attendeeName") != null)
				data1.add(doc.get("attendeeName").toString());
			else
				data1.add("");
			if (doc.get("sex") != null)
				data1.add(doc.get("sex").toString());
			else
				data1.add("");
			if (doc.get("duty") != null)
				data1.add(doc.get("duty").toString());
			else
				data1.add("");
			if (doc.get("jobTitle") != null)
				data1.add(doc.get("jobTitle").toString());
			else
				data1.add("");
			if (doc.get("telephone") != null)
				data1.add(doc.get("telephone").toString());
			else
				data1.add("");
			if (doc.get("email") != null)
				data1.add(doc.get("email").toString());
			else
				data1.add("");
			if (doc.get("stay") != null)
				data1.add(doc.get("stay").toString());
			else
				data1.add("");
			if (doc.get("invoicecontent") != null)
				data1.add(doc.get("invoicecontent").toString());
			else
				data1.add("");
			if (doc.get("address") != null)
				data1.add(doc.get("address").toString());
			else
				data1.add("");
			body.add(data1);
		}

		String absPath = request.getSession().getServletContext().getRealPath("/");
		String filename = absPath + "WEB-INF\\view\\doc\\xls\\meeting" + meeting.getMeetingno() + ".xls";

		try (OutputStream out = new FileOutputStream(filename) // 输出目的地
		) {
			ExcelUtil.generateExcel("文档提交统计", header, body, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "/admin/meetingDetails";

	}

	// 按高校统计
	@RequestMapping(value = "/meetingStatBySchool")
	public String meetingStatBySchool(String meetingNo, String organizationName, String organizationType, String belong,
			String schoolLevel, Model model, HttpServletRequest request) {
//		System.out.println(meetingNo);
//		System.out.println(organizationName);
//		System.out.println(organizationType);
//		System.out.println(schoolLevel);
//		System.out.println(belong);
		// 获取各学校应交文档
		List<Map> docCounts = this.meetingService.getMeetingAtendanceStatistics(meetingNo, organizationType,
				organizationName, belong, schoolLevel);
		List<String> header = new ArrayList<>(); // 第一行标题数据
		header.add("代码");
		header.add("高校");
		header.add("主管部门");
		header.add("办学层次");
		header.add("办学性质");
		header.add("组织关系");
		header.add("应参次数");
		header.add("已参次数");
		header.add("参加人次");
		header.add("提醒次数");
		List<List<String>> body = new ArrayList<>();

		for (Map doc : docCounts) {
			List<String> data1 = new ArrayList<>(); // 第二行数据
			data1.add(doc.get("organizationNo").toString());
			data1.add(doc.get("organizationName").toString());
			data1.add(doc.get("supervisorDepartment").toString());
			data1.add(doc.get("schoolLevel").toString());
			data1.add(doc.get("organizationType").toString());
			data1.add(doc.get("belong").toString());
			data1.add(doc.get("count1").toString());
			data1.add(doc.get("count2").toString());
			data1.add(doc.get("totalNumber").toString());
			data1.add(doc.get("remindNumber").toString());
			
			body.add(data1);
		}

		String absPath = request.getSession().getServletContext().getRealPath("/");
		String filename = absPath + "WEB-INF\\view\\doc\\xls\\meetingStatistics.xls";

		try (OutputStream out = new FileOutputStream(filename) // 输出目的地
		) {
			ExcelUtil.generateExcel("参加会议统计", header, body, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 获取各学校未交文档
		model.addAttribute("docCounts", docCounts);
		return "admin/meetingStatistics";
	}

	// 提醒会议报名
	@RequestMapping(value = "/meetingRemind")
	public String meetingRemind(Integer meetingId, Model model, HttpServletRequest request) {
		// 获取所有参会任务
		List<MeetingTask> meetingTasks = this.meetingService.selectAllMeetingTaskByMeetingId(meetingId);
		for (MeetingTask meetingTask : meetingTasks) {
			// 已报名的不提醒
			if (meetingTask.getAttendeenumber() > 0)
				continue;
			Integer remind = meetingTask.getRemind();
			if (remind == null)
				remind = 0;
			meetingTask.setRemind(remind + 1);
			// 更新提醒次数
			int result2 = this.userMeetingManageService.updateByPrimaryKeySelective(meetingTask);

			// 获取该单位所有用户
			List<User> users = this.userAccountService.selectUsersByIdOrNo(null, meetingTask.getOrganizationid());
			for (User user : users) {
				String email = user.getEmail();
				String title = "会议报名温馨提醒";
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
				String content=user.getUsername() +"<br>,贵单位有一项会议报名参加任务，请收到邮件后进入网站上报参加人员。<br>web端报名地址：<a href='"+url+"/gdeduccp/' target=_blank>web端登录后报名</a>"+"<br>";
				 content=content+ "手机会议报名地址： <a href='"+url+"/gdeduccp/schoolMeeting/intoMeetingLogin.do?meetingId=" + meetingTask.getMeetingid()+"'>手机报名</a>";
				content=content+ "<br><a href='"+url+"/gdeduccp/doc/meeting/"+ meetingTask.getMeetingno() +".pdf' target=_blank>下载会议通知</a><br>";

			//	  content = user.getUsername() + ":<br>贵单位有一个会议需要报名参加，请登录网站后报名，<a href='" + url
			//			+ "/gdeduccp/'>前去会议报名</a>";
				if (email != null && !email.trim().equals("")) {
					EmailUtil.sendMail(title, email, content);
				}
			}
		}
		return "redirect:/admin/getMeetingDetails?meetingId="+meetingId;
	}
}
