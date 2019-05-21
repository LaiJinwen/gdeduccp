package edu.gd.ccp.service;

import java.util.List;

import edu.gd.ccp.entity.Organization;

public interface AdminOrgazationService {
	
	/**
	 * 获取organization表的所有元素
	 * @return List<Organization>
	 */
	public List<Organization> getAllOrganzation(String organizationName);
	
    /**
     * 根据 组织关系、办学层次、学校类别
     * @param belong 组织关系
     * @param level 办学层次
     * @param type 学校类别
     * @return 符合条件的  学校名字
     */
	public List<Organization> getOrganNameByBelongLevelType(String[] belong,String[] level,String[] type);
	
	/**
	 * 插入新的组织信息
	 * @param organ  组织实体对象
	 * @return 1：成功 ; 0：失败
	 */
	public int addNewOrganization(Organization organ);
	
	/**
	 * 根据组织id删除记录
	 * @param organId
	 * @return 1：成功 0：失败
	 */
	public int deleteOrganization(int organId);
	
	/**
	 * 根据Id查询组织实体类
	 * @param organId 
	 * @return Organization
	 */
	public Organization getOrganizationById(int organId);
	
	/**
	 * 更新实体信息
	 * @param organization  组织实体对象
	 * @return	1：成功 0：失败
	 */
	public int doUpdateOrganization(Organization organization);
}
