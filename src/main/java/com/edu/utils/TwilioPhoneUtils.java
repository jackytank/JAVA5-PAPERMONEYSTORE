package com.edu.utils;

import org.springframework.beans.factory.annotation.Autowired;

import com.edu.service.impl.CommonService;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class TwilioPhoneUtils {
    private static final String ACCOUNT_SID = "";

    private static final String AUTH_TOKEN = "";

    private static final String PHONE_NUMBER = "";

    public static String SMSCode;

    public static void send(String toPhone) {
        CommonService common = new CommonService();
        SMSCode = common.randomAlphaNumericString(6);
        Twilio.init(ACCOUNT_SID, AUTH_TOKEN);
        Message message = Message.creator(
                new PhoneNumber("+84" + toPhone),
                new PhoneNumber(PHONE_NUMBER),
                "Your OmegaPay verification code is: " + SMSCode)
                .create();
    }
}
