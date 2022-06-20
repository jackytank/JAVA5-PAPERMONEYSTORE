package com.edu.service.impl;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.edu.utils.CommonUtils;

@Service
public class CommonService implements CommonUtils {
    @Autowired
    HttpServletRequest req;

    public static boolean isLogin = false;

    @Override
    public File saveFile(MultipartFile multipartFile, String path) {
        if (multipartFile != null) {
            File dir = new File(req.getServletContext().getRealPath("upload/" + path));
            if (!dir.exists()) {
                dir.mkdirs();
            }
            try {
                File saveFile = new File(dir, multipartFile.getOriginalFilename());
                multipartFile.transferTo(saveFile);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    @Override
    public String randomAlphaNumericString(int size) {
        // chose a Character random from this String
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                + "0123456789"
                + "abcdefghijklmnopqrstuvxyz";
        // create StringBuffer size of AlphaNumericString
        StringBuilder sb = new StringBuilder(size);
        for (int i = 0; i < size; i++) {
            // generate a random number between
            // 0 to AlphaNumericString variable length
            int index = (int) (AlphaNumericString.length()
                    * Math.random());
            // add Character one by one in end of sb
            sb.append(AlphaNumericString.charAt(index));
        }
        return sb.toString();
    }

    public static String getSiteURL(HttpServletRequest req) {
        String siteURL = req.getRequestURL().toString();
        return siteURL.replace(req.getServletPath(), "");
    }

}
