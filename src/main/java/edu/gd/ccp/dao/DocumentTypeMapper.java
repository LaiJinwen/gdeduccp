package edu.gd.ccp.dao;

import java.util.List;

import edu.gd.ccp.entity.DocumentType;

public interface DocumentTypeMapper {
    int deleteByPrimaryKey(Integer documenttypeid);

    int insert(DocumentType record);

    int insertSelective(DocumentType record);

    DocumentType selectByPrimaryKey(Integer documenttypeid);

    int updateByPrimaryKeySelective(DocumentType record);

    int updateByPrimaryKey(DocumentType record);
    
    List<DocumentType> selectDocumentTypes();
}