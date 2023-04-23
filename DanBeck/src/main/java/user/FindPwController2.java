package user;

import java.io.IOException;
import java.util.*;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/user/findPw2.do")
public class FindPwController2 extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String from = "gusehd1995@naver.com";
		String username = "gusehd1995@naver.com";
		String pass = "!1nicegood2!";
		
		Random rand = new Random();
		int randCode = rand.nextInt(900000) + 100000;
		String authCode = Integer.toString((int)randCode);
		Properties serverInfo = new Properties();
		serverInfo.put("mail.smtp.host", "smtp.naver.com");
		serverInfo.put("mail.smtp.port", "456");
		serverInfo.put("mail.smtp.auth", "true");
		serverInfo.put("mail.smtp.starttls.enable", "true");
		serverInfo.put("mail.smtp.starttls.required", "true");
		serverInfo.put("mail.smtp.ssl.enable", "true");
		serverInfo.put("mail.smtp.ssl.trust", "smtp.naver.com");
		serverInfo.put("mail.smtp.ssl.protocols", "TLSv1.2");
		serverInfo.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		
		Session mailSession = Session.getInstance(serverInfo, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				  return new PasswordAuthentication(username, pass);
			}
		});
		
		
		try {
		    MimeMessage message = new MimeMessage(mailSession);
		    message.setFrom(new InternetAddress(from));
		    message.addRecipient(Message.RecipientType.TO, new InternetAddress(req.getParameter("email")));
		    message.setSubject("이메일 인증 코드");
		    message.setText("인증 코드는 " + authCode + " 입니다.");
		    Transport.send(message);
		    System.out.println("이메일이 성공적으로 전송되었습니다.");
		  } catch (MessagingException mex) {
		    mex.printStackTrace();
		    System.out.println("이메일 전송에 실패했습니다.");
		  }
	}
}
















































