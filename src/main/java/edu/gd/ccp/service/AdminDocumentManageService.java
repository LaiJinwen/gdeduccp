package edu.gd.ccp.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.entity.User;
 
//发布文档任务、修改文档任务、文档审核、文档上传、文档导出、文档查询、文档统计
public interface AdminDocumentManageService {
//	文档任务列表
	public List<Map> getDocumentTaskByCondition( Integer offset, Integer limit, String documentNo, String title, String documentType);
	//文档任务个数
	public int getDocumentTaskCount(String documentNo, String title,String documentType);
	//根据主键id获取文档详细情况，
	public Map getDocumentDetailById(int id);
	//根据主键id获取文档
	public Document getDocumentById(int id);
	//审核文档
	public int updateDocument(Document document);
	//获取文档任务
	public DocumentTask getDocumentTaskById(int taskId);
	
	/**
	 * 管理员发布文档任务
	 * 指定哪些类别下的学校需要提交文档
	 * @return 结果数 1：成功发布； 0：发布失败
	 */
	Integer publishDocument(
			String documentNo,String tittle,Integer documentType, 
			Date endTime,String orType,String level,String belong,String filename,String filename2
			);
	
	//根据任务id获取文档
	public Document getDocumentByTaskIdAndOrganizationId(int documentTaskId, int organizationId);
 
	List<Organization> getOrganizationByCondition(String orType,String levle,String belong);  
	//更新文档任务  12-16
	public int updateDocumentTask(DocumentTask documentTask);
	//更新某次文档任务提醒次数
    Integer updateRemindDocumentByTaskid(Integer documentTaskId);
    
    List<User> getUsersByDocTaskId(Integer documentTaskId); 
    //删除文档任务
    int deleteByPrimaryKey(Integer documenttaskid);
    
    Integer deleteDocumentByTaskId(Integer documentTaskId);
    //删除文档
    int deleteDocumentByPrimaryKey(Integer documentid);
 }
