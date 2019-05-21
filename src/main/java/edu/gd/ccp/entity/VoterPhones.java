package edu.gd.ccp.entity;

public class VoterPhones {
    private Integer id;

    private Integer votetaskid;

    private String phones;

    private String ips;

    private String organizationnos;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVotetaskid() {
        return votetaskid;
    }

    public void setVotetaskid(Integer votetaskid) {
        this.votetaskid = votetaskid;
    }

    public String getPhones() {
        return phones;
    }

    public void setPhones(String phones) {
        this.phones = phones == null ? null : phones.trim();
    }

    public String getIps() {
        return ips;
    }

    public void setIps(String ips) {
        this.ips = ips == null ? null : ips.trim();
    }

    public String getOrganizationnos() {
        return organizationnos;
    }

    public void setOrganizationnos(String organizationnos) {
        this.organizationnos = organizationnos == null ? null : organizationnos.trim();
    }
}