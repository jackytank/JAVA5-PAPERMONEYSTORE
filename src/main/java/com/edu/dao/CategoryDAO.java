package com.edu.dao;

import com.edu.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CategoryDAO extends JpaRepository<Category, String> {
    // Derived Query - for checking if category exist by id
    public boolean existsCategoryById(String id);

    // Derived Query - for checking if category exist by name
    public boolean existsCategoryByName(String name);
}