package edu.gd.ccp.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.Page;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.AdminMessageService;
import edu.gd.ccp.service.AdminOrgazationService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.service.UserMeetingManageService;
import edu.gd.ccp.service.UserMessageService;
import edu.gd.ccp.service.VoteUserService;
import edu.gd.ccp.util.JacobOfficeUtil;
import edu.gd.ccp.util.copyDocument;
import edu.gd.ccp.util.downloadDocument;

@Controller
@Scope(value = "prototype")
@RequestMapping("/school")
public class SchoolUserController {
	@Resource
	private AdminDocumentManageService adminDocumentManageService;
	@Resource
    private UserDocumentManageService userDocumentManageService;
	@Resource
	private AdminOrgazationService orgazationService;
	@Resource
	private UserAccountService userAccountService;	
	@Resource
	VoteUserService voteUserService;
	@Resource
	private UserMeetingManageService userMeetingManageService;	
	@Resource
	private UserMessageService userMessageService;
 
	
	@RequestMapping("/intoDocumentTask.do")
	public String goIntoDocumentTask() {
		System.out.println("进入school控制器");
		return "school/documenttask";
		//return "forward:school/documenttask.jsp";
	}
	
	@RequestMapping("/intoUploadDocument.do")
	public String goIntoUploadDocument(Integer docId, 
			HttpSession session, 
			Model model,
			String docTitle) {
		System.out.println("进入school提交文档页面");
		String userId = (String) session.getAttribute("userId");
		
		//int organizationId = userDocumentManageService.getOrganizationId(userId);
		
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		System.out.println(docId);
		String documentType = userDocumentManageService.getDocumentType(docId);
		Document document=adminDocumentManageService.getDocumentById(docId);
		model.addAttribute("organizationName",organizationName);
		model.addAttribute("documentType",documentType);
		//attributes.addAttribute("docId", docId);
		model.addAttribute("docId",docId);
		model.addAttribute("docTitle", document.getTitle());
		menuSide(session,model);
		return "school/docu-reporting";
	}
	
	/** 列出所有该组织的未提交的文档  */
	@RequestMapping("/listUnsubmitDocument.do")
	public String unsubmitDocument(Model model, HttpSession session, String page) {
		String userId = (String) session.getAttribute("userId");

		int organizationId = userDocumentManageService.getOrganizationId(userId);

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
		Integer documentNums = userDocumentManageService.getUnsubmitDocumentCounts(organizationId);
        if(documentNums==null)
        	documentNums=0;
		// 封装总记录数
		int totalCount = documentNums;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());

		System.out.println("封装总记录数:" + totalCount);
		System.out.println("封装总页数:" + num);

		List<Map> unsubmitD = userDocumentManageService.listUnsubmitDocumentByOrganizationId
				((pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(), organizationId);
//        System.out.println(unsubmitD);
		// 封装数据
		pageBean.setLists(unsubmitD);
		
		model.addAttribute("pageBean", pageBean);
		menuSide(session,model);
		return "school/docu-toreport";
	}
	
	/**  列出所有该组织的文档  */
	@RequestMapping("/listAllDocument.do")
	public String listALlDocument(Model model, HttpSession session, String page) {
		String userId = (String) session.getAttribute("userId");

		int organizationId = userDocumentManageService.getOrganizationId(userId);

		System.out.println("***********所查询的页数是：" + page);
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
		int documentNums = userDocumentManageService.getDocumentCounts(organizationId);

		// 封装总记录数
		int totalCount = documentNums;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());
//
//		System.out.println("封装总记录数:" + totalCount);
//		System.out.println("封装总页数:" + num);

		List<Map> documents = userDocumentManageService.listDocumentsByOrganizationId(
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(), organizationId);

		// 封装数据
		pageBean.setLists(documents);
		menuSide(session,model);
		model.addAttribute("doc", pageBean);

