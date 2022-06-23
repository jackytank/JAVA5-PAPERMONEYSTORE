package com.edu.controller;

import java.util.List;
import java.util.Optional;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.CategoryDAO;
import com.edu.dao.OrderDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Category;
import com.edu.entity.Order;
import com.edu.entity.Product;
import com.edu.service.ParamService;
import com.edu.utils.ExcelExporter;

@Controller
public class OrderController {
    @Autowired
    OrderDAO dao;

    @Autowired
    ParamService paramService;

    @GetMapping("/admin/order")
    public String index(ModelMap model) {
        model.addAttribute("ord", new Order());
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap model) {
        Order or = dao.findById(id).get();
        System.out.println(or.getId());
        model.addAttribute("ord", or);
        List<Order> ord = dao.findAll();
        model.addAttribute("ords", ord);
        return "admin/order";
    }

    @RequestMapping("/admin/order/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        dao.deleteById(id);
        return "redirect:/admin/order";
    }

    @PostMapping("/admin/order/update")
    public String update(Order or) {
        dao.save(or);
        return "redirect:/admin/order/edit/" + or.getId();
    }

    @PostMapping("/admin/order/create")
    public String create(Order or) {
        dao.save(or);
        return "redirect:/admin/order";
    }

    @GetMapping("/admin/order/export-excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("appplication/octet-stream");
        // set ngày giờ thời gian hiện tại trước khi xuất ra excel
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        // set các thông số header, filename cho file excel
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=orders_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<Order> listProd = dao.findAll();
        ExcelExporter<Order> excelExporter = new ExcelExporter<Order>(listProd, "orders");
        excelExporter.export(response);
    }
}
