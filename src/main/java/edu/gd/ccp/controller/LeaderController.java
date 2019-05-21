package edu.gd.ccp.controller;

import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.DocumentCondition;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.DocumentTypeManageService;
import edu.gd.ccp.service.LeaderDocumentManageService;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.util.ExcelUtil;

@Controller
@Scope(value = "prototype")
@RequestMapping("/leader")
public class LeaderController {
	@Resource
	private LeaderDocumentManageService leaderDocumentManageService;
	@Resource
	private DocumentTypeManageService documentTypeService;

	// 按条件查询
	@RequestMapping(value = "/documentSearch")
	public String documentSearch(DocumentCondition documentCondition, String page, Model model,
			HttpServletRequest request) {

		// DocumentCondition 查询条件pojo
		if (documentCondition == null)
			documentCondition = new DocumentCondition();
		else {
			// System.out.println(documentCondition);
			// if (documentCondition.getDocumentType() == null ||
			// documentCondition.getDocumentType().equals("all"))
			// documentCondition.setDocumentType(null);
			if (documentCondition.getDocumentState() == null || documentCondition.getDocumentState().equals("all"))
				documentCondition.setDocumentState(null);
			if (documentCondition.getDocumentNo() == null || documentCondition.getDocumentNo().trim().equals(""))
				documentCondition.setDocumentNo(null);
			if (documentCondition.getTitle() == null || documentCondition.getTitle().trim().equals(""))
				documentCondition.setTitle(null);
			if (documentCondition.getSchoolName() == null || documentCondition.getSchoolName().trim().equals(""))
				documentCondition.setSchoolName(null);
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
		return "leader/documentSearch";
	}

	// 按高校统计
	@RequestMapping(value = "/documentStatBySchool")
	public String documentStat(DocumentCondition documentCondition, Model model, HttpServletRequest request) {
		if (documentCondition == null)
			documentCondition = new DocumentCondition();
		else {
			if (documentCondition.getDocumentNo() == null || documentCondition.getDocumentNo().trim().equals(""))
				documentCondition.setDocumentNo(null);
			if (documentCondition.getTitle() == null || documentCondition.getTitle().trim().equals(""))
				documentCondition.setTitle(null);
			if (documentCondition.getSchoolName() == null || documentCondition.getSchoolName().trim().equals(""))
				documentCondition.setSchoolName(null);
		}
		// 获取各学校应交文档
		List<Map> docCounts = this.leaderDocumentManageService.getSchoolDocumentCountByNo(
				documentCondition.getDocumentNo(), documentCondition.getTitle(), documentCondition.getSchoolName(),
				documentCondition.getSchoolType(), documentCondition.getBelong(), documentCondition.getSchoolLevel());
		List<String> header = new ArrayList<>(); // 第一行标题数据
		header.add("代码");
		header.add("高校");
		header.add("主管部门");
		header.add("办学层次");
		header.add("办学性质");
		header.add("组织关系");
		header.add("提醒次数");
		header.add("提交数量");
		header.add("未交数量");
		List<List<String>> body = new ArrayList<>();
		
		for(Map doc:docCounts) {
			List<String> data1 = new ArrayList<>(); // 第二行数据
			data1.add(doc.get("organizationNo").toString());
			data1.add(doc.get("organizationName").toString());
			data1.add(doc.get("supervisorDepartment").toString());
			data1.add(doc.get("schoolLevel").toString());
			data1.add(doc.get("organizationType").toString());
			data1.add(doc.get("belong").toString());
			data1.add(doc.get("remindtimes").toString());
			data1.add(doc.get("count1").toString());
			data1.add(doc.get("count2").toString());
			body.add(data1);
		}
		
		String absPath = request.getSession().getServletContext().getRealPath("/");
		String filename = absPath + "WEB-INF\\view\\doc\\xls\\docStatistics.xls";

		try (OutputStream out = new FileOutputStream(filename) // 输出目的地
		) {
			ExcelUtil.generateExcel("文档提交统计", header, body, out);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 获取各学校未交文档
		model.addAttribute("docCounts", docCounts);
		return "leader/documentStatistics";
	}

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
			titles = titles + ",'" + v.get("organizationType") + "'";
			count1 = count1 + "," + v.get("count1");
			count2 = count2 + "," + v.get("count2");
		}
		titles = titles.substring(1, titles.length());
		count1 = count1.substring(1, count1.length());
		count2 = count2.substring(1, count2.length());
		// System.out.println(titles);
		// System.out.println(count1);
		// System.out.println(count2);
		// 获取各学校未交文档
		// 绘图数据，xtitles为x轴标题，y为数据系列
		model.addAttribute("xtitles", titles);
		model.addAttribute("ycount1", count1);
		model.addAttribute("ycount2", count2);
		model.addAttribute("docCounts", docCounts);
		return "leader/documentStatisticsBySchoolType";
	}

	// 学校类别
	@RequestMapping(value = "/schools")
	public String getSchools(String organizationType, Model model, HttpServletRequest request) {

		List<Organization> schools1 = this.leaderDocumentManageService.getSchoolsByType("公办");
		model.addAttribute("schools1", schools1);
		List<Organization> schools2 = this.leaderDocumentManageService.getSchoolsByType("民办");
		model.addAttribute("schools2", schools2);
		List<Organization> schools3 = this.leaderDocumentManageService.getSchoolsByType("合作办学");
		model.addAttribute("schools3", schools3);
		List<Organization> schools4 = this.leaderDocumentManageService.getSchoolsByType("独立学院");
		model.addAttribute("schools4", schools4);
		// System.out.println("schools="+schools.size());
		return "leader/docu-stat-college";
	}

	// 获取某学校文档提交情况
	@RequestMapping(value = "/schoolDocumentStat")
	public String getSchoolDocumentStat(Integer organizationId, Model model, HttpServletRequest request) {

		List<Document> documents = this.leaderDocumentManageService.getDocumentsBySchool(organizationId);
		model.addAttribute("documents", documents);
		Map doc_counts = this.leaderDocumentManageService.getDocumentCountBySchoolId(organizationId);
		model.addAttribute("doc_counts", doc_counts);
		return "leader/documentStatisticsBySchool";
	}

}