		return "school/docu-list";
	}
	
	@RequestMapping(value = "/uploadDocument.do", method = RequestMethod.POST)
	public String uploadDocument(HttpServletRequest request, 
			@RequestParam("accessory") MultipartFile accessory,
			HttpSession session,
			Model model,
			Integer docId,String modify) {
		/** 生成文件名：学校+文档编号.docx  
		 *  同时生成html： 学校+文档编号.html
		 *  并复制一个备份文件 学校+文档编号+backup.docx 
		 *  均在“doc/+文档编号/”目录下
		 *  上传时先判断有无“doc/+文档编号/”目录，如果没有，先创建一个该目录
		 */
		
		//  简单的设置文档的最大大小
		Long maxTemplateSize = (long) (5*1024*1024);
		if(!accessory.isEmpty())
		{
			Long size = accessory.getSize();
			if (size>maxTemplateSize) {
				// TODO
				model.addAttribute("msg","上传文件过大，请判断是否上传正确");
				return "redirect:/school/intoUploadDocument.do?docId="+docId;
			}
		}
		
		
		// 1.1 获得学校名
		String userId = (String)session.getAttribute("userId");
		System.out.println("用户id是：" + userId);
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		// 1.2 获得文档任务编号(目录名)
		String documentNo = userDocumentManageService.getDocumentNo(docId);
		
		// 2.1 对应目录下创建存储文档的文件夹
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "/");
		
		File fileDir = new File(filePath);  
		
		if(!fileDir.exists()) {
			Boolean result=fileDir.mkdirs();
			}
		// 2.2 获取上传文件的原名 getOriginalFilename()		
		String originalFilename = accessory.getOriginalFilename();
		// 2.3 在目录下创建文件
		File dest = new File(fileDir, originalFilename);
		// 2.4 如果重复，则删除
		File uploadfile = new File(filePath , originalFilename);
		if(uploadfile.exists())
			uploadfile.delete();		

		// 2.5 写入文件
		try {
			accessory.transferTo(dest);
		} catch (IOException e) {
			e.printStackTrace();
			// 返回错误页面
			return "error";
		}
		

		
		// 3.1 获取客户上传的原始的文件的扩展名
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
		System.out.println("suffix:" + suffix);
		
		// 3.2生成文件名
		String originalFileName_2 = originalFilename.substring(0, originalFilename.indexOf(".")) + ".docx";
		String fileName = organizationName + documentNo + ".docx";
		System.out.println("上传文件中……");
		System.out.println("上传路径为" + filePath);
		System.out.println("文档重命名为：" + fileName);
						
		String fileName_bUp = organizationName + documentNo + "backup" + ".docx";
	
		
		// 3.3 更改为docx格式
		if(suffix == "doc") {
			//doc转为docx
			try {
				JacobOfficeUtil.convertDocFmt
				(filePath + originalFilename, filePath + originalFileName_2, 12);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		// 3.4更改文件名
		File oldfile = new File(filePath , originalFilename);
		File newfile = new File(filePath , fileName);
		//删除重复数据
		if(newfile.exists())
			newfile.delete();
		oldfile.renameTo(newfile);
		
		// 4.1备份上传的文件
		File copyFile = new File(filePath , fileName_bUp);
		if(copyFile.exists())
			copyFile.delete();
		
		try {
			//在copyDocument仿照了一个复制的类
			copyDocument.copyDocu2(fileName, filePath, fileName_bUp);
			
		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		
		// 5.1 生成在线观看文件,转为html
		//ChageFormat("d:\\cod\\","1.docx");
//		String htmlName=organizationName + documentNo + ".html";
		//转换备份文件，用于领导查看
		Boolean result=JacobOfficeUtil.ChageFormat(filePath , fileName_bUp);
		//转换原始文件，供管理员查看
		Boolean result2=JacobOfficeUtil.ChageFormat(filePath , fileName);
		System.out.println(filePath + fileName);
		System.out.println("文档转化为HTML结果：" + result);

		// 6.1 更新数据库
		if(modify!=null)
		    userDocumentManageService.uploadDocument(userId, docId, fileName,"修改待审");
		else
			userDocumentManageService.uploadDocument(userId, docId, fileName,"待审");
	
		model.addAttribute("msg","上传成功");
		menuSide(session,model);
		return "redirect:/school/listAllDocument.do";
	}
	

	@RequestMapping(value = "downloadDocument.do",method=RequestMethod.GET)
	public void downloadDocument(HttpSession session, 
			Integer docId,
			HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		
		// 1 获得文档位置
		String userId = (String)session.getAttribute("userId");
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		String documentNo = userDocumentManageService.getDocumentNo(docId);
//		String fileName = organizationName + documentNo + ".docx";
		// 2 获得文档名
		String fileName = userDocumentManageService.getAccessory(docId);
		
		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "\\") +"\\" +  fileName;
		
		// 将下载方法写在工具类里
		downloadDocument.download(path, fileName,response);
	}
	
	@RequestMapping("/downloadTemplateAccessory.do")
	public void downloadTemplate(HttpSession session, 
			Integer docId,
			HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		
		String templateAccessory = userDocumentManageService.downloadTemplateDocument(docId);
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/")+templateAccessory;
		System.out.println(filePath+templateAccessory);
		downloadDocument.download(filePath, templateAccessory,response);
	}
	
	// 用户在线查看文档
	// 尚未验证，有待考虑
	@RequestMapping("browseDocumentOnline.do")
	public String browseDocumentOnline(HttpSession session,
			Model model,
			Integer docId,
			HttpServletRequest request) {
		
		// 1 获得html位置
		
		String documentNo = userDocumentManageService.getDocumentNo(docId);
//		String fileName = organizationName + documentNo + ".docx";
		// 2 获得文档名
		String fileName = userDocumentManageService.getAccessory(docId);
		// 3 获得前缀名
		fileName = fileName.substring(0, fileName.indexOf("."));
		// 4 获得html名
		String htmlName = fileName + ".html";
		
		request.getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "\\");
		
		return request + fileName;
	}
	
	// 用户进入修改文档界面
	@RequestMapping("intoModifyDocument.do")
	public String intoModifyDocument(HttpServletRequest request,
			HttpSession session,
			Model model,
			Integer docId,
			String docTitle,
			String docState) {
		
		String userId = (String)session.getAttribute("userId");
		System.out.println("userId:" + userId);
		String documentType = userDocumentManageService.getDocumentType(docId);
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		String suggest= userDocumentManageService.getSuggest(docId);
		
		model.addAttribute("organizationName",organizationName);
		model.addAttribute("suggest", suggest);
		model.addAttribute("documentType",documentType);
		model.addAttribute("docTitle",docTitle);
		model.addAttribute("docState",docState);
		model.addAttribute("docId",docId);
		
		return "school/docu-toaudit";
	}
	
	// 包括了未审核的修改和退回文档的修改
	@RequestMapping("modifyDocument.do")
	public void modifyDocument(HttpServletRequest request, 
				@RequestParam("accessory") MultipartFile accessory,
				HttpSession session,
				Model model,
				Integer docId) {
		/** 1.删除原来的文档和备份文档
		* 	2.删除html文件
		*	3.更新数据库
		*	4.上传文档，复制
		*	5.生成html文件
		*	6.更新数据库 
		*/
		
		// 1.1 获得学校名
		String userId = (String)session.getAttribute("userId");
//		System.out.println("用户id是：" + userId);
//		String organizationName = userDocumentManageService.getOrganizationName(userId);
//		// 1.2 获得文档任务编号(目录名)
//		String documentNo = userDocumentManageService.getDocumentNo(docId);
//				
//		// 2.1 对应目录下创建存储文档的文件夹
//		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "\\");
//		// 2.2 获得文档名
		String fileName = userDocumentManageService.getAccessory(docId);
//		// 2.3 删除源文件
//		File uploadfile = new File(filePath , fileName);
//		if(uploadfile.exists())
//			uploadfile.delete();
//		
//		// 2.4 获取文件名前称，如111.doc中的111
//		String prefix = fileName.substring(0, fileName.indexOf("."));
//		
//		
//		// 2.5 删除备份文件
//		String backUpFileName = prefix + "BackUp" + ".docx";
//		File backUpfile = new File(filePath , backUpFileName);
//		if(backUpfile.exists())
//			backUpfile.delete();
//		
//		// 2.6 删除html文件
//		String htmlFileName = prefix + ".html";
//		File htmlfile = new File(filePath , htmlFileName);
//		if(htmlfile.exists())
//			htmlfile.delete();
//		
//		// 2.7 删除html附属的文件夹(!)
//		// example : 北京理工大学珠海学院党建工作2018.files
//		String htmlFilePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/") + documentNo + "\\" + prefix + ".files";
//		File dir = new File(htmlFilePath);
//		if (dir.isDirectory()) {
//            String[] children = dir.list();
//            //递归删除目录中的文件
//            for (int i=0; i<children.length; i++) {
//            	 File temp = new File(htmlFilePath + children[i]);  
//            	 temp.delete();
//            }
//		}
//		dir.delete();
        
		// 3.更新数据库
		userDocumentManageService.deleteDocument(userId, docId, fileName);
		
		// 4.上传文档，复制
		// 5.生成html文件
		// 6.更新数据库
		
		// 调用之前的上传文件的方法
		// 结束后跳转到docu-list.jsp
		uploadDocument(request, accessory, session, model, docId,"modify");
		
	}
	
	@RequestMapping("intoReturnDocument.do")
	public String returnDocument(HttpSession session,
			Model model,
			Integer docId,
			String docTitle,
			String docState) {
		
		String userId = (String)session.getAttribute("userId");
		System.out.println("userId:" + userId);
		String documentType = userDocumentManageService.getDocumentType(docId);
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		String suggest= userDocumentManageService.getSuggest(docId);
		
		model.addAttribute("docId", docId);
		model.addAttribute("documentType",documentType);
		model.addAttribute("organizationName", organizationName);
		model.addAttribute("docTitle", docTitle);
		model.addAttribute("docState", docState);
		model.addAttribute("suggest", suggest);
		return "school/docu-return";
	}
	
	
	// 进入发送消息页面
	@RequestMapping("/intoOrganizationModifyUi")
	public String intoOrganizationModifyUi(HttpSession session,Model model) {
		String userId = (String)session.getAttribute("userId");
		User user=this.userAccountService.getOneUserByPrimaryKey(userId);
		Organization organization=this.orgazationService.getOrganizationById(user.getOrganizationid());
		model.addAttribute("organization", organization);
		return "/school/organizationModify";
	}
	// 进入发送消息页面
	 
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
		
		// 进入发送菜单列表页面
		@RequestMapping("/intoMenuSide")
		public  String intoMenuSide(HttpSession session,Model model) {
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
             return "/school/navbar-side";
		}
}
