package com.edu.dao;

import com.edu.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AccountDAO extends JpaRepository<Account, String> {
    @Query("SELECT o FROM Account o WHERE email=?1")
    public Account findByEmail(String email);

    public Account findByResetPasswordToken(String token);

    @Query("SELECT o FROM Account o WHERE verifycode=?1")
    public Account findByVerifyCode(String code);

    // Derived Query - for checking if account exist by email
    public boolean existsAccountByEmail(String email);

    // Derived Query - for checking if account exist by id
    public boolean existsAccountById(String id);
}