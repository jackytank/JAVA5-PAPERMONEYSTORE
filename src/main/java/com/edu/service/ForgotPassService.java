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
public class ForgotPassService {

    @Autowired
    AccountDAO dao;

    @Autowired
    MailerService mailer;

    public void updateResetPasswordToken(String token, String email) throws Exception {
        Account account = dao.findByEmail(email);
        if (account != null) {
            account.setResetPasswordToken(token);
            dao.save(account);
        } else {
            throw new Exception("Could not find any account with the email " + email);
        }
    }

    public Account getByResetPasswordToken(String token) {
        return dao.findByResetPasswordToken(token);
    }

    public void updatePassword(Account account, String newPass) {
        String encodedPass = Bcryptor.encrypt(newPass);
        account.setPassword(encodedPass);
        account.setResetPasswordToken(null);
        dao.save(account);
    }

    public void sendEmail(String recipientEmail, String link) {
        MailInfo mailInfo = new MailInfo();
        mailInfo.setTo(recipientEmail);
        mailInfo.setSubject("PaperMoneyStore - Reset password");
        String content = "<p>Hello,</p>"
                + "<p>You have requested to reset your password.</p>"
                + "<p>Click the link below to change your password:</p>"
                + "<p><a href=\"" + link + "\">Change my password</a></p>"
                + "<br>"
                + "<p>Ignore this email if you do remember your password, "
                + "or you have not made the request.</p>";
        mailInfo.setBody(content);
        mailer.queue(mailInfo);
    }
}
