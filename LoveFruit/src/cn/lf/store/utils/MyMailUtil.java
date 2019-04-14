package cn.lf.store.utils;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Date;
import java.util.Properties;

public class MyMailUtil {
    // 发送人地址
    private  static String senderAddr = "3301461240@qq.com";
    // 收件人地址
    private  static String recipientAddr;
    // 发送人账户密码
    private  static String senderPassWord = "kpuggceydtrxchcj";

    /**
     * 这是发送一个简单的邮件
     * 1. 创建一个邮件对象
     * 2. 设置以下发件人 邮箱地址
     * 3. 设置下收件人邮箱地址
     * 4. 设置邮件主题
     * 5. 设置邮箱内容
     *
     * @param email,emailMsg
     * @return true
     */

    public static boolean sendMessage(String email, String emailMsg) throws MessagingException {
        // 设置收信人
        recipientAddr = email;
        // 1. 连接邮件服务器的参数配置
        Properties properties = new Properties();
        // 设置用户的认证方式
        properties.setProperty("mail.smtp.auth", "true");
        // 设置传输协议
        properties.setProperty("mail.transpost.protocol", "smtp");
        //设置发送人的SMTP服务器
        properties.setProperty("mail.smtp.host", "smtp.qq.com");
        //  2. 创建定义整个应用程序所需的所有环境
        Session session = Session.getInstance(properties);
        // 3. 控制台信息
//        session.setDebug(true);
        // 创建一个邮件对象
        MimeMessage msg = new MimeMessage(session);
        // 设置发件人地址
        msg.setFrom(new InternetAddress(senderAddr));

        //设置接受人
        msg.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(recipientAddr));
        //设置邮件的主题
        msg.setHeader("激活邮件", "UTF-8");
        //设置邮件内容
        String url="http://192.168.0.100:8080/LoveFurist/UserServlet?method=active&code="+emailMsg;
        String content="<h1>来自天天满鲜的激活邮件!激活请点击以下链接!</h1><h3><a href='"+url+"'>"+url+"</a></h3>";
        try {
            msg.setContent(content, "text/html;charset=UTF-8");
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //发送的日期
        try {
            msg.setSentDate(new Date());
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        //4. 根据对象获得session的transport
        Transport transport = session.getTransport();

        // 设置发送人的账户密码
        transport.connect(senderAddr, senderPassWord);
        // 发送信息
        transport.sendMessage(msg, msg.getAllRecipients());

        //结束
        transport.close();
        return true;
    }
    public static void main(String[] args) throws MessagingException {

        //sendMessage(null);
    }
}
