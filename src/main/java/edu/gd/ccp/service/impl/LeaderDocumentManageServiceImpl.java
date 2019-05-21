package edu.gd.ccp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mysql.fabric.xmlrpc.base.Param;
import com.mysql.fabric.xmlrpc.base.Params;

import edu.gd.ccp.dao.DocumentMapper;
import edu.gd.ccp.dao.DocumentTaskMapper;
import edu.gd.ccp.dao.DocumentTypeMapper;
import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.DocumentTask;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.pojo.PageBean;
import edu.gd.ccp.service.LeaderDocumentManageService;
@Service("leadService")
public class LeaderDocumentManageServiceImpl implements LeaderDocumentManageService{
	@Autowired
	private DocumentMapper documentMapper;
	@Autowired
	private DocumentTaskMapper documentTaskMapper;
	
	@Autowired
	private OrganizationMapper organizationMapper;	
	
	@Override
	public List<Map> getDocumentsByCondition(Integer offset, Integer limit, String documentNo, String title,
			String documentType, String organizationName, String organizationType,String documentState,String belong,String schoolLevel) {
		
		return documentMapper.getDocumentsByCondation(offset, limit, documentNo, title, documentType, organizationName, organizationType,documentState, belong,schoolLevel);
	}
	@Override
	public int getDocumentCount(String documentNo, String title,
			String documentType, String organizationName, String organizationType,String documentState,String belong,String schoolLevel) {		
		return documentMapper.getDocumentCountByCondation(documentNo, title, documentType, organizationName, organizationType,documentState,belong,schoolLevel);
	}
	@Override
	public PageBean<Map> findDocumentByPage(int currentPage) {
		// TODO Auto-generated method stub
		 HashMap<String,Object> map = new HashMap<String,Object>();
	        PageBean<Map> pageBean = new PageBean<Map>();

	        //封装当前页数
	        pageBean.setCurrPage(currentPage);

	        //每页显示的数据
	        int pageSize=2;
	        pageBean.setPageSize(pageSize);

	        //封装总记录数。
	        int totalCount =getDocumentCount(null, null, null, null, null,null, null,null);
	        pageBean.setTotalCount(totalCount);

	        //封装总页数
	        double tc = totalCount;
	        Double num =Math.ceil(tc/pageSize);//向上取整
	        pageBean.setTotalPage(num.intValue());

	        map.put("start",(currentPage-1)*pageSize);
	        map.put("size", pageBean.getPageSize());
	        //封装每页显示的数据
//	        List<Map> lists = userDao.findByPage(map);
//	        pageBean.setLists(lists);

	        return pageBean;
	}
	@Override
	public List<DocumentTask> getDocumentTasks() {
		// TODO Auto-generated method stub
		return this.documentTaskMapper.selectDocumentTask();
	}
    //统计各高校类别某种状态的文档提交数  ，按高校分组 ，返回：高校类别，提交数量 
	@Override
	public List<Map> getSchoolTypeDocumentCountByNo(String documentNo) {
		// TODO Auto-generated method stub
		return this.documentMapper.getSchoolTypeDocumentCountByNo(documentNo);
	}
	// 统计某文档、文档状态的整体提交情况 -->
	@Override
	public int getDocumentCountByNo(String documentNo, String documentState) {
		// TODO Auto-generated method stub
		return this.documentMapper.getDocumentCountByNo(documentNo, documentState);
	}
	//统计各个学校的提交情况 ，按高校分组  ，返回 高校名，提交数 
	@Override
	public List<Map> getSchoolDocumentCountByNo(String documentNo, String title, String organizationName, String organizationType,String belong,String schoolLevel) {
		// TODO Auto-generated method stub
		return this.documentMapper.getSchoolDocumentCountByNo(documentNo, title, organizationName, organizationType, belong, schoolLevel);
	}
	//统计某学校的提交情况
	@Override
	public List<Map> getDocumentCountBySchool(String organizationName) {
		// TODO Auto-generated method stub
		return this.documentMapper.getDocumentCountBySchool(organizationName);
	}
	
	@Override
	public List<Map> getDocumentByNo(String documentNo) {
		// TODO Auto-generated method stub
		return this.getDocumentByNo(documentNo);
	}

	@Override
	public List<Organization> getSchoolsByType(String organizationType) {
		// TODO Auto-generated method stub
//		System.out.println("organizationType="+organizationType);
		return this.organizationMapper.getSchoolsByType(organizationType, null);
	}
	//根据学校获取文档
	@Override
	public List<Document> getDocumentsBySchool(Integer organizationId) {
		// TODO Auto-generated method stub
		return this.documentMapper.getDocumentsByOrganizationId(organizationId, null, null);
	}
	//获取某高校提交、未提交情况统计
	@Override
	public Map getDocumentCountBySchoolId(Integer organizationId) {
		// TODO Auto-generated method stub
		return this.documentMapper.getDocumentCountBySchoolId(organizationId);
	}
	  //根据类别查找学校
	public  List<Organization> getOridganizationByCondation( String organizationType,  String belong,  String schoolLevel){
		   return this.organizationMapper.getOridganizationByCondation(organizationType, null, schoolLevel);
	   }
	public Organization selectByPrimaryKey(Integer organizationid) {
		return this.organizationMapper.selectByPrimaryKey(organizationid);
	}
}
