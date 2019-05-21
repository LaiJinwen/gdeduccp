package edu.gd.ccp.util;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

public class EmailUtil {
	private static final String FROM = "1017122071@qq.com";

	public static void sendMail(String title, String email, String content) {
		Session session = getSession();
		MimeMessage message = new MimeMessage(session);
		try {
			message.setSubject(title);
			message.setSentDate(new Date());
			message.setFrom(new InternetAddress(FROM));
			message.addRecipients(RecipientType.TO, email);
			message.setContent(content, "text/html;charset=UTF-8");
			Transport.send(message);
			System.out.println("succeed");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Session getSession() {
		Properties props = new Properties();
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.smtp.host", "smtp.qq.com");
		props.setProperty("mail.smtp.auth", "true");
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(FROM, "85962335110GOOD?");
			}
		});
		return session;
	}
	public static void main(String[] a) {
		sendMail("test","20151002143@gdufs.edu.cn","测试");
	}
}

