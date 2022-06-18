package com.edu.model;

import java.io.Serializable;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

public class AccountForm implements Serializable {

    private String id;

    private String email;

    private String password;

    private String retypePassword;

    private String phone;

    private String address;

    private Boolean admin = false;

    private MultipartFile image;

    private String imageUrl;

    private Boolean activated = false;

    private String verifycode;

    public AccountForm() {
    }

    public AccountForm(String id, String email, String password, String retypePassword, String phone, String address,
            Boolean admin, MultipartFile image, String imageUrl, Boolean activated, String verifycode) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.retypePassword = retypePassword;
        this.phone = phone;
        this.address = address;
        this.admin = admin;
        this.image = image;
        this.imageUrl = imageUrl;
        this.activated = activated;
        this.verifycode = verifycode;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRetypePassword() {
        return this.retypePassword;
    }

    public void setRetypePassword(String retypePassword) {
        this.retypePassword = retypePassword;
    }

    public String getPhone() {
        return this.phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Boolean isAdmin() {
        return this.admin;
    }

    public Boolean getAdmin() {
        return this.admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }

    public MultipartFile getImage() {
        return this.image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public String getImageUrl() {
        return this.imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Boolean isActivated() {
        return this.activated;
    }

    public Boolean getActivated() {
        return this.activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public String getVerifycode() {
        return this.verifycode;
    }

    public void setVerifycode(String verifycode) {
        this.verifycode = verifycode;
    }

    public AccountForm id(String id) {
        setId(id);
        return this;
    }

    public AccountForm email(String email) {
        setEmail(email);
        return this;
    }

    public AccountForm password(String password) {
        setPassword(password);
        return this;
    }

    public AccountForm retypePassword(String retypePassword) {
        setRetypePassword(retypePassword);
        return this;
    }

    public AccountForm phone(String phone) {
        setPhone(phone);
        return this;
    }

    public AccountForm address(String address) {
        setAddress(address);
        return this;
    }

    public AccountForm admin(Boolean admin) {
        setAdmin(admin);
        return this;
    }

    public AccountForm image(MultipartFile image) {
        setImage(image);
        return this;
    }

    public AccountForm imageUrl(String imageUrl) {
        setImageUrl(imageUrl);
        return this;
    }

    public AccountForm activated(Boolean activated) {
        setActivated(activated);
        return this;
    }

    public AccountForm verifycode(String verifycode) {
        setVerifycode(verifycode);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof AccountForm)) {
            return false;
        }
        AccountForm accountForm = (AccountForm) o;
        return Objects.equals(id, accountForm.id) && Objects.equals(email, accountForm.email)
                && Objects.equals(password, accountForm.password)
                && Objects.equals(retypePassword, accountForm.retypePassword)
                && Objects.equals(phone, accountForm.phone) && Objects.equals(address, accountForm.address)
                && Objects.equals(admin, accountForm.admin) && Objects.equals(image, accountForm.image)
                && Objects.equals(imageUrl, accountForm.imageUrl) && Objects.equals(activated, accountForm.activated)
                && Objects.equals(verifycode, accountForm.verifycode);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, password, retypePassword, phone, address, admin, image, imageUrl, activated,
                verifycode);
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", email='" + getEmail() + "'" +
                ", password='" + getPassword() + "'" +
                ", retypePassword='" + getRetypePassword() + "'" +
                ", phone='" + getPhone() + "'" +
                ", address='" + getAddress() + "'" +
                ", admin='" + isAdmin() + "'" +
                ", image='" + getImage() + "'" +
                ", imageUrl='" + getImageUrl() + "'" +
                ", activated='" + isActivated() + "'" +
                ", verifycode='" + getVerifycode() + "'" +
                "}";
    }

}
