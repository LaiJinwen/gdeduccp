package edu.gd.ccp.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.gd.ccp.dao.OrganizationMapper;
import edu.gd.ccp.entity.Organization;
import edu.gd.ccp.service.AdminOrgazationService;

@Service("adminOrganService")
public class AdminOrganizationServiceImpl implements AdminOrgazationService {
	
	@Autowired
	OrganizationMapper organMapper;
	@Override
	public List<Organization> getAllOrganzation(String organizationName) {
		// TODO 自动生成的方法存根
		return organMapper.selectAllOrganzations(organizationName);
	}

	@Override
	public List<Organization> getOrganNameByBelongLevelType(String[] belong,String[] level,String[] type) {
		
		return organMapper.selectByBelongLevelType(belong, level, type);
	}

	@Override
	public int addNewOrganization(Organization organ) {
		return organMapper.insertSelective(organ);
	}

	@Override
	public int deleteOrganization(int organId) {
		return organMapper.deleteByPrimaryKey(organId);
	}

	@Override
	public Organization getOrganizationById(int organId) {
		return organMapper.selectByPrimaryKey(organId);
	}

	@Override
	public int doUpdateOrganization(Organization organization) {
		return organMapper.updateByPrimaryKeySelective(organization);
	}

}
