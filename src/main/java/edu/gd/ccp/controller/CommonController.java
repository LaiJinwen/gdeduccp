package edu.gd.ccp.controller;

import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.gd.ccp.util.ImageUtil;
import edu.gd.ccp.util.MD5Util;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import net.sf.json.JSONObject;

@Controller
@Scope(value = "prototype")
// @RequestMapping("/")
public class CommonController {
	@Resource
	private UserAccountService userAccountService;
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;
	@Resource
	private AdminDocumentManageService adminDocumentManageService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(User user, Model model, HttpServletRequest request,HttpServletResponse response) {
		JSONObject result = this.userAccountService.userLogin(user.getUserid(), user.getPassword());
//		 System.out.println(user.getUserid() + user.getUsertype());
//		 System.out.println(result);
		boolean isMoblie = JudgeIsMoblie(request);
    
		if (result.getInt("status") == 1) {// 登录成功
	         //记住用户名、密码功能(注意：cookie存放密码会存在安全隐患)
	         String remFlag = request.getParameter("remFlag");
	         if("1".equals(remFlag)){ //"1"表示用户勾选记住密码
	        	//添加 Cookie
	        	    try {
	        	    	System.out.println(remFlag+user.getPassword()+user.getUserid());
						addCookie(user.getUserid(),user.getPassword(),remFlag,response,request);
					} catch (UnsupportedEncodingException e) {
						System.out.println(e.toString());
						e.printStackTrace();
					}

	         }
			
			HttpSession session = request.getSession(true);
			session.setAttribute("userId", user.getUserid());
			session.setAttribute("userName", result.opt("userName"));
			session.setAttribute("userType", result.opt("usertype"));
			if (result.opt("userType").equals("user")) {// 普通用户
				return "redirect:/school/listUnsubmitDocument.do";

			} else {// if(result.opt("userType").equals("leader") ||
					// result.opt("userType").equals("admin") ) {//领导
				if (isMoblie)
					return "redirect:/mobileleader/index";
				return "redirect:/admin/mainmenu";
				// return "common/index";
				// int documentCounts=leaderDocumentManageService.getDocumentCount(null, null,
				// null, null, null,null);
				// List<Map> docs=leaderDocumentManageService.getDocumentsByCondition(0, 10,
				// null, null, null, null, null,null);
				// List<DocumentType> documentTypes=documentTypeService.getDocumentTypes();
				// model.addAttribute("documentTypes",documentTypes);
				// PageBean<Map> pageBean = new PageBean<Map>();
				// //封装当前页数
				// pageBean.setCurrPage(1);
				// //每页显示的数据
				// int pageSize=10;
				// pageBean.setPageSize(pageSize);
				// //封装总记录数
				// pageBean.setTotalCount(documentCounts);
				// //封装总页数
				// Double num =Math.ceil(documentCounts/pageSize);//向上取整
				// pageBean.setTotalPage(num.intValue());
				// pageBean.setLists(docs);
				// model.addAttribute("docs", pageBean);
				//// return "leader/documentSearch";
				// return "common/index";
				// }else {//如果是admin，管理员
				// if(isMoblie)
				// return "redirect:/mobileleader/index";
				// int documentCounts=adminDocumentManageService.getDocumentTaskCount(null,
				// null, null);
				// List<Map> docs=adminDocumentManageService.getDocumentTaskByCondition(0, 10,
				// null, null, null);
				// List<DocumentType> documentTypes=documentTypeService.getDocumentTypes();
				// model.addAttribute("documentTypes",documentTypes);
				// PageBean<Map> pageBean = new PageBean<Map>();
				// //封装当前页数
				// pageBean.setCurrPage(1);
				// //每页显示的数据
				// int pageSize=10;
				// pageBean.setPageSize(pageSize);
				// //封装总记录数
				// pageBean.setTotalCount(documentCounts);
				// //封装总页数
				// Double num =Math.ceil(documentCounts/pageSize);//向上取整
				// pageBean.setTotalPage(num.intValue());
				// pageBean.setLists(docs);
				// model.addAttribute("docs", pageBean);
				//// return "admin/documentTaskManage";
				// return "common/index";
			}
		} else {
			// 登录失败，返回登录
			model.addAttribute("reason", result.opt("reason"));
			if (isMoblie) {
				return "mobileleader/login";
			} else {
				return "common/login";
			}
		}
	}
	//记忆cookie
	private void addCookie(String loginAccount,String loginPassword,String remFlag, HttpServletResponse response,HttpServletRequest request)
            throws UnsupportedEncodingException{
    if(!loginAccount.equals("") && !loginPassword.equals("")){
        //创建  Cookie
        Cookie loginAccountCookie = new Cookie("userid",loginAccount);
        Cookie loginPasswordCookie = new Cookie("password",loginPassword);
        //设置Cookie的父路经
        loginAccountCookie.setPath(request.getContextPath()+"/");
        loginPasswordCookie.setPath(request.getContextPath()+"/");
        
        
        if( remFlag==null || remFlag.equals(false) ){
            //不保存Cookie
            loginAccountCookie.setMaxAge(0);
            loginPasswordCookie.setMaxAge(0);
        }else{
            //保存Cookie的时间长度，单位为秒
            loginAccountCookie.setMaxAge(7*24*60*60);
            loginPasswordCookie.setMaxAge(7*24*60*60);
        }
        //加入Cookie到响应头
        response.addCookie(loginAccountCookie);
        response.addCookie(loginPasswordCookie);
    }
}
	// 系统根目录
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(User user, Model model, HttpServletRequest request) {
		boolean isMoblie = JudgeIsMoblie(request);
		// 若没有登录
		if (request.getSession().getAttribute("userType") == null) {
			if (isMoblie) {
				return "mobileleader/login";
			} else {
				return "common/login";
			}
		} else {// 已登录
			HttpSession session = request.getSession(true);
			String userType=session.getAttribute("userType").toString().trim();
			if (isMoblie) {
				return "redirect:/mobileleader/index";
			} else {
				if(!userType.equals("user"))
					return "redirect:/school/listAllDocument.do";
				else
					return "redirect:/admin/mainmenu";
			}
		}
	}
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout( HttpServletRequest request) {
		HttpSession session = request.getSession(true);
		session.invalidate();
//		model.addAttribute("userName", session.getAttribute("userName").toString());
		return "redirect:/";
	}
	
 
	// 判断是PC端还是手机端
	public boolean JudgeIsMoblie(HttpServletRequest request) {
		boolean isMoblie = false;
		String[] mobileAgents = { "iphone", "android", "phone", "mobile", "wap", "netfront", "java", "opera mobi",
				"opera mini", "ucweb", "windows ce", "symbian", "series", "webos", "sony", "blackberry", "dopod",
				"nokia", "samsung", "palmsource", "xda", "pieplus", "meizu", "midp", "cldc", "motorola", "foma",
				"docomo", "up.browser", "up.link", "blazer", "helio", "hosin", "huawei", "novarra", "coolpad", "webos",
				"techfaith", "palmsource", "alcatel", "amoi", "ktouch", "nexian", "ericsson", "philips", "sagem",
				"wellcom", "bunjalloo", "maui", "smartphone", "iemobile", "spice", "bird", "zte-", "longcos", "pantech",
				"gionee", "portalmmm", "jig browser", "hiptop", "benq", "haier", "^lct", "320x320", "240x320",
				"176x220", "w3c ", "acs-", "alav", "alca", "amoi", "audi", "avan", "benq", "bird", "blac", "blaz",
				"brew", "cell", "cldc", "cmd-", "dang", "doco", "eric", "hipt", "inno", "ipaq", "java", "jigs", "kddi",
				"keji", "leno", "lg-c", "lg-d", "lg-g", "lge-", "maui", "maxo", "midp", "mits", "mmef", "mobi", "mot-",
				"moto", "mwbp", "nec-", "newt", "noki", "oper", "palm", "pana", "pant", "phil", "play", "port", "prox",
				"qwap", "sage", "sams", "sany", "sch-", "sec-", "send", "seri", "sgh-", "shar", "sie-", "siem", "smal",
				"smar", "sony", "sph-", "symb", "t-mo", "teli", "tim-", /* "tosh", */ "tsm-", "upg1", "upsi", "vk-v",
				"voda", "wap-", "wapa", "wapi", "wapp", "wapr", "webc", "winw", "winw", "xda", "xda-",
				"Googlebot-Mobile" };
		System.out.println(request.getHeader("User-Agent"));
		String headerstr = request.getHeader("User-Agent");
		if (headerstr != null) {
			for (String mobileAgent : mobileAgents) {
				if (headerstr.toLowerCase().indexOf(mobileAgent) >= 0) {
					isMoblie = true;
					break;
				}
			}
		}
		return isMoblie;
	}

/*** 增加于2018/11/16 */
	
