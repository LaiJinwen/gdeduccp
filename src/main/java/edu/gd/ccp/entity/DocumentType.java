package edu.gd.ccp.entity;

public class DocumentType {
    private Integer documenttypeid;

    private String documenttype;

    public Integer getDocumenttypeid() {
        return documenttypeid;
    }

    public void setDocumenttypeid(Integer documenttypeid) {
        this.documenttypeid = documenttypeid;
    }

    public String getDocumenttype() {
        return documenttype;
    }

    public void setDocumenttype(String documenttype) {
        this.documenttype = documenttype == null ? null : documenttype.trim();
    }
}