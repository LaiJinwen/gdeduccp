package edu.gd.ccp.dao;

import org.apache.ibatis.annotations.Param;

import edu.gd.ccp.entity.VoterPhones;

public interface VoterPhonesMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VoterPhones record);

    int insertSelective(VoterPhones record);

    VoterPhones selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VoterPhones record);

    int updateByPrimaryKey(VoterPhones record);
    // 2018.12.07
    // 更新数据库中的手机信息
    int updateStateOnVoterPhone(@Param("voteTaskId")int voteTaskId, @Param("phones")String phones, 
    		@Param("ips")String ips, @Param("mobileIds")String mobileIds);
}