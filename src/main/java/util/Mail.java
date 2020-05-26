package util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class Mail {
    public static boolean mail(String link, String to) {
        try {
            Properties prop = new Properties();
            prop.setProperty("mail.host", "smtp.qq.com");
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);
            Session session = Session.getDefaultInstance(prop, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("467178864@qq.com", "pkyqmpzrwdwrbhij");
                }
            });

            Transport ts = session.getTransport();

            ts.connect("smtp.qq.com", "467178874@qq.com", "pkyqmpzrwdwrbhij");


            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress("467178874@qq.com"));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("重置密码链接");

            message.setContent("点击这个链接重置密码:\n" + link, "text/html;charset=UTF-8");

            ts.sendMessage(message, message.getAllRecipients());

            ts.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean captcha(String code, String to) {
        try {
            Properties prop = new Properties();
            prop.setProperty("mail.host", "smtp.qq.com");
            prop.setProperty("mail.transport.protocol", "smtp");
            prop.setProperty("mail.smtp.auth", "true");
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            prop.put("mail.smtp.ssl.enable", "true");
            prop.put("mail.smtp.ssl.socketFactory", sf);
            Session session = Session.getDefaultInstance(prop, new Authenticator() {
                public PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("467178864@qq.com", "pkyqmpzrwdwrbhij");
                }
            });

            Transport ts = session.getTransport();

            ts.connect("smtp.qq.com", "467178874@qq.com", "pkyqmpzrwdwrbhij");


            MimeMessage message = new MimeMessage(session);

            message.setFrom(new InternetAddress("467178874@qq.com"));

            message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));

            message.setSubject("您的验证码");

            message.setContent("您的验证码是：" + code, "text/html;charset=UTF-8");

            ts.sendMessage(message, message.getAllRecipients());

            ts.close();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
}