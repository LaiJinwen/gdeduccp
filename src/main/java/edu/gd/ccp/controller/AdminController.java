package edu.gd.ccp.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.DocMergeCondation;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.util.EmailUtil;
import edu.gd.ccp.util.ImageUtil;
import edu.gd.ccp.util.JacobOfficeUtil;
import edu.gd.ccp.util.MD5Util;
import edu.gd.ccp.util.copyDocument;
import edu.gd.ccp.util.downloadDocument;

@Controller
@Scope(value = "prototype")
@RequestMapping("/admin")
public class AdminController {
	@Resource
	private UserAccountService userAccountService;
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;
	@Resource
	private AdminDocumentManageService adminDocumentManageService;
	@Resource
	private UserDocumentManageService userDocumentManageService;
	// web主菜单
	@RequestMapping(value = "/mainmenu", method = RequestMethod.GET)
	public String mainMenu(User user, Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(true);
//		model.addAttribute("userName", session.getAttribute("userName").toString());
		return "common/index";
	}
	// 文档任务管理
	@RequestMapping(value = "/documentTaskManage")
	public String documentTaskManage(HttpSession session, DocumentCondition documentCondition, String page, Model model,
			HttpServletRequest request) {
		// DocumentCondition 查询条件pojo
		if (documentCondition == null)
			documentCondition = new DocumentCondition();
		else {
			if (documentCondition.getSchoolType() == null || documentCondition.getSchoolType().equals("all"))
				documentCondition.setSchoolType(null);
			if (documentCondition.getDocumentNo() == null || documentCondition.getDocumentNo().trim().equals(""))
				documentCondition.setDocumentNo(null);
			if (documentCondition.getTitle() == null || documentCondition.getTitle().trim().equals(""))
				documentCondition.setTitle(null);
			if (documentCondition.getSchoolName() == null || documentCondition.getSchoolName().trim().equals(""))
				documentCondition.setSchoolName(null);
			if (documentCondition.getDocumentState() == null
					|| documentCondition.getDocumentState().trim().equals("all"))
				documentCondition.setDocumentState(null);
		}
		System.out.println(documentCondition);

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
		// 分页查询
		int documentCounts = adminDocumentManageService.getDocumentTaskCount(documentCondition.getDocumentNo(),
				documentCondition.getTitle(), documentCondition.getDocumentType());
		List<Map> pagedocs = adminDocumentManageService.getDocumentTaskByCondition(
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(),
				documentCondition.getDocumentNo(), documentCondition.getTitle(), documentCondition.getDocumentType());
		List<DocumentType> documentTypes = documentTypeService.getDocumentTypes();
		// List<DocumentTask> documentTasks =
		// leaderDocumentManageService.getDocumentTasks();

		// 封装总记录数
		int totalCount = documentCounts;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整

		pageBean.setTotalPage(num.intValue());
		// 封装数据
		pageBean.setLists(pagedocs);
		model.addAttribute("docs", pageBean);
		model.addAttribute("documentTypes", documentTypes);
		// model.addAttribute("documentTasks", documentTasks);
		model.addAttribute("documentCondition", documentCondition);

		return "admin/documentTaskManage";
	}

