package edu.gd.ccp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.DocumentMapper;
import edu.gd.ccp.dao.UserMapper;
import edu.gd.ccp.entity.Document;
import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.UserWithOrganName;
import edu.gd.ccp.service.UserAccountService;
import edu.gd.ccp.util.MD5Util;
import net.sf.json.JSONObject;
import edu.gd.ccp.service.ex.BaseException;

@Service("userService")
public class UserAccountServiceImpl implements UserAccountService {
	// 依赖注入
	@Autowired
	private UserMapper userMapper;

	@Override
	public JSONObject userLogin(String userId, String password) {
		Map<String, Object> result = new HashMap<String, Object>();
		try {

			User user = userMapper.selectByPrimaryKey(userId);

			if (user != null) {
				if (user.getPassword().equals(MD5Util.doubleEncoderByMd5(password))) {// MD5Util.doubleEncoderByMd5(password)))
					// {
					result.put("status", 1);
					result.put("reason", "登录成功！");
					result.put("userType", user.getUsertype());
					result.put("userId", user.getUserid());
					result.put("userName", user.getUsername());
				} else {
					result.put("status", 0);
					result.put("reason", "登录失败！用户名或密码错误。");
				}
			} else {
				result.put("status", 0);
				result.put("reason", "对不起！该用户不存在。");
			}
		} catch (Exception e) {
			e.printStackTrace();
			result.put("status", 0);
			result.put("reason", "对不起！登录出错，请稍后重试。");
			throw new RuntimeException();
		} finally {
			return JSONObject.fromObject(result);
		}
	}

	/*** 增加于2018/11/16 */
	@Override
	public List<Map<Object, Object>> getInfoByUserId(String userId) {
		// TODO 自动生成的方法存根
		return userMapper.showInfoByUserId(userId);
	}

	@Override
	public void personalInfoModify(User user) {
		// TODO 自动生成的方法存根
		userMapper.updateByPrimaryKeySelective(user);
	}

	/*** 增加于2018/11/18 */
	@Override
	public int addNewUser(User user) throws BaseException {
		// TODO 校验与异常检测
		// 检验邮箱格式、敏感词汇
		return userMapper.insertSelective(user);
	}

	/*** 增加于2018/11/18 */
	@Override
	public int updateUserInfoByUserId(User user) throws BaseException {
		// TODO 校验与异常检测
		// 检验邮箱格式、敏感词汇
		return userMapper.updateByPrimaryKeySelective(user);
	}

	/*** 增加于2018/11/18 */
	@Override
	public int deleteUserById(String userid) throws BaseException {
		int result = userMapper.deleteByPrimaryKey(userid);
		if (result != 1) {
			throw new BaseException("删除失败 ");
		} else
			return result;
	}

	/*** 增加于2018/11/18 */
	@Override
	public List<Map> getUserList(String organizationName) throws BaseException {
		return userMapper.selectAllUsers(organizationName);
	}

	/*** 增加于2018/11/18 */
	@Override
	public User getOneUserByPrimaryKey(String userid) throws BaseException {
		return userMapper.selectByPrimaryKey(userid);
	}
	

	/*** 增加于2018/11/25 */
	@Override
	public List<UserWithOrganName> selectAllUserWithOrganName(String organizationName) {
		return userMapper.selectAllUserWithOrganName(organizationName);
	}
	
	/*** 增加于2018/12/25 */
	@Override
	public Map<String,Integer> getOrganizationNoAndIdByUserId(String userId) {
		return userMapper.selectOrganNoAndOrganIdByUserId(userId);
	}
	
	/*** 增加于2018/12/25 */
	@Override
	public List<Map<String, String>> getUserIdAndOrganNo(Integer organId) {
		return userMapper.selectUserIdAndOrganNo(organId);
	}

	@Override
	public List<User> selectAdmins() {
		// TODO Auto-generated method stub
		return this.userMapper.selectAdmins();
	}		
	//根据单位id或编号获取单位的所有用户
	@Override
	public List<User> selectUsersByIdOrNo(String organizationNo,Integer organizationId){
		return this.userMapper.selectUsersByIdOrNo(organizationNo, organizationId);
	}
}
