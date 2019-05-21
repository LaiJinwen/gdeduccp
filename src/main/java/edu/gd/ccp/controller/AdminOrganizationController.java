package edu.gd.ccp.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.Meeting;
import edu.gd.ccp.entity.Message;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.ResponseResult;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.UserWithOrganName;
import edu.gd.ccp.entity.Votetask;
import edu.gd.ccp.pojo.DocMergeCondation;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.service.AdminMeetingManageService;
import edu.gd.ccp.service.AdminMessageService;
import edu.gd.ccp.service.AdminOrgazationService;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.service.UserDocumentManageService;
import edu.gd.ccp.service.VoteAdminService;
import edu.gd.ccp.service.ex.BaseException;
import edu.gd.ccp.util.JacobOfficeUtil;
import edu.gd.ccp.util.QRCodeUtil;
import edu.gd.ccp.util.copyDocument;
import edu.gd.ccp.util.downloadDocument;

@Controller
@Scope(value = "prototype")
@RequestMapping("/admin")
public class AdminOrganizationController {
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
	@Resource
	private AdminMeetingManageService meetingService;
	@Resource
	private VoteAdminService voteAdminService;
	@Resource
	private AdminOrgazationService adminOrganService;
	@Resource
	private AdminMessageService messageService;

	@RequestMapping(value = "/intoAddOrganization")
	public String intoAddOrganization() {
		return "/admin/organizationAdd";
	}

	@RequestMapping(value = "/intoOrganizationList")
	public String intoOrganizationList(ModelMap map, String searchOrganizationName, HttpServletRequest request,
			@RequestParam(required = true, defaultValue = "1") Integer page,
			@RequestParam(required = false, defaultValue = "20") Integer pageSize) {
		PageHelper.startPage(page, pageSize);
		List<Organization> orList = adminOrganService.getAllOrganzation(searchOrganizationName);
		PageInfo<Organization> pageInfo = new PageInfo<Organization>(orList);
		map.addAttribute("page", pageInfo);
		map.addAttribute("list", orList);
		return "/admin/organizationList";
	}

	@RequestMapping("/doAddOrganization")
	@ResponseBody
	public ResponseResult<String> doAddOrganization(HttpServletRequest request) {
		ResponseResult<String> result = new ResponseResult<String>();
		Organization organization = new Organization();
		organization.setOrganizationno(request.getParameter("organizationNo"));
		organization.setOrganizationname(request.getParameter("organizationName"));
		organization.setSupervisordepartment(request.getParameter("supervisorDepartment"));
		organization.setSupervisortype(request.getParameter("supervisoerType"));
		organization.setBelong(request.getParameter("belong"));
		organization.setSchoollevel(request.getParameter("schoolLevel"));
		organization.setOrganizationtype(request.getParameter("organizationType"));
		organization.setAddress(request.getParameter("address"));
		organization.setTelephone(request.getParameter("telephone"));
		organization.setFaxno(request.getParameter("faxNo"));
		organization.setPostcode(request.getParameter("postcode"));
		organization.setNote(request.getParameter("note"));
		int addResult = adminOrganService.addNewOrganization(organization);
		if (addResult == 1) {
			result.setData("成功插入！");
			result.setState(ResponseResult.State_OK);
		} else {
			result.setData("插入失败！");
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	@RequestMapping(value = "/doDeleteOrganization", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Void> doDelete(Integer organId) {
		ResponseResult<Void> result = new ResponseResult<Void>();
		if (organId != null) {
			int deleteResult = adminOrganService.deleteOrganization(organId);
			if (deleteResult != 1)
				result.setState(ResponseResult.State_ERR);
			else
				result.setState(ResponseResult.State_OK);
		} else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	@RequestMapping(value = "/intoUpdateOrganization", method = RequestMethod.GET)
	@ResponseBody
	public ResponseResult<Organization> intoUpdateOrganization(Integer organId) {
		ResponseResult<Organization> result = new ResponseResult<Organization>();
		if (organId != null) {
			Organization organization = adminOrganService.getOrganizationById(organId);
			if (organization != null) {
				result.setState(ResponseResult.State_OK);
				result.setData(organization);
				return result;
			} else
				result.setState(ResponseResult.State_ERR);
		} else {
			result.setState(ResponseResult.State_ERR);
		}
		return result;
	}

	@RequestMapping("/doUpdateOrganization")
	@ResponseBody
	public ResponseResult<Void> doUpdateOrganization(Integer orId, HttpServletRequest request) {
		ResponseResult<Void> result = new ResponseResult<Void>();
		if (orId == null) {
			result.setState(ResponseResult.State_ERR);
			result.setMessage("接受前台发送的organizationId失败！");
		} else {
			Organization organization = new Organization();
			organization.setOrganizationid(orId);
			organization.setOrganizationno(request.getParameter("organizationNo"));
			organization.setOrganizationname(request.getParameter("organizationName"));
			organization.setSupervisordepartment(request.getParameter("supervisorDepartment"));
			organization.setSupervisortype(request.getParameter("supervisoerType"));
			organization.setBelong(request.getParameter("belong"));
			organization.setSchoollevel(request.getParameter("schoolLevel"));
			organization.setOrganizationtype(request.getParameter("organizationType"));
			organization.setAddress(request.getParameter("address"));
			organization.setTelephone(request.getParameter("telephone"));
			organization.setFaxno(request.getParameter("faxNo"));
			organization.setPostcode(request.getParameter("postcode"));
			organization.setNote(request.getParameter("note"));
			organization.setTaxpayerid(request.getParameter("taxpayerId"));
			organization.setInvoicename(request.getParameter("invoiceName"));
			if (request.getParameter("numberOfStudent") != null)
				organization.setNumberofstudent(Integer.parseInt(request.getParameter("numberOfStudent")));
			if (request.getParameter("numberOfTeacher") != null)
				organization.setNumberofteacher(Integer.parseInt(request.getParameter("numberOfTeacher")));
			if (request.getParameter("numberOfStudentPartyMember") != null)
				organization.setNumberofstudentpartymember(
						Integer.parseInt(request.getParameter("numberOfStudentPartyMember")));
			if (request.getParameter("numberOfTeacherPartyMember") != null)
				organization.setNumberofteacherpartymember(
						Integer.parseInt(request.getParameter("numberOfTeacherPartyMember")));
			if (request.getParameter("numberOfRetirePartyMember") != null)
				organization.setNumberofretirepartymember(
						Integer.parseInt(request.getParameter("numberOfRetirePartyMember")));
			if (request.getParameter("numberOfSecondPartyOrganization") != null)
				organization.setNumberofsecondpartyorganization(
						Integer.parseInt(request.getParameter("numberOfSecondPartyOrganization")));
			if (request.getParameter("numberOfTeacherPartyBranch") != null)
				organization.setNumberofteacherpartybranch(
						Integer.parseInt(request.getParameter("numberOfTeacherPartyBranch")));
			if (request.getParameter("numberOfStudentPartyBranch") != null)
				organization.setNumberofstudentpartybranch(
						Integer.parseInt(request.getParameter("numberOfStudentPartyBranch")));

			int updateResult = adminOrganService.doUpdateOrganization(organization);
			if (updateResult == 1) {
				result.setState(ResponseResult.State_OK);
				result.setMessage("成功更新实体信息！");
			} else {
				result.setState(ResponseResult.State_ERR);
				result.setMessage("后台繁忙，更改组织信息失败！");
			}
		}
		return result;
	}
}