	// 按高校统计
	// 文档管理
	@RequestMapping(value = "/documentList")
	public String documentManage(DocumentCondition documentCondition, String page, Model model,
			HttpServletRequest request) {
		// DocumentCondition 查询条件pojo
		if (documentCondition == null)
			documentCondition = new DocumentCondition();
		else {

			if (documentCondition.getSchoolType() == null || documentCondition.getSchoolType().equals("all"))
				documentCondition.setSchoolType(null);
			if (documentCondition.getDocumentNo() == null || documentCondition.getDocumentNo().trim().equals(""))
				documentCondition.setDocumentNo(null);
			if (documentCondition.getTitle() == null || documentCondition.getTitle().trim().equals(""))
				documentCondition.setTitle(null);
			if (documentCondition.getSchoolName() == null || documentCondition.getSchoolName().trim().equals(""))
				documentCondition.setSchoolName(null);
			if (documentCondition.getDocumentState() == null
					|| documentCondition.getDocumentState().trim().equals("all"))
				documentCondition.setDocumentState(null);
		}
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
		// 分页查询
		int documentCounts = leaderDocumentManageService.getDocumentCount(documentCondition.getDocumentNo(),
				documentCondition.getTitle(), documentCondition.getDocumentType(), documentCondition.getSchoolName(),
				documentCondition.getSchoolType(), documentCondition.getDocumentState(), documentCondition.getBelong(),
				documentCondition.getSchoolLevel());
		List<Map> pagedocs = leaderDocumentManageService.getDocumentsByCondition(
				(pageBean.getCurrPage() - 1) * pageBean.getPageSize(), pageBean.getPageSize(),
				documentCondition.getDocumentNo(), documentCondition.getTitle(), documentCondition.getDocumentType(),
				documentCondition.getSchoolName(), documentCondition.getSchoolType(),
				documentCondition.getDocumentState(), documentCondition.getBelong(),
				documentCondition.getSchoolLevel());
		List<DocumentType> documentTypes = documentTypeService.getDocumentTypes();
		List<DocumentTask> documentTasks = leaderDocumentManageService.getDocumentTasks();
		// System.out.println(documentCondition);
		// System.out.println(pagedocs.size());
		// System.out.println(pageno);
		// 封装总记录数
		int totalCount = documentCounts;
		pageBean.setTotalCount(totalCount);
		// 封装总页数
		Double num = Math.ceil(1.0 * totalCount / pageBean.getPageSize());// 向上取整
		pageBean.setTotalPage(num.intValue());
		// 封装数据
		pageBean.setLists(pagedocs);
		model.addAttribute("docs", pageBean);
		model.addAttribute("documentTypes", documentTypes);
		model.addAttribute("documentTasks", documentTasks);
		model.addAttribute("documentCondition", documentCondition);

		return "admin/documentList";
	}

	// 文档审核
	@RequestMapping(value = "/documentReview")
	public String documentReview(String review, String suggest, String modifyflag, Integer documentId, String page,
			Model model, HttpServletRequest request) {
		if (modifyflag != null) {
			Document doc = this.adminDocumentManageService.getDocumentById(documentId);
			doc.setSuggest(suggest);
			doc.setDocumentstate(review);
			int result = this.adminDocumentManageService.updateDocument(doc);
		}
		Map doc = this.adminDocumentManageService.getDocumentDetailById(documentId);
		model.addAttribute("document", doc);
		return "admin/documentReview";
	}

	// 文档修改备份
	@RequestMapping(value = "/documentModify")
	public String documentModifyBackup(Integer documentId, String page, Model model, HttpServletRequest request) {

		Map doc = this.adminDocumentManageService.getDocumentDetailById(documentId);
		model.addAttribute("document", doc);
		return "admin/documentModifyBackup";
	}

	// 文档合成与备份生成
	@RequestMapping(value = "/documentTaskProcess")
	public String documentTaskProcess(Integer documentTaskId, Model model, HttpServletRequest request) {

		DocumentTask documentTask = this.adminDocumentManageService.getDocumentTaskById(documentTaskId);
		model.addAttribute("documentTask", documentTask);
		return "admin/documentTaskProcess";
	}

