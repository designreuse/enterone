package com.yedam.fandemic.service.impl;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

import com.yedam.fandemic.login.Mail;
import com.yedam.fandemic.service.MailService;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	JavaMailSender mailSender;

	@Override
	public void sendEmail(Mail mail) {
	
				try {
					MimeMessage msg = mailSender.createMimeMessage();

					// 받는 사람을 설정 (수신자, 받는사람의 이메일 주소 객체를 생성해서 수신자 이메일주소를 담음)
					msg.addRecipient(RecipientType.TO, new InternetAddress(mail.getReceiveMail()));

					// 보내는 사람(이메일주소+이름)
					// (발신자, 보내는 사람의 이메일 주소와 이름을 담음)
					// 이메일 발신자
					msg.addFrom(
							new InternetAddress[] { new InternetAddress(mail.getSenderMail(), mail.getSenderName()) });

					// 이메일 제목 (인코딩을 해야 한글이 깨지지 않음)
					msg.setSubject(mail.getSubject(), "utf-8");
					// 이메일 본문 (인코딩을 해야 한글이 깨지지 않음)
					msg.setText(mail.getMessage(), "utf-8");

//                	html로 보낼 경우            
//					MimeMessage message = mailSender.createMimeMessage();
//					MimeMessageHelper helper = new MimeMessageHelper(message, true);
//					helper.setTo("hae_z@kakao.com");
//					helper.setText("<html><body><p>비밀번호</p<p>비밀번호 : 1234 </p></body></html>", true);

					// 이메일 보내기
					mailSender.send(msg);

				} catch (Exception e) {
					e.printStackTrace();
				}

	}

}
