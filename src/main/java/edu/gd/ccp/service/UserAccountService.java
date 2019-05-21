package edu.gd.ccp.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
 
import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.UserWithOrganName;
import net.sf.json.JSONObject;

//用户服务，登录、注册、资料修改、找回密码
public interface UserAccountService {
  public JSONObject userLogin(String userId,String password);
  
	// 登录
	// 注册
	// 资料修改
	//
	/*** 增加于2018/11/16 */
	// 资料修改
	public void personalInfoModify(User user);

	// 用户查看个人所有信息
	public List<Map<Object, Object>> getInfoByUserId(String userId); 

	/*
	 * 2018 11 18 添加新的用户
	 */
	public int addNewUser(User user);
	/*
	 * 2018 11 18 根据ID修改用户信息
	 */
	public int updateUserInfoByUserId(User user);
	/*
	 * 2018 11 18 根据ID删除用户信息
	 */
	public int deleteUserById(String userid);
	/**
	 * 2018 11 18 获取用户列表
	 */
	public List<Map> getUserList(String organizationName);
	/**
	 * 2018 11 18  根据用户ID返回单个用户
	 */
	public User getOneUserByPrimaryKey(String userid);
	
	/**
	 * 2018 12 17 获取带组织名字的用户实体类
	 */
	public List<UserWithOrganName> selectAllUserWithOrganName(String organizationName);
	
	/*
	 *  2018 12 25 根据用户Id获取相应的组织自编号、id
	 */
	public Map<String,Integer> getOrganizationNoAndIdByUserId(String userId);
	
	/*
	 * 2018 12 25 根据组织Id获取用户id和组织自编号
	 */
	public List<Map<String,String>> getUserIdAndOrganNo(Integer organId);	
	//获取所有管理员
	List<User> selectAdmins();
	//根据单位id或编号获取单位的所有用户
	List<User> selectUsersByIdOrNo(String organizationNo,Integer organizationId);
}