	// 文档合成与备份生成,将某个编号所有文档合并
	@RequestMapping(value = "/documentMerge")
	public String documentMerge(String documentNo, String title, Integer documentType, String orType, String belong,
			String level, String mergeflag, String newDocType, Integer documentTaskId, Model model,
			HttpServletRequest request) {
		// 获取文档任务
		DocumentTask documentTask = this.adminDocumentManageService.getDocumentTaskById(documentTaskId);
		model.addAttribute("documentTask", documentTask);
		// 如果没有按确定按钮
		if (mergeflag == null)
			return "admin/documentTaskProcess";

		// 获取某批次文档任务所有提交文档
		List<Map> pagedocs = leaderDocumentManageService.getDocumentsByCondition(null, null, documentNo, title, null,
				null, orType, null, belong, level);

		String absPath = request.getSession().getServletContext().getRealPath("/");
		// 合成上报文档
		if (newDocType != null && newDocType.equals("mergedoc")) {
			List<String> fileList = new ArrayList<String>();
			for (Map doc : pagedocs) {
				String dno = doc.get("documentNo").toString();
				String organizationName = doc.get("organizationName").toString();
				String filename = absPath + "WEB-INF\\view\\doc\\" + dno + "\\" + organizationName + dno + ".docx";
				// 如果文件存在
				System.out.println("file:" + filename);
				File file = new File(filename);
				if (file.exists()) {
					fileList.add(filename);
					System.out.println(filename);
				}
			}
			System.out.println("文件个数" + fileList.size());
			String writeToFile = absPath + "WEB-INF\\view\\doc\\" + documentNo + "\\" + documentNo + "unit.docx";
			JacobOfficeUtil.uniteDoc(fileList, writeToFile);
			model.addAttribute("newDocType", newDocType);
		}
		// 合成修改文档
		if (newDocType != null && newDocType.equals("mergebakdoc")) {
			List<String> fileList = new ArrayList<String>();
			for (Map doc : pagedocs) {
				String dno = doc.get("documentNo").toString();
				String organizationName = doc.get("organizationName").toString();
				String filename = absPath + "WEB-INF\\view\\doc\\" + dno + "\\" + organizationName + dno
						+ "backup.docx";
				// 如果文件存在
				// System.out.println("file:"+filename);
				File file = new File(filename);
				if (file.exists()) {
					fileList.add(filename);
					System.out.println(filename);
				}
			}
			String writeToFile = absPath + "WEB-INF\\view\\doc\\" + documentNo + "\\" + documentNo + "backupunit.docx";
			JacobOfficeUtil.uniteDoc(fileList, writeToFile);
			model.addAttribute("newDocType", newDocType);
		}

		return "admin/documentTaskProcess";
	}

	// 文档任务管理

	@RequestMapping("/intoDocumentPublish.do")
	public String goIntoPublishDocument(Model model) {

		List<DocumentType> documentTypes = documentTypeService.getDocumentTypes();
		model.addAttribute("documentTypes", documentTypes);
		return "admin/taskPublish";
	}

	@RequestMapping("/afterPublishDocument.do")
	public String afterPublishDocument() {
		return "admin/documentTaskManage";
	}