	// 用户查看个人信息
	// 这里的显示的图片应该是备份后，
	// 在JSP中图片相应位置写上${pageContext.request.contextPath}/photo/${userId}+"BackUp.jpg"
	// 可增加功能：点开可查看原图
	@RequestMapping("/intoUserInfo.do")
	public String shouInfomation(HttpSession session, Model model,String msg) {
		String userId = (String) session.getAttribute("userId");
		List<Map<Object, Object>> user = userAccountService.getInfoByUserId(userId);
		model.addAttribute("msg", msg);
		model.addAttribute("u", user.get(0));
		return "school/userSetting";
	}

	/**
	 * 用户修改个人信息,其中包括上传照片 这次我们把上传的照片放在/WEB_INF/view/photo 下
	 * 并将照片名更改为#{userId}.jpg，user表的photo属性设为照片路径
	 * 为了方便统一管理，新建了一个工具类将照片转为jpg格式，并对其更改了大小， 同时保存了一寸大小的照片副本：#{userId}BackUp.jpg
	 * 一寸照片的大小格式为295*413(宽*高：这里是像素单位)
	 * 
	 * 在浏览个人信息时的照片应该是一寸大小的副本照片较合理
	 * 
	 * @throws IOException
	 * @throws IllegalStateException
	 */
	@RequestMapping(value = "/modifyPersonalInfo.do")
	public String modifyInformation(HttpSession session,
			HttpServletRequest request,
			Model model,
			String flag,
			User user,
			@RequestParam(value = "userName", required = false)String userName,
			@RequestParam(value ="password", required = false)String password,
			@RequestParam(value ="sex", required = false)String sex,
			@RequestParam(value ="mobile", required = false)String mobile,
			@RequestParam(value ="email", required = false)String email,
			@RequestParam(value ="position", required = false)String position,
			@RequestParam(value ="picture", required = false) MultipartFile picture) throws IllegalStateException, IOException {

		String userId = (String) session.getAttribute("userId");

		if(userId.trim()!= null) {
			user.setUserid(userId);
		}	
		if(userName.trim() != null) {
			user.setUsername(userName);
		}
		
		// 这里就算password为空，最终到数据库也会变为空
		// 所以干脆在页面加上password了
		if(password != null && password.trim().length() != 0) {
			user.setPassword(MD5Util.doubleEncoderByMd5(password.trim()));	
		}	 
		System.out.println("这里会更改密码，我倒要看看你是啥子： " + password + " ##");
		// 这里采用的是下拉框形式，trim会报错
		if(sex != null) {
			user.setSex(sex);
		}
		if(mobile.trim() != null) {
			user.setMobile(mobile);
		}
		if(email.trim() != null) {
			user.setEmail(email);
		}
		if(position.trim() != null) {
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
			String photoName =imageFolder + "\\"  + userId + "BackUp.jpg";
			System.out.println(photoName);
			
			user.setPhoto(userId+".jpg");

		}
		userAccountService.personalInfoModify(user);
		model.addAttribute("msg", "ok");
		// 返回用户信息界面,如果是管理员修改用户资料
		   return "redirect:/intoUserInfo.do";
	}
	

}
