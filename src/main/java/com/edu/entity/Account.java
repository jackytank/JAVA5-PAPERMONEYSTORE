package com.edu.entity;

import javax.persistence.*;
import java.util.LinkedHashSet;
import java.util.Objects;
import java.util.Set;

@Entity
@Table(name = "Accounts")
public class Account {
    @Id
    @Column(name = "username", nullable = false, length = 50)
    private String id;

    @Column(name = "email", nullable = false, length = 100)
    private String email;

    @Column(name = "password", nullable = false)
    private String password;

    @Column(name = "phone", nullable = false, length = 50)
    private String phone;

    @Column(name = "address")
    private String address;

    @Column(name = "admin", nullable = false)
    private Boolean admin = false;

    @Column(name = "image", nullable = false)
    private String image;

    @Column(name = "activated", nullable = false)
    private Boolean activated = false;

    @Column(name = "verifycode", length = 100)
    private String verifycode;

    @Column(name = "reset_password_token", length = 100)
    private String resetPasswordToken;

    public Account() {
    }

    public Account(String id, String email, String password, String phone, String address, Boolean admin, String image,
            Boolean activated, String verifycode, String resetPasswordToken) {
        this.id = id;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.address = address;
        this.admin = admin;
        this.image = image;
        this.activated = activated;
        this.verifycode = verifycode;
        this.resetPasswordToken = resetPasswordToken;
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

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
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

    public String getResetPasswordToken() {
        return this.resetPasswordToken;
    }

    public void setResetPasswordToken(String resetPasswordToken) {
        this.resetPasswordToken = resetPasswordToken;
    }

    public Account id(String id) {
        setId(id);
        return this;
    }

    public Account email(String email) {
        setEmail(email);
        return this;
    }

    public Account password(String password) {
        setPassword(password);
        return this;
    }

    public Account phone(String phone) {
        setPhone(phone);
        return this;
    }

    public Account address(String address) {
        setAddress(address);
        return this;
    }

    public Account admin(Boolean admin) {
        setAdmin(admin);
        return this;
    }

    public Account image(String image) {
        setImage(image);
        return this;
    }

    public Account activated(Boolean activated) {
        setActivated(activated);
        return this;
    }

    public Account verifycode(String verifycode) {
        setVerifycode(verifycode);
        return this;
    }

    public Account resetPasswordToken(String resetPasswordToken) {
        setResetPasswordToken(resetPasswordToken);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Account)) {
            return false;
        }
        Account account = (Account) o;
        return Objects.equals(id, account.id) && Objects.equals(email, account.email)
                && Objects.equals(password, account.password) && Objects.equals(phone, account.phone)
                && Objects.equals(address, account.address) && Objects.equals(admin, account.admin)
                && Objects.equals(image, account.image) && Objects.equals(activated, account.activated)
                && Objects.equals(verifycode, account.verifycode)
                && Objects.equals(resetPasswordToken, account.resetPasswordToken);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, email, password, phone, address, admin, image, activated, verifycode,
                resetPasswordToken);
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", email='" + getEmail() + "'" +
                ", password='" + getPassword() + "'" +
                ", phone='" + getPhone() + "'" +
                ", address='" + getAddress() + "'" +
                ", admin='" + isAdmin() + "'" +
                ", image='" + getImage() + "'" +
                ", activated='" + isActivated() + "'" +
                ", verifycode='" + getVerifycode() + "'" +
                ", resetPasswordToken='" + getResetPasswordToken() + "'" +
                "}";
    }

}