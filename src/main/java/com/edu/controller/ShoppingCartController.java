package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.edu.dao.AccountDAO;
import com.edu.dao.OrderDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Order;
import com.edu.service.ParamService;
import com.edu.service.ShoppingCartService;

@Controller
@RequestMapping("/cart")
public class ShoppingCartController {
    @Autowired
    ProductDAO productDAO;

    @Autowired
    ParamService param;

    @Autowired
    AccountDAO accountDAO;

    @Autowired
    OrderDAO orderDAO;

    @Autowired
    ShoppingCartService cartService;

    @RequestMapping("/checkout/{username}")
    public String checkout(@PathVariable("username") String username, ModelMap model) {
        Account acc = accountDAO.findById(username).get();
        Order order = new Order();
        order.setAddress(acc.getAddress());
        order.setUsername(acc);
        orderDAO.save(order);
        return "redirect:/cart/view";
    }

    @RequestMapping("/view")
    public String view(ModelMap model) {
        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("totalAmount", cartService.getAmount());
        return "user/cart";
    }

    @GetMapping("/add/{id}")
    public String add(@PathVariable("id") Integer id, ModelMap model) {
        cartService.add(id);
        return "redirect:/";
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        cartService.remove(id);
        return "redirect:/cart/view";
    }

    @RequestMapping("/update")
    public String update() {
        Integer id = param.getInt("id", 0);
        int qty = param.getInt("qty", 1);
        if (qty == 0) {
            return "redirect:/cart/remove/" + id;
        }
        cartService.update(id, qty);
        return "redirect:/cart/view";
    }

    @RequestMapping("/clear")
    public String reset() {
        cartService.clear();
        return "redirect:/cart/view";
    }
}