package edu.gd.ccp.entity;

import java.util.Date;

public class VoteResult {
    private Integer resultid;

    private Integer votetaskid;

    private Integer voterid;

    private String voteresult;

    private Date votetime;

    public Integer getResultid() {
        return resultid;
    }

    public void setResultid(Integer resultid) {
        this.resultid = resultid;
    }

    public Integer getVotetaskid() {
        return votetaskid;
    }

    public void setVotetaskid(Integer votetaskid) {
        this.votetaskid = votetaskid;
    }

    public Integer getVoterid() {
        return voterid;
    }

    public void setVoterid(Integer voterid) {
        this.voterid = voterid;
    }

    public String getVoteresult() {
        return voteresult;
    }

    public void setVoteresult(String voteresult) {
        this.voteresult = voteresult == null ? null : voteresult.trim();
    }

    public Date getVotetime() {
        return votetime;
    }

    public void setVotetime(Date votetime) {
        this.votetime = votetime;
    }
}