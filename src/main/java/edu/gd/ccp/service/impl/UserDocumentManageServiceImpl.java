package edu.gd.ccp.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.DocumentMapper;
import edu.gd.ccp.dao.UserMapper;
import edu.gd.ccp.entity.Document;
import edu.gd.ccp.service.UserDocumentManageService;

@Service("userDocumentManageService")
public class UserDocumentManageServiceImpl implements UserDocumentManageService {
	// 依赖注入
	// 依赖注入
	@Autowired
	private DocumentMapper documentMapper;

	@Autowired
	private UserMapper userMapper;

	@Override
	public String getOrganizationName(String userId) {
		// 用户由自己的id推算出组织名
		return userMapper.getOrganizationNameByUserId(userId);
	}

	@Override
	public int getOrganizationId(String userId) {
		// TODO 自动生成的方法存根
		return userMapper.getOrganizationIdByUserId(userId);
	}

	@Override
	public String getDocumentType(int documentId) {
		// TODO 自动生成的方法存根
		return documentMapper.getDocumentTypeByDocumentId(documentId);
	}

	@Override
	public String getDocumentNo(int documentId) {
		// TODO 自动生成的方法存根
		return documentMapper.getDocumentNoByDocumentId(documentId);
	}

	@Override
	public String getAccessory(int documentId) {
		// TODO 自动生成的方法存根
		return documentMapper.getAccessoryByDocumentId(documentId);
	}

	@Override
	public String getSuggest(int documentId) {
		// TODO 自动生成的方法存根
		return documentMapper.getSuggestByDocumentId(documentId);
	}

	@Override
	public void uploadDocument(@Param("userId") String userId, int documentId, String accessory, String state) {
		// 用户上传文档
		documentMapper.updateDocumentStateWhenSubmit(userId, documentId, accessory, state);
	}

	@Override
	public void deleteDocument(@Param("userId") String userId, int documentId, String accessory) {
		// 用户删除文件
		documentMapper.updateDocumentStateWhenDelete(documentId);

	}

	@Override
	public void downloadDocument(int documentId) {
		//

	}

	@Override
	public String downloadTemplateDocument(int documentId) {
		// TODO 自动生成的方法存根
		return documentMapper.getTemplateByDocumentId(documentId);
	}

	// @Override
	// public List<Document> listUnsubmitDocumentByOrganizationId(int
	// organizationId) {
	// // 列出所有未提交的文档
	// return documentMapper.listUnsubmitDocumentsByOrganizationId(organizationId);
	// }
	//
	// @Override
	// public List<Document> listDocumentsByOrganizationId(int organizationId) {
	// // TODO 自动生成的方法存根
	// return documentMapper.listDocumentsByOrganizationId(organizationId);
	// }
	// 修改于2018/11/21 增加了分页查询方法
	@Override
	public List<Map> listUnsubmitDocumentByOrganizationId(int offset, int limit, int organizationId) {
		// 列出所有未提交的文档
		return documentMapper.listUnsubmitDocumentsByOrganizationId(offset, limit, organizationId);
	}

	// 修改于2018/11/21 增加了分页查询方法
	@Override
	public List<Map> listDocumentsByOrganizationId(int offset, int limit, int organizationId) {
		// TODO 自动生成的方法存根
		return documentMapper.listDocumentsByOrganizationId(offset, limit, organizationId);
	}

	// 增加于2018/11/22
	@Override
	public int getDocumentCounts(int organizationId) {
		// TODO 自动生成的方法存根
		return documentMapper.UserGetDocumentCount(organizationId);
	}

	@Override
	public int getUnsubmitDocumentCounts(int organizationId) {
		// TODO 自动生成的方法存根
		if (documentMapper.UserGetUnsubmitDocumentCount(organizationId) == null)
			return 0;
		else
			return documentMapper.UserGetUnsubmitDocumentCount(organizationId);
	}

}
