package edu.gd.ccp.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;

@Controller
@Scope(value = "prototype")
@RequestMapping("/mobileleader")
class LeaderMobileController {
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;
	@Resource
	private UserAccountService userAccountService;
	// 学校类别
		@RequestMapping(value = "/schoolTypes")
		public String schoolTypes( Model model,
				HttpServletRequest request) {
			return "mobileleader/schoolTypes";
	     }
		// 移动首页
		@RequestMapping(value = "/index")
		public String index( Model model,
				HttpServletRequest request) {
			return "mobileleader/index";
	     }
		// 根据学校类别获取学校列表
		@RequestMapping(value = "/schools")
		public String getSchools(String organizationType, Model model,
				HttpServletRequest request) {
			
			List<Organization> schools=this.leaderDocumentManageService.getSchoolsByType(organizationType);
			model.addAttribute("schools", schools);
//			System.out.println("schools="+schools.size());
			return "mobileleader/schools";
	     }	
		
		//获取某学校文档
		@RequestMapping(value = "/schoolDocuments")
		public String getSchoolDocuments(Integer organizationId, Model model,
				HttpServletRequest request) {
			
			List<Document> documents=this.leaderDocumentManageService.getDocumentsBySchool(organizationId);
			model.addAttribute("documents", documents);
			return "mobileleader/schoolDocuments";
	     }	
		// 按高校统计文档提交数量
		@RequestMapping(value = "/documentStatBySchool")
		public String documentStat(String schoolType, Model model, HttpServletRequest request) {
			if (schoolType == null || schoolType.trim().equals(""))
				schoolType = null;
			else
				schoolType=schoolType.trim();
			System.out.println(schoolType);
			// 获取各学校应交文档
			List<Map> docCounts = this.leaderDocumentManageService.getSchoolDocumentCountByNo(
					null, null, null,schoolType,null,null);
              System.out.println(docCounts.size());
			// 获取各学校未交文档
			model.addAttribute("docCounts", docCounts);
			return "mobileleader/documentStatisticsBySchool";
		}
		//获取某学校文档提交情况
		@RequestMapping(value = "/schoolDocumentStat")
		public String getSchoolDocumentStat(Integer organizationId, Model model,
				HttpServletRequest request) {
			
			List<Document> documents=this.leaderDocumentManageService.getDocumentsBySchool(organizationId);
			model.addAttribute("documents", documents);
			return "mobileleader/schoolDocumentStatistic";
	     }		
		//按高校类别统计,各类别提交情况，有文档编号统计该文档提交情况，无编号统计所有文档提交情况
		@RequestMapping(value = "/documentStatBySchoolType")
		public String documentStatBySchoolType(String documentNo, Model model, HttpServletRequest request) {
			if (documentNo == null || documentNo.trim().equals(""))
				documentNo = null;
			// 获取各学校类别已交文档、未交文档
			List<Map> docCounts = this.leaderDocumentManageService.getSchoolTypeDocumentCountByNo(documentNo);
			String titles = "";
			String count1 = "";
			String count2 = "";
			for (Map v : docCounts) {
				titles = titles + ",'" + v.get("orgtype") + "'";
				count1 = count1 + "," + v.get("count1");
				count2 = count2 + "," + v.get("count2");
			}
			titles = titles.substring(1, titles.length());
			count1 = count1.substring(1, count1.length());
			count2 = count2.substring(1, count2.length());
			 System.out.println(titles);
			 System.out.println(count1);
			 System.out.println(count2);
			// 获取各学校未交文档
			// 绘图数据，xtitles为x轴标题，y为数据系列
			model.addAttribute("xtitles", titles);
			model.addAttribute("ycount1", count1);
			model.addAttribute("ycount2", count2);
			model.addAttribute("docCounts", docCounts);
			return "mobileleader/documentStatisticsBySchoolType";
		}	
		
		// 根据学校类别获取学校列表
		@RequestMapping(value = "/getSchoolsByTypes")
		public String getSchoolsByTypes(String organizationType,String schoolLevel, Model model,
				HttpServletRequest request) {
			
			List<Organization> schools=this.leaderDocumentManageService.getOridganizationByCondation(organizationType, null, schoolLevel);
			model.addAttribute("schools", schools);
//			System.out.println("schools="+schools.size());
			return "mobileleader/schools";
	     }	
		
		// 学校类别，查询单位信息导航菜单
		@RequestMapping(value = "/schoolTypesForInfo")
		public String schoolTypesForInfo( Model model,
				HttpServletRequest request) {
			return "mobileleader/schoolTypesForInfo";
	     }
		// 根据学校类别获取学校列表，用于查询单位信息导航菜单
		@RequestMapping(value = "/getSchoolInfoByTypes")
		public String getSchoolInfoByTypes(String organizationType,String schoolLevel, Model model,
				HttpServletRequest request) {
			
			List<Organization> schools=this.leaderDocumentManageService.getOridganizationByCondation(organizationType, null, schoolLevel);
			model.addAttribute("schools", schools);
//			System.out.println("schools="+schools.size());
			return "mobileleader/schoolsForInfo";
	     }			
		// 单位详细信息
		@RequestMapping(value = "/organizationInfo")
		public String organizationInfo(Integer organizationId, Model model,
				HttpServletRequest request) {
			Organization organization=this.leaderDocumentManageService.selectByPrimaryKey(organizationId);
			model.addAttribute("organization", organization);
			return "mobileleader/organizationInfo";
	     }		
		// 单位详细信息，未完成
		@RequestMapping(value = "/mofidyPassword")
		@ResponseBody
		public ResponseResult<Void> mofidyPassword(HttpSession session,String pwd1,String pwd2, Model model,
				HttpServletRequest request) {
			ResponseResult<Void> result=new ResponseResult<Void>();
			String userId=null;
			if(session.getAttribute("userId")!=null) {
			   userId = (String)session.getAttribute("userId");
			   User user=this.userAccountService.getOneUserByPrimaryKey(userId);
			   
			   user.setPassword(pwd1);
			   int rows=this.userAccountService.updateUserInfoByUserId(user);
			   System.out.println("gengxin结果"+userId+","+rows);
			   if(rows>0) {
			     result.setState(1);  
			     result.setMessage("修改成功");
			   }
			   else {
				   result.setState(0);  
				   result.setMessage("修改失败，请稍后重试");   
			   }
			}else {
				result.setMessage("请登录后修改");
				result.setState(-1); 
			}
			return result;
			
	     }		
		// 单位详细信息，未完成
				@RequestMapping(value = "/logout")
				@ResponseBody
				public ResponseResult<Void> logout(HttpSession session,String pwd1,String pwd2, Model model,
						HttpServletRequest request) {
					ResponseResult<Void> result=new ResponseResult<Void>();
					session.invalidate();
					result.setState(1);
				    result.setMessage("退出成功");
					return result;
			     }				
}
