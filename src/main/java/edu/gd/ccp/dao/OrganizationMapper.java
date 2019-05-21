package edu.gd.ccp.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.Organization;

public interface OrganizationMapper {
    int deleteByPrimaryKey(Integer organizationid);

    int insert(Organization record);

    int insertSelective(Organization record);

    Organization selectByPrimaryKey(Integer organizationid);

    int updateByPrimaryKeySelective(Organization record);

    int updateByPrimaryKey(Organization record);
    
    List<Organization> getSchoolsByType(@Param("organizationType") String organizationType,@Param("organizationName") String organizationName);
  
    /**
     * 根据组织类别查找组织的编号
     * @param orType 组织类别 String类型
     * @return  组织的id  organizationId
     */
    List<Integer> selectByOrType(String orType);
    
    /**
     * 根据组织类别、层次、组织关系查找组织
     * @param orType 组织类别 String类型
     * @return  组织的id  organizationId
     */
    List<Organization> selectByCondition(@Param("orType") String orType,@Param("level") String level,@Param("belong") String belong);  
    //根据组织类别、层次、组织关系查找组织id
    List<Integer> getOridganizationIdByCondation(@Param("organizationType") String organizationType,@Param("belong") String belong,@Param("schoolLevel") String schoolLevel);
    List<Organization> getOridganizationByCondation(@Param("organizationType") String organizationType,@Param("belong") String belong,@Param("schoolLevel") String schoolLevel);
    /**
     * 获取 organization表中的所有记录
     * @return List<Organization>
     */
    public List<Organization> selectAllOrganzations(@Param("organizationName") String organizationName);
    
    /**
     * 根据 组织关系、办学层次、学校类别
     * @param belong 组织关系
     * @param level 办学层次
     * @param type 学校类别
     * @return List<Organization>
     */
    List<Organization> selectByBelongLevelType(@Param("belong")String[] belong,@Param("level")String[] schoolLevel,@Param("type")String[] type);
    // 2019.01.01
    List<Organization> listAllOrganization();
}