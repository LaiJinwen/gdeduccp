package edu.gd.ccp.util;

import java.io.File;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import com.jacob.activeX.ActiveXComponent;
import com.jacob.com.ComThread;
import com.jacob.com.Dispatch;
import com.jacob.com.Variant;

public class JacobOfficeUtil {
	private static final int wdFormatPDF = 17;
	private static final int xlTypePDF = 0;
	private static final int ppSaveAsPDF = 32;

	// doc格式
	private static final int DOC_FMT = 0;

	/**
	 * docx格式
	 */
	private static final int DOCX_FMT = 12;

	public static void main(String[] args) {
//		JacobOfficeUtil.word2PDF("D:/cod/1.docx", "D:/cod/11.pdf");
//		System.out.println("转换完成！");

//		doc转为docx
//		try {
//			JacobOfficeUtil.convertDocFmt("D:/cod/1.doc", "D:/cod/4.docx", DOCX_FMT);
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}

//		List list = new ArrayList();
//		String file1 = "D:\\cod\\1.docx";
//		String file2 = "D:\\cod\\2.docx";
//		// String file3= "D:\\2.docx";
//		list.add(file1);
//		list.add(file2);
		// list.add(file3);
//		合并docx
//		uniteDoc(list, "d:\\cod\\3.docx");
     //docx转为htm
//		ChageFormat("d:\\cod\\","1.docx");
		 
	}

	public boolean convert2PDF(String inputFile, String pdfFile) {
		String suffix = getFileSufix(inputFile);
		File file = new File(inputFile);
		if (!file.exists()) {
			return false;
		}
		if (suffix.equals("pdf")) {
			return false;
		}
		if (suffix.equals("doc") || suffix.equals("docx") || suffix.equals("txt")) {
			return word2PDF(inputFile, pdfFile);
		} else if (suffix.equals("ppt") || suffix.equals("pptx")) {
			return ppt2PDF(inputFile, pdfFile);
		} else if (suffix.equals("xls") || suffix.equals("xlsx")) {
			return excel2PDF(inputFile, pdfFile);
		} else {
			return false;
		}
	}

	public static String getFileSufix(String fileName) {
		int splitIndex = fileName.lastIndexOf(".");
		return fileName.substring(splitIndex + 1);
	}

	// word转换为pdf
	public static boolean word2PDF(String inputFile, String pdfFile) {
		try {
			// 打开word应用程序
			ActiveXComponent app = new ActiveXComponent("Word.Application");
			// 设置word不可见
			app.setProperty("Visible", false);
			// 获得word中所有打开的文档,返回Documents对象
			Dispatch docs = app.getProperty("Documents").toDispatch();
			// 调用Documents对象中Open方法打开文档，并返回打开的文档对象Document
			Dispatch doc = Dispatch.call(docs, "Open", inputFile, false, true).toDispatch();
			// 调用Document对象的SaveAs方法，将文档保存为pdf格式
			//Dispatch.call(doc, "SaveAs", pdfFile, wdFormatPDF //word保存为pdf格式宏，值为17 );
			Dispatch.call(doc, "ExportAsFixedFormat", pdfFile, wdFormatPDF);// word保存为pdf格式宏，值为17
			// 关闭文档
			Dispatch.call(doc, "Close", false);
			// 关闭word应用程序
			app.invoke("Quit", 0);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// excel转换为pdf
	public static boolean excel2PDF(String inputFile, String pdfFile) {
		try {
			ActiveXComponent app = new ActiveXComponent("Excel.Application");
			app.setProperty("Visible", false);
			Dispatch excels = app.getProperty("Workbooks").toDispatch();
			Dispatch excel = Dispatch.call(excels, "Open", inputFile, false, true).toDispatch();
			Dispatch.call(excel, "ExportAsFixedFormat", xlTypePDF, pdfFile);
			Dispatch.call(excel, "Close", false);
			app.invoke("Quit");
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	// ppt转换为pdf
	public static boolean ppt2PDF(String inputFile, String pdfFile) {
		try {
			ActiveXComponent app = new ActiveXComponent("PowerPoint.Application");
			// app.setProperty("Visible", msofalse);
			Dispatch ppts = app.getProperty("Presentations").toDispatch();

			Dispatch ppt = Dispatch.call(ppts, "Open", inputFile, true, // ReadOnly
					true, // Untitled指定文件是否有标题
					false// WithWindow指定文件是否可见
			).toDispatch();

			Dispatch.call(ppt, "SaveAs", pdfFile, ppSaveAsPDF);

			Dispatch.call(ppt, "Close");

			app.invoke("Quit");
			return true;
		} catch (Exception e) {
			return false;
		}
	}
//将doc转为docx
	public static File convertDocFmt(String srcPath, String descPath, int fmt) throws Exception {
		// 实例化ComThread线程与ActiveXComponent
		ComThread.InitSTA();
		ActiveXComponent app = new ActiveXComponent("Word.Application");
		try {
			// 文档隐藏时进行应用操作
			app.setProperty("Visible", new Variant(false));
			// 实例化模板Document对象
			Dispatch document = app.getProperty("Documents").toDispatch();
			// 打开Document进行另存为操作
			Dispatch doc = Dispatch.invoke(document, "Open", Dispatch.Method,
					new Object[] { srcPath, new Variant(true), new Variant(true) }, new int[1]).toDispatch();

			Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] { descPath, new Variant(fmt) }, new int[1]);
			Dispatch.call(doc, "Close", new Variant(false));
			return new File(descPath);
		} catch (Exception e) {
			throw e;
		} finally {
			// 释放线程与ActiveXComponent
			app.invoke("Quit", new Variant[] {});
			ComThread.Release();
		}
	}

	// 合并docx
	public static void uniteDoc(List fileList, String savepaths) {
		if (fileList.size() == 0 || fileList == null) {
			return;
		}
		// 打开word
		ActiveXComponent app = new ActiveXComponent("Word.Application");// 启动word
		try {

			// 设置word不可见 ---也就是设置ActiveXComponent对象的一个属性
			app.setProperty("Visible", new Variant(false));
			// 获得documents对象----Variant。toDispatch()
			Object docs = app.getProperty("Documents").toDispatch();
			// 打开第一个文件
			// 功能调用，对ActiveX对象docs的"Open"属性执行Dispatch.Method（Dispatch.Put\Dispatch.Get等）操作，执行后"Open"的值为参数4，参数5为错误参数码常定义为new
			// int[1]，（注：call、get和put方法都是通过该方法实现的）
			Object doc = Dispatch.invoke((Dispatch) docs, // 调用目标
					"Open", Dispatch.Method,
					new Object[] { (String) fileList.get(fileList.size()-1), new Variant(false), new Variant(true) }, // 参数4
					new int[3]).toDispatch();// 参数5
		
//			Dispatch selection1 = Dispatch.get(app, "Selection").toDispatch(); 
//			//插入分页符
//			Dispatch.call(selection1,  "InsertBreak" ,  new Variant(7) );
			// 追加文件
			// 和上面一样，不过换种通俗的解释：参数1就是这个invoke方法的主题操作对象，参数2就是要对参数1执行的方法的名字，参数3就是参数2这个方法的具体操作;参数4就是一系列的参数;参数5为错误参数码常定义为new
			// int[1]
			for (int i = 0; i < fileList.size()-1; i++) {
				Dispatch.invoke(app.getProperty("Selection").toDispatch(), // 参数1
						"insertFile", // 参数2
						Dispatch.Method, // 参数3
						new Object[] { (String) fileList.get(i), "", new Variant(false), new Variant(false),
								new Variant(false) }, // 参数4
						new int[3]);// 参数5
				Dispatch selection = Dispatch.get(app, "Selection").toDispatch(); 
				//插入分页符
				Dispatch.call(selection,  "InsertBreak" ,  new Variant(7) );
			}
			// 保存新的word文件
			Dispatch.invoke((Dispatch) doc, "SaveAs", Dispatch.Method, new Object[] { savepaths, new Variant(12) },
					new int[3]);
			Variant f = new Variant(false);
			Dispatch.call((Dispatch) doc, "Close", f);// 该方法和get方法非常类似，他是把"Close"属性赋值给f
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException("合并word文件出错.原因:" + e);
		} finally {
			app.invoke("Quit", new Variant[] {});
		}
	}

//	转换为html
	public static boolean ChageFormat(String FolderPath, String FileName) {

		String FileFormat = "";
		String[] filesplit=FileName.split("\\.");
		FileFormat =filesplit[filesplit.length-1];// FileName.substring(FileName.length() - 5, FileName.length());

		if (FileFormat.equalsIgnoreCase("docx")) {
			String DocFile = FolderPath + "//" + FileName;
			//System.out.println("word文件路径：" + DocFile);
			// word文件的完整路径
			String HtmlFile = DocFile.substring(0, (DocFile.length() - 5)) + ".html";
			//System.out.println("htm文件路径：" + HtmlFile);
			// html文件的完整路径
			ActiveXComponent app = new ActiveXComponent("Word.Application");
			// 启动word
			try {
				app.setProperty("Visible", new Variant(false));
				// 设置word程序非可视化运行
				Dispatch docs = app.getProperty("Documents").toDispatch();
				Dispatch doc = Dispatch
						.invoke(docs, "Open", Dispatch.Method,
								new Object[] { DocFile, new Variant(true), new Variant(true) }, new int[3])
						.toDispatch();
				// 打开word文件
				Dispatch.invoke(doc, "SaveAs", Dispatch.Method, new Object[] { HtmlFile, new Variant(8) }, new int[1]);
				// 作为htm格式保存文件
				Dispatch.call(doc, "Close", new Variant(false));
				// 关闭文件
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				app.invoke("Quit", new Variant[] {});
				// 退出word程序
			}
			// 转化完毕
			return true;
		}
		return false;
	}
	/**
     * 判断文件是否存在
     * @param httpPath
     * @return
     */
    public static Boolean existHttpPath(String httpPath){
        URL httpurl = null;
        try {
        httpurl = new URL(new URI(httpPath).toASCIIString());
        URLConnection urlConnection = httpurl.openConnection();
       // urlConnection.getInputStream();
       Long TotalSize=Long.parseLong(urlConnection.getHeaderField("Content-Length"));  
           if (TotalSize <= 0){
            return false;
           }
           return true;
        } catch (Exception e) {
  
        return false;
        }
        }
}
