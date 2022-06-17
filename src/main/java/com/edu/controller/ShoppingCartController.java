package com.edu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.AccountDAO;
import com.edu.dao.OrderDAO;
import com.edu.dao.OrderDetailDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Order;
import com.edu.service.ParamService;
import com.edu.service.SessionService;
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
    OrderDetailDAO orderDetailDAO;

    @Autowired
    SessionService sessionService;

    @Autowired
    ShoppingCartService cartService;

    @RequestMapping("/checkout/{username}")
    public String checkout(@PathVariable("username") String username, ModelMap model) {
        Account acc = accountDAO.findById(username).get();
        Order order = new Order();
        order.setAddress(acc.getAddress());
        order.setUsername(acc);
        orderDAO.save(order);
        cartService.clear();
        return "redirect:/cart/view";
    }

    @RequestMapping("/view")
    public String view(ModelMap model) {
        model.addAttribute("cartItems", cartService.getCartItems());
        model.addAttribute("totalAmount", cartService.getAmount());
        sessionService.set("cartQuantity", cartService.getCount());
        return "user/cart";
    }

    @GetMapping("/add/{id}")
    public ModelAndView add(@PathVariable("id") Integer id, ModelMap model) {

        if ((String) sessionService.get("username") == null) {
            model.addAttribute("error", "You must be logged in to add to cart");
            return new ModelAndView("redirect:/account/login", model);
        }
        cartService.add(id);
        sessionService.set("cartQuantity", cartService.getCount());
        return new ModelAndView("redirect:/");
    }

    @GetMapping("/remove/{id}")
    public String remove(@PathVariable("id") Integer id) {
        cartService.remove(id);
        sessionService.set("cartQuantity", cartService.getCount());
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
        sessionService.set("cartQuantity", cartService.getCount());
        return "redirect:/cart/view";
    }
}