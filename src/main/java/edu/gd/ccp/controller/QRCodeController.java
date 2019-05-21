package edu.gd.ccp.controller;

import java.awt.image.BufferedImage;


import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.gd.ccp.util.QRCodeTool;



/***************************************************************************
 * <pre>生成二维码</pre>
 * @文件名称:  QRCodeController.java
 * @包   路   径：  cn.org.bjca.seal.esspdf.platform.tools
 * @版权所有：北京数字认证股份有限公司 (C) 2017
 *
 * @类描述:  
 * @版本: V2.0
 * @创建人： dongxiaobing
 * @创建时间：2017年8月16日 下午4:23:45
 ***************************************************************************/
@Controller
@RequestMapping(value = "/QRCode")
public class QRCodeController {

/**
 * <p>映射二维码生成页面</p>
 * @Description:
 * @param request
 * @return
*/
@RequestMapping("")
public String indexJsp(HttpServletRequest request){
return "index";
}

/**
 * <p>二维码内容</p>
 * @Description:
 * @param request
 * @param response
 * @throws Exception
*/
@RequestMapping("/getQRCode")
public void getQRCode(HttpServletRequest request,HttpServletResponse response) throws Exception{
String content = "http://news.gdufs.edu.cn/Item/95659.aspx";
encode(content, response);
}



/**
 * <p>生成二维码输出页面</p>
 * @Description:
 * @param content
 * @param response
 * @throws Exception
*/
public static void encode(String content,HttpServletResponse response) throws Exception {
BufferedImage image = QRCodeTool.createImage(content);
ImageIO.write(image, QRCodeTool.FORMAT_NAME, response.getOutputStream());
}
}
