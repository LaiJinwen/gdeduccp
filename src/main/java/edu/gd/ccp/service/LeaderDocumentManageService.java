package edu.gd.ccp.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.DocumentType;
  
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.PageBean;
//文档查询、文档统计
public interface LeaderDocumentManageService {
//	
	public List<Map> getDocumentsByCondition( Integer offset, Integer limit, String documentNo, String title, String documentType, String organizationName, String organizationType,String documentState,String belong,String schoolLevel );
	
	public int getDocumentCount(String documentNo, String title,
			String documentType, String organizationName, String organizationType,String documentState,String belong,String schoolLevel);
	
	PageBean<Map> findDocumentByPage(int currentPage);
	
//	获取所有文档任务
   public List<DocumentTask> getDocumentTasks();
	
    // 文档统计
   //统计各高校类别某种状态的文档提交数  ，按高校分组 ，返回：高校类别，提交数量 
   List<Map> getSchoolTypeDocumentCountByNo(String documentNo);
   // 统计某文档、文档状态的整体提交情况 -->
   int getDocumentCountByNo(String documentNo,String documentState);
   
   //统计各个学校的提交情况 ，按高校分组  ，返回 高校名，提交数
   public List<Map> getSchoolDocumentCountByNo(String documentNo, String title, String organizationName, String organizationType,String belong,String schoolLevel);
   //统计某学校的提交情况 
   List<Map> getDocumentCountBySchool(String organizationName);
   
   //统计某文档的提交情况 
   List<Map> getDocumentByNo(String documentNo); 
   
   public List<Organization> getSchoolsByType(String organizationType) ;
   //获取某学校所有文档
   public List<Document> getDocumentsBySchool(Integer organizationId) ;
   
   Map getDocumentCountBySchoolId(Integer organizationId);
   //根据类别查找学校
   List<Organization> getOridganizationByCondation( String organizationType,  String belong,  String schoolLevel);
   //获取单位
   Organization selectByPrimaryKey(Integer organizationid);
}
