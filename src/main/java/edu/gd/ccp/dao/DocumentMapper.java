package edu.gd.ccp.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Param;
import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.User;

public interface DocumentMapper {
	int deleteByPrimaryKey(Integer documentid);

	int insert(Document record);

	int insertSelective(Document record);

	Document selectByPrimaryKey(Integer documentid);

	int updateByPrimaryKeySelective(Document record);

	int updateByPrimaryKey(Document record);

	List<Document> getDocumentsByOrganizationId(@Param("organizationId") Integer organizationId,
			@Param("offset") Integer offset, @Param("limit") Integer limit);

	List<Map> getDocumentWithTaskByOrganizationId(@Param("organizationId") Integer organizationId,
			@Param("offset") Integer offset, @Param("limit") Integer limit);

	List<Map> getDocumentsByCondation(@Param("offset") Integer offset, @Param("limit") Integer limit,
			@Param("documentNo") String documentNo, @Param("title") String title,
			@Param("documentType") String documentType, @Param("organizationName") String organizationName,
			@Param("organizationType") String organizationType, @Param("documentState") String documentState,
			@Param("belong") String belong, @Param("schoolLevel") String schoolLevel);

	int getDocumentCountByCondation(@Param("documentNo") String documentNo, @Param("title") String title,
			@Param("documentType") String documentType, @Param("organizationName") String organizationName,
			@Param("organizationType") String organizationType, @Param("documentState") String documentState,
			@Param("belong") String belong, @Param("schoolLevel") String schoolLevel);

	List<Map> findDocumentsByCondation(HashMap<String, Object> map, @Param("documentNo") String documentNo,
			@Param("title") String title, @Param("documentType") String documentType,
			@Param("organizationName") String organizationName, @Param("organizationType") String organizationType);

	// 统计各高校类别某种状态的文档提交数 ，按高校分组 ，可根据编号条件，返回：高校类别，提交数量，未提交所
	List<Map> getSchoolTypeDocumentCountByNo(@Param("documentNo") String documentNo);

	// 统计某文档、文档状态的整体提交情况 -->
	int getDocumentCountByNo(@Param("documentNo") String documentNo, @Param("documentState") String documentState);

	// 统计各个学校的提交情况 ，按高校分组 ，返回 高校名，提交数
	List<Map> getSchoolDocumentCountByNo(@Param("documentNo") String documentNo, @Param("title") String title,
			@Param("organizationName") String organizationName, @Param("organizationType") String organizationType,
			@Param("belong") String belong, @Param("schoolLevel") String schoolLevel);

	// 统计某学校的提交情况
	List<Map> getDocumentCountBySchool(@Param("organizationName") String organizationName);

	// 统计某文档的提交情况
	List<Map> getDocumentByNo(@Param("documentNo") String documentNo);

	Map getDocumentDetailById(@Param("documentId") Integer documentId);

	/**
	 * 发布新的任务
	 * 
	 * @param doc
	 *            文档实体
	 * @return 受影响行数
	 */
	Integer insertNewDocument(Document doc);

	/**
	 * 
	 * @param 根据：指定的任务编号
	 * @return 返回： 该任务标号提交上的文档列表
	 */
	List<Document> getDocumentsByTaskId(Integer taskId);

	/**
	 * 
	 * @param 依据：
	 *            会议类别
	 * @return 返回 该类别下的所有文档列表
	 */
	List<Document> getDocumentsByType(Integer typeId);

	/**
	 * @param 依据：
	 *            会议标题
	 * @return 查询到的文档列表
	 */
	List<Document> getDocumentsByTitle(String title);

	/**
	 * @param 依据：
	 *            组织id，查询起点，查询条数
	 * @return 该组织下的所有待提交文档
	 */
	// List<Document> listUnsubmitDocumentsByOrganizationId(int organizationId);
	List<Map> listUnsubmitDocumentsByOrganizationId(@Param("offset") Integer offset, @Param("limit") Integer limit,
			@Param("organizationId") int organizationId);

	/**
	 * @param 依据：
	 *            组织id，查询起点，查询条数
	 * @return 该组织下的所有文档
	 */
	// List<Document> listDocumentsByOrganizationId(int organizationId);
	List<Map> listDocumentsByOrganizationId(@Param("offset") Integer offset, @Param("limit") Integer limit,
			@Param("organizationId") int organizationId);

	/**
	 * @param 依据：
	 *            文档Id
	 * @return 该文档类别
	 */
	String getDocumentTypeByDocumentId(int documentId);

	/**
	 * @param 依据：
	 *            文档Id
	 * @return 该文档编号(documentNo)
	 */
	String getDocumentNoByDocumentId(int documentId);

	/**
	 * @param 依据：
	 *            文档Id
	 * @return 该文档编号(documentNo)
	 */
	String getTemplateByDocumentId(int documentId);

	/**
	 * @param 依据：
	 *            文档Id
	 * @return 该文档名称(accessory)
	 */
	String getAccessoryByDocumentId(int documentId);

	/**
	 * @param 依据：
	 *            文档Id
	 * @return 该文档审核建议(approvalResult)
	 */

	String getSuggestByDocumentId(int documentId);

	/**
	 * @param 依据：
	 *            用户id, 文档id
	 * @return 更新用户文档转态，更改为提交未审核，并更新时间,提交用户Id，文档名,文档状态
	 */
	int updateDocumentStateWhenSubmit(String submitUserId, int documentId, String accessory, String state);

	/**
	 * @param 依据：
	 *            用户id, 文档id
	 * @return 更新用户文档转态，更改为未提交,并更新时间,提交用户Id，文档名
	 */
	int updateDocumentStateWhenDelete(int documentId);

	Document getDocumentByTaskIdAndOrganizationId(@Param("documentTaskId") Integer documentTaskId,
			@Param("organizationId") Integer organizationId);

	// 增加于2018/11/21
	/**
	 * 统计该用户文档数量
	 */
	Integer UserGetDocumentCount(int organizationId);

	/**
	 * 统计该用户未提交的文档数量
	 */
	Integer UserGetUnsubmitDocumentCount(int organizationId);

	// 统计某学校的提交情况，提交数,未提交数
	Map getDocumentCountBySchoolId(@Param("organizationId") Integer organizationId);

	// 更新某次文档任务提醒次数
	Integer updateRemindDocumentByTaskid(@Param("documentTaskId") Integer documentTaskId);

	List<User> getUsersByDocTaskId(@Param("documentTaskId") Integer documentTaskId);

	// 删除某次任务的所有文档
	Integer deleteDocumentByTaskId(@Param("documentTaskId") Integer documentTaskId);
}