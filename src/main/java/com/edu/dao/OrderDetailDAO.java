package com.edu.dao;

import com.edu.entity.OrderDetail;
import com.edu.entity.Report;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetailDAO extends JpaRepository<OrderDetail, Integer> {
    @Query("SELECT new Report(o.categoryid, sum(o.price), count(o)) FROM Product o GROUP BY o.categoryid ORDER BY sum(o.price) DESC")
    List<Report> revenueByCategory();
}