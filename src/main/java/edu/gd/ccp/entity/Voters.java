package edu.gd.ccp.entity;

import java.util.Date;

public class Voters {
    private Integer voterid;

    private Integer votetaskid;

    private String voterstate;

    private Date votetime;

    private String organizationno;
	private Integer remind;

	public Integer getRemind() {
		return remind;
	}

	public void setRemind(Integer remind) {
		this.remind = remind;
	}
    public Integer getVoterid() {
        return voterid;
    }

    public void setVoterid(Integer voterid) {
        this.voterid = voterid;
    }

    public Integer getVotetaskid() {
        return votetaskid;
    }

    public void setVotetaskid(Integer votetaskid) {
        this.votetaskid = votetaskid;
    }

    public String getVoterstate() {
        return voterstate;
    }

    public void setVoterstate(String voterstate) {
        this.voterstate = voterstate == null ? null : voterstate.trim();
    }

    public Date getVotetime() {
        return votetime;
    }

    public void setVotetime(Date votetime) {
        this.votetime = votetime;
    }

    public String getOrganizationno() {
        return organizationno;
    }

    public void setOrganizationno(String organizationno) {
        this.organizationno = organizationno == null ? null : organizationno.trim();
    }
}