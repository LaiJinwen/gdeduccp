package edu.gd.ccp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.DocumentTypeMapper;
import edu.gd.ccp.entity.DocumentType;
import edu.gd.ccp.service.DocumentTypeManageService;
@Service("documentTypeService")
public class DocumentTypeManageServiceImpl implements DocumentTypeManageService{
	@Autowired
	private DocumentTypeMapper documentTypeMapper;

	@Override
	public List<DocumentType> getDocumentTypes() {
		// TODO Auto-generated method stub
		return documentTypeMapper.selectDocumentTypes();
	}

}
