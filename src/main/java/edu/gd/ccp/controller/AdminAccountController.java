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
import edu.gd.ccp.entity.UserWithOrganName;
import edu.gd.ccp.pojo.DocMergeCondation;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.BaseException;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.util.ImageUtil;
import edu.gd.ccp.util.JacobOfficeUtil;
import edu.gd.ccp.util.MD5Util;
import edu.gd.ccp.util.copyDocument;
import edu.gd.ccp.util.downloadDocument;

@Controller
@Scope(value = "prototype")
@RequestMapping("/adminAccount")
public class AdminAccountController {
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
	

	/**
	 * 2018 11 19  进入添加用户页面
	 */
	@RequestMapping("/intoAddUserAccount")
	public String showAddNewUserPage() {		
		return "/admin/addAccount";
	}
	/**
	 * 2018 11 19  添加用户
	 */
	@RequestMapping("/addUser")
	public String handleAddUser(HttpServletRequest request) {
		User user = new User();
		user.setUserid(request.getParameter("userId"));
		user.setUsername(request.getParameter("userName"));
		//MD5Util.doubleEncoderByMd5(this.getPara("password"))
		user.setPassword(MD5Util.doubleEncoderByMd5(request.getParameter("password")));
		user.setUsertype(request.getParameter("userType"));
		user.setSex(request.getParameter("sex"));
		user.setMobile(request.getParameter("mobile"));
		user.setEmail(request.getParameter("email"));
		user.setOrganizationid(Integer.parseInt(request.getParameter("organizationId")));
		user.setPosition(request.getParameter("position"));
		try {
			int result = userAccountService.addNewUser(user);
			if(result==1)
				return "/admin/header";

		}catch(BaseException e) {
			return "error";
		}
		return "error";
		
	}
	
	/**
	 * 2018 11 19  进入用户信息列表
	 */
	@RequestMapping(value="/intoUserList",method=RequestMethod.GET)
	public String intoUserList(HttpServletRequest request, ModelMap model, String organizationName,
            @RequestParam(required = true, defaultValue = "1") Integer page,
            @RequestParam(required = false, defaultValue = "10") Integer pageSize
			) {
		PageHelper.startPage(page,pageSize);
		List<UserWithOrganName> userWithOrNamelist = userAccountService.selectAllUserWithOrganName(organizationName);
		PageInfo<UserWithOrganName> pageinfo = new PageInfo<UserWithOrganName>(userWithOrNamelist);
		model.addAttribute("list", userWithOrNamelist);
		model.addAttribute("page", pageinfo); 
		return "/admin/accountList";
	}
	/**
	 *  2018 11 19  处理  删除用户
	 */
	@RequestMapping(value="/deleteUser",method=RequestMethod.GET)
	public String handleDeleteUser(Model model,String userId) {
		int result = userAccountService.deleteUserById(userId);
		try {
			if(result==1)
				return "redirect:/admin/intoUserList.do";

		}catch(BaseException e) {
			return "error";
		}
		return "error";
	}
	/**
	 *  2018 11 19  带着用户ID进入修改用户信息界面
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value="/intomodifyUser",method=RequestMethod.GET)
	@ResponseBody
	public ResponseResult<User>  intoModifyUser(String userId) {
		ResponseResult<User> result = new ResponseResult<User>();
		User user = userAccountService.getOneUserByPrimaryKey(userId);
		if(result != null)
		{
			result.setState(1);
			result.setMessage("成功获取到对应ID的用户对象");
			result.setData(user);
			return result;
		}
		else
		{
			result.setState(-1);
			result.setMessage("服务器出错！");
			result.setData(null);
			return result;
		}
		
	}
	/**
	 * 2018 11 23 修改用户信息 
	 */
	@RequestMapping(value="/modifyUser",method=RequestMethod.POST)
	public String modifyUser(HttpServletRequest request) {
		User user = new User();
		//  userId不能为空
		user.setUserid(request.getParameter("userId"));
		user.setEmail(request.getParameter("email"));
		user.setMobile(request.getParameter("mobile"));
		user.setOrganizationid(Integer.parseInt(request.getParameter("organizationId")));
		user.setPosition(request.getParameter("position"));
		user.setSex(request.getParameter("sex"));
		user.setUsername(request.getParameter("userName"));
		user.setUsertype(request.getParameter("userType"));
		try {
			int result = userAccountService.updateUserInfoByUserId(user);
			if( result==1 )
				return "redirect:/admin/intoUserList.do";
		}catch(BaseException e){
				return "error";
		}
		return "error";
	}
		
		
}
