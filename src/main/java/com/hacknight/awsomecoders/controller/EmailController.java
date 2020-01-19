package com.hacknight.awsomecoders.controller;

import com.hacknight.awsomecoders.model.Email;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import javax.mail.internet.MimeMessage;
import java.io.StringWriter;
import java.util.Properties;

@Controller
public class EmailController {
    @Autowired
    @Qualifier("mailsender1")
    private JavaMailSender emailSender;

    @Autowired
    @Qualifier("velocityengine")
    private VelocityEngine velocityEngine;

    @Bean
    @Qualifier("mailsender1")
    public JavaMailSender getJavaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(465);

        mailSender.setUsername("syndicatebankapp@gmail.com");
        mailSender.setPassword("syndicate@123");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");

        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.fallback", "false");


        return mailSender;
    }

    @Bean
    @Qualifier("velocityengine")
    VelocityEngine velocityEngine(){
        Properties p = new Properties();
        p.setProperty("resource.loader", "class");
        p.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        return new VelocityEngine(p);
    }

    @GetMapping("/sendEmail")
    public void sendSimpleMessage() {


        String to = "pkpray2@gmail.com";
        String subject = "Referel for Syndicate Innovate Challenge";
        String text = "you have been reffered by the admin";

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(to);
        message.setSubject(subject);
        message.setText(text);
        emailSender.send(message);

        System.out.println("email sent successFully");
    }
    @PostMapping("/sendEmail1")
    public ResponseEntity<Email> sendEmailwithTemplate(@RequestBody Email email) throws Exception {

        VelocityContext context = new VelocityContext();
        context.put("name", "Piyush");
        context.put("link",email.getLink());
//        String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "referalemail.vm", "UTF-8", model);

        StringWriter stringWriter = new StringWriter();
        velocityEngine.mergeTemplate("templates/referalemail.vm", "UTF-8", context, stringWriter);
        String text = stringWriter.toString();
        System.out.println(text);


        System.out.println(text);

        MimeMessage mimeMessage = emailSender.createMimeMessage();

        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage, true);
        mimeMessageHelper.setFrom(email.getFrom());
        mimeMessageHelper.setTo(email.getTo());
        mimeMessageHelper.setSubject(email.getSubject());
        mimeMessageHelper.setText(text, true);

        emailSender.send(mimeMessage);

        email.setStatus(true);

        return new ResponseEntity<Email>(email, HttpStatus.OK);
    }

}