	// 发布文档任务
	@RequestMapping(value = "/publishDocument.do", method = RequestMethod.POST)
	public String handle_PublishDocu(HttpServletRequest request, @RequestParam MultipartFile template,
			String documentNo, String tittle, Integer documentType, String endTime, String orType, String belong,
			String level, HttpSession session) {
		String userId = "";
		if (session.getAttribute("userId") != null) {
			userId = session.getAttribute("userId").toString();
		}
		// System.out.println(userId);
		// System.out.println("~~~"+documentNo+"~~~~"+tittle+"~~~~"+documentType+"~~~"+endTime+"~~~~"+orType);
		String result = null;
		String path = null;
		System.out.println("接受过来的template： " + template.getOriginalFilename());
		// 简单的设置文档的最大大小
		Long maxTemplateSize = (long) (10 * 1024 * 1024);
		if (!template.isEmpty()) {
			Long size = template.getSize();
			if (size > maxTemplateSize) {
				// TODO
			}
		}

		// 独特命名发 待定
		String uniqueName = UUID.randomUUID().toString();

		// 对应目录下创建存储文档的文件夹
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/");
		String filePath_bUp = request.getServletContext().getRealPath("/doc_bUp");
		File fileDir = new File(filePath);
		if (!fileDir.exists())
			fileDir.mkdirs();
		System.out.println(fileDir.exists());
		File fileDir_bUp = new File(filePath_bUp);
		if (!fileDir_bUp.exists())
			fileDir_bUp.mkdirs();
		// 获取上传文件的原名 getOriginalFilename()
		String originalFilename = template.getOriginalFilename();
		// 获取客户上传的原始的文件的扩展名及其前缀
		String suffix = originalFilename.substring(originalFilename.lastIndexOf("."));
		String prefix = originalFilename.substring(0, originalFilename.indexOf("."));
		// 用来备份的上传文件名
		String filName_bUp = documentNo + suffix;
		String filName = documentNo + suffix;
		File dest = new File(fileDir, filName);
		File dest_bUp = new File(fileDir_bUp, filName_bUp);
		try {
			template.transferTo(dest);
			// copyDocument这个类实现文档的复制，可实现文档的备份
			copyDocument.copyDocu(filName, filePath, filePath_bUp);
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			// 返回错误页面
			return "error";
		}

		String filename = filName;
		String filename_bUp = "/doc" + filName_bUp;
		System.out.println("接受上传到服务器：" + filename + "  \t" + filename_bUp);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date endTime1;
		try {
			endTime1 = sdf.parse(endTime);
			documentType = 1;
			adminDocumentManageService.publishDocument(documentNo, tittle, documentType, endTime1, orType, level,
					belong, filename, userId);
		} catch (ParseException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		// return "/admin/header";
		return "redirect:/admin/documentTaskManage";
	}

	// 上传总结文档
	@RequestMapping(value = "/uploadDocument.do", method = RequestMethod.POST)
	public String uploadDocument(HttpServletRequest request, @RequestParam("accessory") MultipartFile accessory,
			HttpSession session, Model model, Integer docId, String modify) {
		/**
		 * 生成文件名：学校+文档编号.docx 同时生成html： 学校+文档编号.html 并复制一个备份文件 学校+文档编号+backup.docx
		 * 均在“doc/+文档编号/”目录下 上传时先判断有无“doc/+文档编号/”目录，如果没有，先创建一个该目录
		 */

		// 简单的设置文档的最大大小
		Long maxTemplateSize = (long) (5 * 1024 * 1024);
		if (!accessory.isEmpty()) {
			Long size = accessory.getSize();
			if (size > maxTemplateSize) {
				// TODO
				model.addAttribute("msg", "上传文件过大，请判断是否上传正确");
				return "redirect:/school/intoUploadDocument.do?docId=" + docId;
			}
		}

		// 1.1 获得学校名
		String userId = (String) session.getAttribute("userId");
		System.out.println("用户id是：" + userId);
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		// 1.2 获得文档任务编号(目录名)
		String documentNo = userDocumentManageService.getDocumentNo(docId);

		// 2.1 对应目录下创建存储文档的文件夹
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "\\");

		File fileDir = new File(filePath);
		if (!fileDir.exists())
			fileDir.mkdirs();

		// 2.2 获取上传文件的原名 getOriginalFilename()
		String originalFilename = accessory.getOriginalFilename();
		// 2.3 在目录下创建文件
		File dest = new File(fileDir, originalFilename);

		// 2.4 如果重复，则删除
		File uploadfile = new File(filePath, originalFilename);
		if (uploadfile.exists())
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
		// System.out.println("上传文件中……");
		// System.out.println("上传路径为" + filePath);
		// System.out.println("文档重命名为：" + fileName);

		String fileName_bUp = organizationName + documentNo + "backup" + ".docx";

		// 3.3 更改为docx格式
		if (suffix == "doc") {
			// doc转为docx
			try {
				JacobOfficeUtil.convertDocFmt(filePath + originalFilename, filePath + originalFileName_2, 12);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// 3.4更改文件名
		File oldfile = new File(filePath, originalFilename);
		File newfile = new File(filePath, fileName);
		// 删除重复数据
		if (newfile.exists())
			newfile.delete();
		oldfile.renameTo(newfile);

		// 4.1备份上传的文件
		File copyFile = new File(filePath, fileName_bUp);
		if (copyFile.exists())
			copyFile.delete();

		try {
			// 在copyDocument仿照了一个复制的类
			copyDocument.copyDocu2(fileName, filePath, fileName_bUp);

		} catch (FileNotFoundException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

		// 5.1 生成在线观看文件,转为html
		// ChageFormat("d:\\cod\\","1.docx");
		// String htmlName=organizationName + documentNo + ".html";
		Boolean result = JacobOfficeUtil.ChageFormat(filePath, fileName_bUp);
		//转换原始文档
		Boolean result2 = JacobOfficeUtil.ChageFormat(filePath, fileName);
		// System.out.println(filePath + fileName);
		// System.out.println("文档转化为HTML结果：" + result);

		// 6.1 更新数据库
		if (modify != null)
			userDocumentManageService.uploadDocument(userId, docId, fileName, "修改待审");
		else
			userDocumentManageService.uploadDocument(userId, docId, fileName, "待审");

		model.addAttribute("msg", "上传成功");

		return "redirect:/admin/documentTaskManage";
	}

	// 上传或修改总结文档
	@RequestMapping("/intoUploadDocument.do")
	public String goIntoUploadDocument(Integer documentTaskId, HttpSession session, Model model, String modifyFlag) {

		String userId = (String) session.getAttribute("userId");

		// int organizationId = userDocumentManageService.getOrganizationId(userId);
		System.out.println(documentTaskId);
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		int organizationId = userDocumentManageService.getOrganizationId(userId);
		Document document = adminDocumentManageService.getDocumentByTaskIdAndOrganizationId(documentTaskId,
				organizationId);
		// String documentType =
		// userDocumentManageService.getDocumentType(document.getDocumentid());
		model.addAttribute("organizationName", organizationName);
		model.addAttribute("document", document);
		return "admin/documentSummaryUpload";
	}

	// 管理端下载高校上报的文档，
	@RequestMapping(value = "downloadDocument.do", method = RequestMethod.GET)
	public void downloadDocument(HttpSession session, Integer docId, HttpServletResponse response,
			HttpServletRequest request) throws IOException {

		// 1 获得文档位置
		String userId = (String) session.getAttribute("userId");
		String organizationName = userDocumentManageService.getOrganizationName(userId);
		String documentNo = userDocumentManageService.getDocumentNo(docId);
		// String fileName = organizationName + documentNo + ".docx";
		// 2 获得文档名
		String fileName = userDocumentManageService.getAccessory(docId);
		fileName = fileName.substring(0, fileName.indexOf(".")) + "backup.docx";

		String path = request.getSession().getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "\\")
				+ "\\" + fileName;

		// 将下载方法写在工具类里
		downloadDocument.download(path, fileName, response);
	}

	// 调用officepage打开word
	// 文档修改备份
	@RequestMapping(value = "/openWord", method = RequestMethod.GET)
	public String openWord(String filename, String path, Model model, HttpServletRequest request) {
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		model.addAttribute("filename", filename);
		model.addAttribute("path", path);
		System.out.println(path + "/" + filename);
		return "pageoffice/Word";
	}

	/**
	 * 2018 11 19 进入添加用户页面
	 */
	@RequestMapping("/intoAddUserAccount")
	public String showAddNewUserPage(Model model) {
		List<Organization> schools = this.leaderDocumentManageService.getSchoolsByType(null);
		model.addAttribute("schools", schools);
		return "/admin/add-account";
	}

	/**
	 * 2018 11 19 添加用户
	 */
	@RequestMapping("/addUser")
	public String handleAddUser(HttpServletRequest request) {
		User user = new User();
		user.setUserid(request.getParameter("userId"));
		user.setUsername(request.getParameter("userName"));
		user.setPassword(MD5Util.doubleEncoderByMd5(request.getParameter("password")));
		user.setUsertype(request.getParameter("userType"));
		user.setSex(request.getParameter("sex"));
		user.setMobile(request.getParameter("mobile"));
		user.setEmail(request.getParameter("email"));
		user.setOrganizationid(Integer.parseInt(request.getParameter("organizationId")));
		user.setPosition(request.getParameter("position"));

		int result = userAccountService.addNewUser(user);
		System.out.println(result);
		// if(result==1)
		return "redirect:/admin/intoAddUserAccount?result=" + result;
		// else {
		// return "error";
		// }
	}

	/**
	 * 2018 11 19 进入用户信息列表
	 */
	@RequestMapping(value = "/intoUserList")
	public String intoUserList(HttpServletRequest request, ModelMap model, String organizationName,
			@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "10") Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Map> userlist = userAccountService.getUserList(organizationName);
		PageInfo<Map> pageinfo = new PageInfo<Map>(userlist);

		model.addAttribute("list", userlist);
		model.addAttribute("page", pageinfo);
		return "/admin/account-list";
	}

	/**
	 * 2018 11 19 处理 删除用户
	 */
	@RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
	public String handleDeleteUser(Model model, String userId) {
		int result = userAccountService.deleteUserById(userId);
		if (result != 0)
			return "redirect:/admin/intoUserList";
		else
			return "error";
	}

	/**
	 * 2018 11 19 带着用户ID进入修改用户信息界面
	 */
	@RequestMapping(value = "/intomodifyUser", method = RequestMethod.GET)
	public String intoModifyUser(Model model, String userId) {
		User user = userAccountService.getOneUserByPrimaryKey(userId);
		model.addAttribute("user", user);
		return "~~~显示修改个人信息的页面~~~";
	}

	/**
	 * 2018 11 23 修改用户信息
	 */
	@RequestMapping(value = "/modifyUser")
	public String modifyUser(HttpServletRequest request) {
		User user = new User();
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter(""));
		user.setOrganizationid(Integer.parseInt(request.getParameter("")));
		user.setPassword(request.getParameter(""));
		user.setPhoto(request.getParameter(""));
		user.setPosition(request.getParameter(""));
		user.setSex(request.getParameter(""));
		user.setUserid(request.getParameter(""));
		user.setUsername(request.getParameter(""));
		user.setUsertype(request.getParameter(""));
		int result = userAccountService.updateUserInfoByUserId(user);
		if (result == 1)
			return "/admin/intoUserList";
		else
			return "~~~希望返回json字符串~~~";
	}

