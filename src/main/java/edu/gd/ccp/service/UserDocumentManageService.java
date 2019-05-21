package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
  
//高校用户上传文档、文档维护
public interface UserDocumentManageService {


	//用户由自己的id推算出组织名
	public String getOrganizationName(String userId);
	//用户由自己的id推算出组织id
	public int getOrganizationId(String userId);
	//用户由文档id推算出文档类别
	public String getDocumentType(int documentId);
	//用户由文档id推算出文档编号
	public String getDocumentNo(int documentId);
	//用户由文档id推算出已上传的文档名称
	public String getAccessory(int documentId);
	//用户由文档id推算出管理员评语
	public String getSuggest(int documentId);
	
	//用户上传文档
	public void uploadDocument(@Param("userId")String userId, int documentId, String accessory,String state);
	//用户删除已上传的文档
	public void deleteDocument(@Param("userId")String userId, int documentId, String accessory);
	//用户下载已上传的文档
	public void downloadDocument(int documentId);

	//用户下载管理员的文档附件
	public String downloadTemplateDocument(int documentId);
	
	//用户查看未提交的文档
	// 修改于2018/11/21， 增加了分页查询 
	public List<Map> listUnsubmitDocumentByOrganizationId(int offset, int limit, int organizationId);
	//用户查看所有的文档
	// 修改于2018/11/21， 增加了分页查询 
	public List<Map> listDocumentsByOrganizationId(int offset, int limit, int organizationId);
	
	// 增加于2018/11/21
	// 分页查询所需, 获取当前用户文档总数
	public int getDocumentCounts(int organizationId);
	
	// 增加于2018/11/22
	// 分页查询所需, 获取当前用户未提交的文档总数
	public int getUnsubmitDocumentCounts(int organizationId);
}
