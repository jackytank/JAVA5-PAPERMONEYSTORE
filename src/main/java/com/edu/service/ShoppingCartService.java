package com.edu.service;

import java.util.Collection;

import com.edu.bean.CartItem;

public interface ShoppingCartService {
    void add(Integer id);

    void remove(Integer id);

    CartItem update(Integer id, int qty);

    void clear();

    Collection<CartItem> getCartItems();

    int getCount();

    double getAmount();

}