package com.edu.service;

import javax.mail.MessagingException;

import org.apache.tomcat.util.security.MD5Encoder;
import org.bouncycastle.jcajce.provider.asymmetric.rsa.ISOSignatureSpi.MD5WithRSAEncryption;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edu.dao.AccountDAO;
import com.edu.entity.Account;
import com.edu.model.MailInfo;
import com.edu.utils.Bcryptor;

import net.bytebuddy.utility.RandomString;

@Service
public class UserService {
    @Autowired
    AccountDAO dao;

    @Autowired
    MailerService mailer;

    public void register(Account acc, String url) throws MessagingException {
        //encode the password with Bcrypt algorithm
        String encodedPassword = Bcryptor.encrypt(acc.getPassword());
        String randomCode = RandomString.make(64);
        acc.setPassword(encodedPassword);
        acc.setVerifycode(randomCode);
        acc.setActivated(false);
        acc.setAdmin(false);
        dao.save(acc);
        sendVerifyEmail(acc, url);
    }

    public void save(Account acc) {
        //encode the password with Bcrypt algorithm
        String encodedPassword = Bcryptor.encrypt(acc.getPassword());
        acc.setPassword(encodedPassword);
        dao.save(acc);
    }

    public void sendVerifyEmail(Account acc, String url) throws MessagingException {
        MailInfo mail = new MailInfo();
        mail.setTo(acc.getEmail());
        mail.setSubject("PaperMoneyStore - Verify your email");
        String content = "Dear [[name]],<br>"
                + "Please click the link below to verify your registration:<br>"
                + "<h3><a href=\"[[URL]]\" target=\"_self\">VERIFY</a></h3>"
                + "Thank you,<br>";

        content = content.replace("[[name]]", acc.getId());
        String verifyURL = url + "/verify?code=" + acc.getVerifycode();
        content = content.replace("[[URL]]", verifyURL);
        mail.setBody(content);
        mailer.send(mail);
    }

    public boolean verify(String verifyCode) {
        Account acc = dao.findByVerifyCode(verifyCode);
        if (acc == null || acc.getActivated()) {
            return false;
        } else {
            acc.setVerifycode("0");
            acc.setActivated(true);
            dao.save(acc);
            return true;
        }
    }
}
