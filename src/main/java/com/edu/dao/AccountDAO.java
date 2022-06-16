package com.edu.dao;

import com.edu.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDAO extends JpaRepository<Account, String> {

    // Derived Query - for checking if account exist by id
    boolean existsAccountById(String id);
}