<%@ page language="java" import="java.util.*,com.zhuozhengsoft.pageoffice.*" pageEncoding="utf-8"%>
<%
FileSaver fs=new FileSaver(request,response);
String filename=java.net.URLDecoder.decode(request.getParameter("filename"),"utf-8");
String docno=java.net.URLDecoder.decode(request.getParameter("docno"),"utf-8");

System.out.println("保存子目录"+docno+"文件名"+filename);
fs.saveToFile(request.getSession().getServletContext().getRealPath("/WEB-INF/view/doc/")+docno+"/"+filename);
fs.close();
%>

