package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.DocumentTask;

import edu.gd.ccp.entity.DocumentType;

public interface DocumentTaskMapper {
    int deleteByPrimaryKey(Integer documenttaskid);

    int insert(DocumentTask record);

    int insertSelective(DocumentTask record);

    DocumentTask selectByPrimaryKey(Integer documenttaskid);

    int updateByPrimaryKeySelective(DocumentTask record);

    int updateByPrimaryKey(DocumentTask record);
    
    List<DocumentTask> selectDocumentTask();
    //获取文档任务列表以及个数
    List<Map> getDocumentTaskByCondation(@Param("offset") Integer offset,@Param("limit") Integer limit,@Param("documentNo") String documentNo,@Param("title") String title,@Param("documentType") String documentType);  
    
    int getDocumentTaskCountByCondation(@Param("documentNo") String documentNo,@Param("title") String title,@Param("documentType") String documentType);

    DocumentTask selectByDocumentNo(String documentNo);
}