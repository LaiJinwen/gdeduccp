package edu.gd.ccp.util;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
 
import javax.imageio.ImageIO;
 
import com.swetake.util.Qrcode;
 
import jp.sourceforge.qrcode.QRCodeDecoder;
import jp.sourceforge.qrcode.data.QRCodeImage;
import jp.sourceforge.qrcode.exception.DecodingFailedException;
 
public class QRCodeUtil {
	
	
	
     public static void qrCodeEncode(String encodeddata,String filename) throws IOException { 
    	 
    	    File destFile = new File("D:\\GraductionProject\\gdeduccp\\src\\main\\webapp\\WEB-INF\\QRCode\\"+filename+".png");
    	    if(!destFile.exists())
    	    	destFile.createNewFile();
    	    
            Qrcode qrcode = new Qrcode(); 
            // 设置二维码排错率, L(7%)、M(15%)、Q(25%)、H(30%) 排错率越高可存储的信息越少，但对二维码的清晰度要求比较低
            qrcode.setQrcodeErrorCorrect('M'); 
            // N代表数字，A代表字符a-Z，B代表其他字符
            qrcode.setQrcodeEncodeMode('B');   
            // 设置二维码版本，取值范围为0-40，值越大尺寸越大，存储的信息越大
            qrcode.setQrcodeVersion(7);     
               
            // 获取二维码中需要存储的信息的字节数组
            byte[] d = encodeddata.getBytes("UTF8"); 
            
            BufferedImage bi = new BufferedImage(139, 139, BufferedImage.TYPE_INT_RGB); 
            // createGraphics 创建图层 
            Graphics2D g = bi.createGraphics(); 
            // 设置背景颜色（白色） 
            g.setBackground(Color.WHITE);   
            // 矩形 X、Y、width、height 
            g.clearRect(0, 0, 139, 139); 
            // 设置图像颜色（黑色） 
            g.setColor(Color.BLACK);
       
            if (d.length > 0 && d.length < 123) { 
                boolean[][] b = qrcode.calQrcode(d); 
                for (int i = 0; i < b.length; i++) { 
                    for (int j = 0; j < b.length; j++) { 
                        if (b[j][i]) { 
                            g.fillRect(j * 3 + 2, i * 3 + 2, 3, 3); 
                        } 
                    } 
                } 
            } 
               
//        Image img = ImageIO.read(new File("D:/tt.png"));  logo 
//        g.drawImage(img, 25, 55,60,50, null); 
            // 释放此图形的上下文以及它使用的所有系统资源。调用 dispose 之后，就不能再使用 Graphics 对象 
            g.dispose(); 
            // 刷新此 Image 对象正在使用的所有可重构的资源 
            bi.flush(); 
            
       
            ImageIO.write(bi, "png", destFile); 
//          System.out.println("Input Encoded data is：" + encodeddata); 
        } 
       
        /**
         * 解析二维码，返回解析内容
         * 
         * @param imageFile
         * @return
         */ 
        public static String qrCodeDecode(File imageFile) { 
            String decodedData = null; 
            QRCodeDecoder decoder = new QRCodeDecoder(); 
            BufferedImage image = null; 
            try { 
                image = ImageIO.read(imageFile); 
            } catch (IOException e) { 
                System.out.println("Error: " + e.getMessage()); 
            } 
       
            try { 
                decodedData = new String(decoder.decode(new J2SEImage(image)), "GBK"); 
//              System.out.println("Output Decoded Data is：" + decodedData); 
            } catch (DecodingFailedException dfe) { 
                System.out.println("Error: " + dfe.getMessage()); 
            } catch (UnsupportedEncodingException e) { 
                e.printStackTrace(); 
            } 
            return decodedData; 
        } 
       
        static class J2SEImage implements QRCodeImage { 
            BufferedImage image; 
           
            public J2SEImage(BufferedImage image) { 
                this.image = image; 
            } 
           
            public int getWidth() { 
                return image.getWidth(); 
            } 
           
            public int getHeight() { 
                return image.getHeight(); 
            } 
           
            public int getPixel(int x, int y) { 
                return image.getRGB(x, y); 
            } 
        } 
         
        public static void main(String[] args) { 
            String filePath = "d:/qrcode.png"; 
            File qrFile = new File(filePath); 
       
            // 二维码内容 
            String encodeddata = "http://202.116.195.79/gdeduccp"; 
            //String encodeddata = "http://www.baidu.com";
            try { 
                QRCodeUtil.qrCodeEncode(encodeddata,"aaa"); 
                System.out.println("OK");
            } catch (IOException e) { 
                e.printStackTrace(); 
            } 
       
            // 解码 
            String reText = QRCodeUtil.qrCodeDecode(qrFile); 
            System.out.println(reText); 
        } 
        

}