package edu.gd.ccp.util;

import java.awt.BasicStroke;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.RoundRectangle2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Hashtable;
import javax.imageio.ImageIO;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/***************************************************************************
 * <pre>生成二维码工具类</pre>
 * @文件名称:  QRCodeTool.java
 * @包   路   径：  
 * @版权所有：2017
 *
 * @类描述:  
 * @版本: V2.0
 * @创建人： 
 * @创建时间：2017年8月16日 下午2:58:58
 ***************************************************************************/
public class QRCodeTool {


private static final String CHARSET = "UTF-8"; // 字符集格式


public static final String FORMAT_NAME = "JPG"; // 二维码图片格式


private static final int QRCODE_SIZE = 600; // 二维码尺寸

private static final int WIDTH = 160; // LOGO宽度

private static final int HEIGHT = 160; // LOGO高度


/**
 * <p>生成二维码图片</p>
 * @Description:
 * @param content
 * @return
 * @throws Exception
*/
public static BufferedImage createImage(String content) throws Exception {
Hashtable<EncodeHintType, Object> hints = new Hashtable<EncodeHintType, Object>();
hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
hints.put(EncodeHintType.CHARACTER_SET, CHARSET);
hints.put(EncodeHintType.MARGIN, 1);


BitMatrix bitMatrix = new MultiFormatWriter().encode(content, BarcodeFormat.QR_CODE, QRCODE_SIZE, QRCODE_SIZE, hints);
int width = bitMatrix.getWidth();
int height = bitMatrix.getHeight();
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
for (int x = 0; x < width; x++) {
for (int y = 0; y < height; y++) {
image.setRGB(x, y, bitMatrix.get(x, y) ? 0xFF000000 : 0xFFFFFFFF);
}
}
insertImage(image, "D:/logo.jpg", true); // 生成的二维码中添加logo
return image;
}


/**
 * <p>二维码中添加LOGO</p>
 * @Description:
 * @param source 二维码
 * @param imgPath 需要添加的logo图片路径
 * @param needCompress 是否压缩logo  true/false
 * @throws Exception
*/
public static void insertImage(BufferedImage source, String imgPath, boolean needCompress) throws Exception {
File file = new File(imgPath);
if (!file.exists()) {
System.err.println("" + imgPath + "   该文件不存在！");
return;
}
Image src = ImageIO.read(new File(imgPath));
int width = src.getWidth(null);
int height = src.getHeight(null);
if (needCompress) { // 压缩LOGO
if (width > WIDTH) {
width = WIDTH;
}
if (height > HEIGHT) {
height = HEIGHT;
}
Image image = src.getScaledInstance(width, height, Image.SCALE_SMOOTH);
BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
Graphics g = tag.getGraphics();
g.drawImage(image, 0, 0, null); // 绘制缩小后的图
g.dispose();
src = image;
}
// 插入LOGO
Graphics2D graph = source.createGraphics();
int x = (QRCODE_SIZE - width) / 2;
int y = (QRCODE_SIZE - height) / 2;
graph.drawImage(src, x, y, width, height, null);
Shape shape = new RoundRectangle2D.Float(x, y, width, width, 6, 6);
graph.setStroke(new BasicStroke(3f));
graph.draw(shape);
graph.dispose();
}
}