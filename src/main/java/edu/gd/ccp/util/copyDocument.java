package edu.gd.ccp.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

public class copyDocument {
 
	/**
	 * 
	 * @param filename  领导上传的文档的原名
	 * @param desPath	原文档目录的存放路径
	 * @param desPath_bUp	备份文档存放目录的路径
	 * @throws FileNotFoundException  上传的原文档不存在
	 */
	public static void copyDocu(String filName,String filePath,String desPath_bUp) throws FileNotFoundException 
	{
		int n = 0;
		FileInputStream fis = new FileInputStream(filePath+"\\"+filName);
		File file_bUp = new File(desPath_bUp,"bUp_"+filName);
		FileOutputStream fos = new FileOutputStream(desPath_bUp+"\\"+"bUp_"+filName);
		try {
			while((n=fis.read())!=-1)
			{
				fos.write(n);
			}
			fos.close();
			fis.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	public static void copyDocu2(String filName,String filePath,String fileNameBackUp) throws FileNotFoundException 
	{
		int n = 0;
		FileInputStream fis = new FileInputStream(filePath+"\\"+filName);
		//File file_bUp = new File(desPath_bUp,"bUp_"+filName);
		
		FileOutputStream fos = new FileOutputStream(filePath+"\\"+fileNameBackUp);
		try {
			while((n=fis.read())!=-1)
			{
				fos.write(n);
			}
			fos.close();
			fis.close();
		} catch (IOException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			
		}
	}
	public static void main(String[] args) throws FileNotFoundException {
		copyDocu("123123123.ico","C:\\Java工具\\apache-Tomcat8.0\\apache-tomcat-8.0.26\\wtpwebapps\\gdeduccp\\multipart\\doc","C:\\Java工具\\apache-Tomcat8.0\\apache-tomcat-8.0.26\\wtpwebapps\\gdeduccp\\multipart\\doc_bUp");
	}
}
