package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.User;
import edu.gd.ccp.entity.UserWithOrganName;

public interface UserMapper {
    int deleteByPrimaryKey(String userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(String userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    /**用户根据自己的userId换算出组织名 */
    String getOrganizationNameByUserId(String userId);
    /** 用户根据自己的userId换算出组织id */
    int getOrganizationIdByUserId(String userId);
    
    /*** 增加于2018/11/16 */
    /** 用户由个人userId查看自己信息 */
    List<Map<Object, Object>> showInfoByUserId(String userId);
    /**
     * 增加于2018 11 19
     * 查询所有用户  返回用户列表
     */
    List<Map> selectAllUsers(@Param("organizationName") String organizationName);   
    /**
     * 增加与 2018 12 17
     * 结合organization表联合查询用户信息
     */
    List<UserWithOrganName> selectAllUserWithOrganName(String organizationName);
    
    /**
     * 增加于 2018 12 25
     * @return 查询到的组织 自编号 组织Id
     */
    Map<String,Integer> selectOrganNoAndOrganIdByUserId(String userId);
    
    /**
     * 增加于 2018 12 25
     * @param organId 组织Id
     * @return 查询到的 userId 和 组织 NO封装
     */
    List<Map<String,String>> selectUserIdAndOrganNo(Integer organId);   
    //获取所有工委管理员
    List<User> selectAdmins();
    
    List<User> selectUsersByIdOrNo(@Param("organizationNo") String organizationNo,@Param("organizationId") Integer organizationId);   
}