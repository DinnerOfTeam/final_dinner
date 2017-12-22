package com.finalTotal.dinner.code.cont;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalTotal.dinner.code.model.EmailVO;

@Controller
@RequestMapping("/code")
public class EmailCodeCont {
	public static final Logger log= LoggerFactory.getLogger(EmailCodeCont.class);
	
	// 이메일 폼
	@RequestMapping(value= "/email.do", method= RequestMethod.GET)
	public String email_form() {
		
		return "code/email";
	}
	
	// 이메일 보내기
	@RequestMapping(value= "/email.do", method= RequestMethod.POST)
	public String email_submit(@ModelAttribute EmailVO vo) {
		log.info("email 보내기 parameter : vo={}", vo);
		
		Properties pro= System.getProperties();
		pro.put("mail.smtp.host", "smtp.naver.com");
		pro.put("mail.smtp.auth", "true");
		
		Session se= Session.getDefaultInstance(pro, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("bearv1892", "1th");
			}
		});
		
		MimeMessage msg= new MimeMessage(se);
		
		try {
			msg.setFrom(new InternetAddress(vo.getFrom()));
			InternetAddress[] add= {new InternetAddress(vo.getTo())};
			msg.addRecipients(Message.RecipientType.TO, add);
			msg.setSubject(vo.getTitle());
			msg.setText(vo.getMsg());
			
			Transport.send(msg);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		return "code/email";
	}
	
/*	@RequestMapping("/test/email.do")
	public String email_test() {
		Properties pro= System.getProperties();
		pro.put("mail.smtp.host", "smtp.naver.com");
		pro.put("mail.smtp.auth", "true");
		System.out.println("ok pro");
		
		Session se= Session.getDefaultInstance(pro, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("bearv1892", "1theowkd13#");
			}
		});
		MimeMessage msg= new MimeMessage(se);
		System.out.println("ok msg");
		
		try {
			msg.setFrom(new InternetAddress("bearv1892@naver.com"));
			InternetAddress[] add= {new InternetAddress("bearv123@daum.net")};
			msg.addRecipients(Message.RecipientType.TO, add);
			msg.setSubject("테스트 메시지");
			msg.setText("테스트로 잘 가겟지???");
			System.out.println("ok msg setting");
			
			Transport.send(msg);
			System.out.println("ok trans");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return "redirect:/index.do";
	}*/
}