	// 进入管理员修改用户资料界面
	@RequestMapping("/intoUserModify.do")
	public String userModifyUI(HttpSession session, Model model, String msg, String userId) {
		List<Map<Object, Object>> user = userAccountService.getInfoByUserId(userId);
		model.addAttribute("msg", msg);
		model.addAttribute("u", user.get(0));
		return "admin/userInfoModify";
	}

	// 管理员修改用户账户
	@RequestMapping(value = "/modifyUserInfo.do")
	public String modifyUserInformation(HttpSession session, HttpServletRequest request, Model model, String flag,
			String userId, User user, @RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password,
			@RequestParam(value = "sex", required = false) String sex,
			@RequestParam(value = "mobile", required = false) String mobile,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "position", required = false) String position,
			@RequestParam(value = "picture", required = false) MultipartFile picture)
			throws IllegalStateException, IOException {

		if (userId.trim() != null) {
			user.setUserid(userId);
		}
		if (userName.trim() != null) {
			user.setUsername(userName);
		}

		// 这里就算password为空，最终到数据库也会变为空
		// 所以干脆在页面加上password了
		if (password.trim() != null && password.trim().length() != 0) {
			user.setPassword(MD5Util.doubleEncoderByMd5(password.trim()));
		}
		System.out.println("这里会更改密码，我倒要看看你是啥子： " + password + " ##");
		// 这里采用的是下拉框形式，trim会报错
		if (sex != null) {
			user.setSex(sex);
		}
		if (mobile.trim() != null) {
			user.setMobile(mobile);
		}
		if (email.trim() != null) {
			user.setEmail(email);
		}
		if (position.trim() != null) {
			user.setPosition(position);
		}

		// 当用户上传照片时
		if (null != picture && !picture.isEmpty()) {
			File imageFolder = new File(request.getServletContext().getRealPath("/WEB-INF/view/image/"));

			// 分别存放用户上传后转化为JPG格式的照片， 和我们对其进行约束大小的照片
			// 若已经存在，则该方法会覆盖原文件
			File file = new File(imageFolder, user.getUserid() + ".jpg");
			File fileBackUp = new File(imageFolder, user.getUserid() + "BackUp.jpg");

			// 若没有父类文件夹，则递归生成文件夹
			if (!file.getParentFile().exists()) {
				file.getParentFile().mkdirs();
			}

			picture.transferTo(file);
			System.out.println("############图片文件夹：" + imageFolder);

			// 借助工具类转成jpg格式
			BufferedImage img = ImageUtil.change2jpg(file);
			ImageIO.write(img, "jpg", file);

			// 转化为固定大小格式的照片副本 #{userId}BackUp.jpg
			// ImageUtil下的方法已将图片保存在 /WEB_INF/view/image/ 下
			Image resizePhoto = ImageIO.read(file);
			ImageUtil.resizeImage(file, 295, 413, fileBackUp);

			// 设置photo属性，方便浏览个人信息，更新数据库
			// 这里保存图片路径
			String photoName = imageFolder + "\\" + userId + "BackUp.jpg";
			System.out.println(photoName);

			user.setPhoto(userId + ".jpg");

		}
		userAccountService.personalInfoModify(user);
		model.addAttribute("msg", "ok");
		// 返回用户信息界面,如果是管理员修改用户资料
		return "redirect:/admin/intoUserList";
	}

	// 提醒提交文档
	@RequestMapping(value = "/documentRemind")
	public String documentRemind(Integer documentTaskId, Model model, HttpServletRequest request) {

		DocumentTask dt = this.adminDocumentManageService.getDocumentTaskById(documentTaskId);
		Integer remind = dt.getRemind();
		if (remind == null)
			remind = 0;
		dt.setRemind(remind + 1);
		// System.out.println(documentTaskId);
		int result2 = this.adminDocumentManageService.updateRemindDocumentByTaskid(documentTaskId);
		int result = this.adminDocumentManageService.updateDocumentTask(dt);
		// 获取所有用户
		List<User> users = this.adminDocumentManageService.getUsersByDocTaskId(documentTaskId);
		for (User user : users) {
			String email = user.getEmail();
			String title = dt.getTitle() + "提交温馨提醒";
			String content = user.getUsername() + "<br>请于" + dt.getDeadline() + "前，提交" + dt.getTitle()
					+ "文档， http://localhost:8080/gdeduccp/";
			if (email != null && !email.trim().equals("")) {
				EmailUtil.sendMail(title, email, content);
			}
		}
		return "redirect:/admin/documentTaskManage";
	}

	@RequestMapping(value = "/doDeleteDocumentTask", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> doDeleteDocumentTask(int documenttaskid) {

		int row = this.adminDocumentManageService.deleteByPrimaryKey(documenttaskid);
		// 删除所有该任务的所有提交文档
		int row2 = adminDocumentManageService.deleteDocumentByTaskId(documenttaskid);

		ResponseResult<Void> result = new ResponseResult<Void>();
		if (row > 0)
			result.setState(ResponseResult.State_OK);
		else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	@RequestMapping(value = "/doDeleteDocument", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> doDeleteDocument(int documentId) {

		int row = this.adminDocumentManageService.deleteDocumentByPrimaryKey(documentId);

		ResponseResult<Void> result = new ResponseResult<Void>();
		if (row > 0)
			result.setState(ResponseResult.State_OK);
		else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	// 修改word后更新对应html
	@RequestMapping(value = "/modifyBackupHtml", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> modifyBackupHtml(HttpServletRequest request, String fileName, String documentNo) {
		System.out.println("文件名：" + fileName);
		try {
			fileName =java.net.URLDecoder.decode(fileName, "UTF-8");
			fileName =java.net.URLDecoder.decode(fileName, "UTF-8");  
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			System.out.println("错误"+e.toString());
		}
		System.out.println("文件名：" + fileName);
		String filePath = request.getServletContext().getRealPath("/WEB-INF/view/doc/" + documentNo + "/");
		System.out.println("目录：" + filePath);
		File file = new File(filePath + fileName);

		// if(!file.exists())
		// file.delete();
		Boolean result1 = JacobOfficeUtil.ChageFormat(filePath, fileName);
		ResponseResult<Void> result = new ResponseResult<Void>();
		if (result1)
			result.setState(ResponseResult.State_OK);
		else
			result.setState(ResponseResult.State_ERR);
		
		return result;
	}
}
