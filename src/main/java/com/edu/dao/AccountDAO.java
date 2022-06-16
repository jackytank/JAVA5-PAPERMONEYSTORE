package com.edu.dao;

import com.edu.entity.Account;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface AccountDAO extends JpaRepository<Account, String> {
	@Query("Select password from Account Where email=?1")
	public String findByEmail(String email);
	
	
	public boolean existsAccountByEmail(String email);
}