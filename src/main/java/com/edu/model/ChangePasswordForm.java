package com.edu.model;

public class ChangePasswordForm {
    private String oldPassword;
    private String newPassword;
    private String retypePassword;

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getRetypePassword() {
        return retypePassword;
    }

    public void setRetypePassword(String retypePassword) {
        this.retypePassword = retypePassword;
    }

    public ChangePasswordForm(String oldPassword, String newPassword, String retypePassword) {
        super();
        this.oldPassword = oldPassword;
        this.newPassword = newPassword;
        this.retypePassword = retypePassword;
    }

    public ChangePasswordForm() {

    }
}
