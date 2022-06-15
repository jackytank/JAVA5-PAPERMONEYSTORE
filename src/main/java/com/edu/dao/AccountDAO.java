package com.edu.dao;

import com.edu.entity.Account;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AccountDAO extends JpaRepository<Account, String> {
    boolean existsAccountById(String id);
}