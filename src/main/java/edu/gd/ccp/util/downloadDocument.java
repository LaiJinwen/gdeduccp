package edu.gd.ccp.util;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class downloadDocument {
	public static void download(String filePath, String fileName,HttpServletResponse response) throws IOException {
		//获取输入流  
        InputStream bis = new BufferedInputStream(new FileInputStream(new File(filePath)));
        //转码，免得文件名中文乱码  
        fileName = URLEncoder.encode(fileName,"UTF-8");  
        
//        HttpServletResponse response = null;
		//设置文件下载头  
        response.addHeader("Content-Disposition", "attachment;filename=" + fileName);    
        //1.设置文件ContentType类型，这样设置，会自动判断下载文件类型    
        response.setContentType("multipart/form-data");   
        BufferedOutputStream out = new BufferedOutputStream(response.getOutputStream());  
        int len = 0;  
        while((len = bis.read()) != -1){  
            out.write(len);  
            out.flush();  
        }  
        out.close();
	}
}
