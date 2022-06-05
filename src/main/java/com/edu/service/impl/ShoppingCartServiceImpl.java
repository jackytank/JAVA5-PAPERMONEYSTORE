package com.edu.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

import com.edu.bean.CartItem;
import com.edu.dao.ProductDAO;
import com.edu.entity.Product;
import com.edu.service.ShoppingCartService;

@Service
@SessionScope
public class ShoppingCartServiceImpl implements ShoppingCartService {
    Map<Integer, CartItem> map = new HashMap<>();

    @Autowired
    ProductDAO dao;

    @Override
    public void add(Integer id) {
        CartItem item = map.get(id);
        if (item == null) {
            Product product = dao.findById(id).get();
            if (product != null) {
                item = new CartItem();
                BeanUtils.copyProperties(product, item);
                item.setId(id);
                map.put(id, item);
                map.entrySet().forEach(entry -> {
                    System.out.println("start map");
                    System.out.println(entry.getKey() + " " + entry.getValue());
                    System.out.println("end map");
                });
            }
        }
    }

    @Override
    public void remove(Integer id) {
        map.remove(id);
    }

    @Override
    public CartItem update(Integer id, int qty) {
        CartItem item = map.get(id);
        item.setQty(qty);
        map.entrySet().forEach(entry -> {
            System.out.println("start map");
            System.out.println(entry.getKey() + " " + entry.getValue());
            System.out.println("end map");
        });
        return item;
    }

    @Override
    public void clear() {
        map.clear();

    }

    @Override
    public Collection<CartItem> getCartItems() {
        return map.values();
    }

    @Override
    public int getCount() {
        return map.values().stream()
                .mapToInt(item -> item.getQty())
                .sum();
    }

    @Override
    public double getAmount() {
        return map.values().stream()
                .mapToDouble(item -> item.getPrice() * item.getQty())
                .sum();
    }

}
