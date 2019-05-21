package edu.gd.ccp.service.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.gd.ccp.dao.DocumentMapper;
import edu.gd.ccp.dao.DocumentTaskMapper;
import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.dao.UserMapper;
import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.service.AdminDocumentManageService;
import edu.gd.ccp.util.EmailUtil;

@Service("adminService")
public class AdminDocumentManageServiceImpl implements AdminDocumentManageService {
	@Autowired
	private DocumentMapper documentMapper;
	@Autowired
	private DocumentTaskMapper documentTaskMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	DocumentMapper docMapper;
	@Autowired
	OrganizationMapper organMapper;

	// 查文档任务
	@Override
	public List<Map> getDocumentTaskByCondition(Integer offset, Integer limit, String documentNo, String title,
			String documentType) {
		// TODO Auto-generated method stub
		return this.documentTaskMapper.getDocumentTaskByCondation(offset, limit, documentNo, title, documentType);
	}

	// 文档任务数量
	@Override
	public int getDocumentTaskCount(String documentNo, String title, String documentType) {
		// TODO Auto-generated method stub
		return this.documentTaskMapper.getDocumentTaskCountByCondation(documentNo, title, documentType);
	}

	// 根据id获取文档
	@Override
	public Map getDocumentDetailById(int documentid) {
		// TODO Auto-generated method stub
		return documentMapper.getDocumentDetailById(documentid);
	}

	@Override
	public Document getDocumentById(int documentid) {
		// TODO Auto-generated method stub
		return documentMapper.selectByPrimaryKey(documentid);
	}

	@Override
	public int updateDocument(Document document) {
		// TODO Auto-generated method stub
		return this.documentMapper.updateByPrimaryKey(document);
	}

	// 根据任务id获取文档任务
	@Override
	public DocumentTask getDocumentTaskById(int taskId) {
		// TODO Auto-generated method stub
		return this.documentTaskMapper.selectByPrimaryKey(taskId);
	}

	@Override
	@Transactional
	public Integer publishDocument(String documentNo, String tittle, Integer documentType, Date endTime, String orType,
			String level, String belong, String filename, String userId) {
		Integer result = 0;
		// List<Integer> list =new ArrayList<Integer>();
		// String[] orTypes=orType.split(",");
		// for(String oType:orTypes) {
		// list.addAll(organMapper.selectByOrType(oType));
		// }
		// list.add(5);
		// System.out.println(list.size());
		List<Organization> list = this.getOrganizationByCondition(orType, level, belong);

		Integer count = 0;

		// 创建一个文档任务

		DocumentTask docTask = new DocumentTask();
		docTask.setDocumentno(documentNo);
		docTask.setAccessory(filename);
		docTask.setTitle(tittle);
		docTask.setPublishdate(new Date());
		docTask.setDeadline(endTime);
		docTask.setDocumenttypeid(documentType);
		docTask.setPublishuserid(userId);
		docTask.setTitle(tittle);
		documentTaskMapper.insert(docTask);
		docTask = documentTaskMapper.selectByDocumentNo(documentNo);

		Document doc = null;
		doc = new Document();
		doc.setDocumenttaskid(docTask.getDocumenttaskid());
		doc.setTitle(tittle);
		doc.setDocumentno(documentNo);
		doc.setDocumenttypeid(documentType);
		doc.setDocumentstate("未提交");
		// doc.setAccessory(filename);
		doc.setTemplateaccessory(documentNo + ".docx");
		for (Organization org : list) {
			doc.setOrganizationid(org.getOrganizationid());
			doc.setOrganizationno(org.getOrganizationno());
			Integer temp = docMapper.insertSelective(doc);
			// 发送邮件
			List<Map<String, String>> maps = userMapper.selectUserIdAndOrganNo(org.getOrganizationid());
			for (Map<String, String> map : maps) {
				String email = map.get("email");
				// 发给单位的每个用户
				String content = org.getOrganizationname() + "<br>请于" + endTime + "前，提交" + tittle
						+ "文档， http://localhost:8080/gdeduccp/";
				if (email != null && !email.trim().equals("")) {
					EmailUtil.sendMail("提交" + tittle + "文档通知", email, content);
				}
			}

			if (temp != null)
				count++;
		}
		// 增加教育工委
		doc.setOrganizationid(323);
		doc.setOrganizationno("99999");
		Integer temp = docMapper.insertSelective(doc);

		if (count != list.size()) {
			System.out.println("系统出错，请稍后再重新操作。");
			throw new RuntimeException("系统出错，请稍后再重新操作。");
		}

		else
			result = 1;
		return result;
	}

	@Override
	public Document getDocumentByTaskIdAndOrganizationId(int documentTaskId, int organizationId) {
		// TODO Auto-generated method stub
		return this.documentMapper.getDocumentByTaskIdAndOrganizationId(documentTaskId, organizationId);
	}

	@Override
	public List<Organization> getOrganizationByCondition(String orType, String levle, String belong) {
		// TODO Auto-generated method stub
		return this.organMapper.selectByCondition(orType, levle, belong);
	}

	// 更新文档任务
	@Override
	public int updateDocumentTask(DocumentTask documentTask) {
		// TODO Auto-generated method stub
		return this.documentTaskMapper.updateByPrimaryKey(documentTask);
	}

	@Override
	public Integer updateRemindDocumentByTaskid(Integer documentTaskId) {
		// TODO Auto-generated method stub
		return this.documentMapper.updateRemindDocumentByTaskid(documentTaskId);
	}

	public List<User> getUsersByDocTaskId(Integer documentTaskId) {
		return this.documentMapper.getUsersByDocTaskId(documentTaskId);
	}

	public int deleteByPrimaryKey(Integer documenttaskid) {
		return this.documentTaskMapper.deleteByPrimaryKey(documenttaskid);
	}

	@Override
	public Integer deleteDocumentByTaskId(Integer documentTaskId) {
		// TODO Auto-generated method stub
		return this.documentMapper.deleteDocumentByTaskId(documentTaskId);
	}

	@Override
	public int deleteDocumentByPrimaryKey(Integer documentid) {
		// TODO Auto-generated method stub
		return this.documentMapper.deleteByPrimaryKey(documentid);
	}

}
