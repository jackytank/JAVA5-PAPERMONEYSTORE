package com.edu.dao;

import com.edu.entity.Product;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductDAO extends JpaRepository<Product, Integer> {
    // @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findAllByNameLike(String keywords, Pageable pageable);

    Page<Product> findAllByPriceIs(Double keywords, Pageable pageable);
}