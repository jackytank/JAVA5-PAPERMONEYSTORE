package com.edu.dao;

import com.edu.entity.Product;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ProductDAO extends JpaRepository<Product, Integer> {

    // @Query("SELECT o FROM Product o WHERE o.price BETWEEN ?1 AND ?2")
    List<Product> findByPriceBetween(double min, double max);

     @Query("SELECT o FROM Product o WHERE o.name LIKE ?1")
    Page<Product> findAllByNameLike(String keywords, Pageable pageable);

  

    Page<Product> findAllByIdIs(Integer keywords, Pageable pageable);

   
	
	@Query("SELECT o FROM Product o WHERE o.name LIKE %?1%"
            + " OR o.price LIKE %?1%")
    Page<Product> findAllThings(String keywords, Pageable pageable);
	
	Page<Product> findAllByPriceIs(Double keywords, Pageable pageable);
	
}

