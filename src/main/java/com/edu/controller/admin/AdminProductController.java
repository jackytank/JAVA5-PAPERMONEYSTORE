package com.edu.controller.admin;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.edu.dao.CategoryDAO;
import com.edu.dao.ProductDAO;
import com.edu.entity.Account;
import com.edu.entity.Category;
import com.edu.entity.Product;
import com.edu.model.AccountForm;
import com.edu.model.ProductForm;
import com.edu.service.ParamService;
import com.edu.service.SessionService;
import com.edu.service.impl.CommonService;
import com.edu.utils.CommonUtils;
import com.edu.utils.ExcelExporter;

@Controller
public class AdminProductController {
    @Autowired
    ProductDAO productDAO;

    @Autowired
    CategoryDAO categoryDAO;

    @Autowired
    ParamService paramService;

    @Autowired
    SessionService sessionService;

    @Autowired
    CommonUtils common;

    @Autowired
    SessionService session;

    @GetMapping("/admin/product")
    public String index(@RequestParam(required = false) String message, ModelMap model) {
        model.addAttribute("product", new Product());
        List<Product> products = productDAO.findAll();
        model.addAttribute("products", products);
        return "admin/product";
    }

    @RequestMapping("/admin/product/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap model) {
        Product product = productDAO.findById(id).get();
        model.addAttribute("product", product);
        List<Product> products = productDAO.findAll();
        model.addAttribute("products", products);
        return "admin/product";
    }

    @RequestMapping("/admin/product/delete/{id}")
    public String delete(@PathVariable("id") Integer id) {
        productDAO.deleteById(id);
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/update")
    public ModelAndView update(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("product") ProductForm form) {

        // copy properties and set image url, create date
        Product product = new Product();
        BeanUtils.copyProperties(form, product);
        product.setCreatedate(productDAO.findById(product.getId()).get().getCreatedate());
        if (!image.getOriginalFilename().equals("")) {
            product.setImage(image.getOriginalFilename());
        } else {
            if (form.getImage() == null) {
                product.setImage("default.jpg");
            } else {
                product.setImage(productDAO.getById(product.getId()).getImage());
            }
        }
        // check if category id not existed then show error message
        if (!categoryDAO.existsCategoryById(product.getCategoryid().getId())) {
            modelMap.addAttribute("message", "CategoryId not exist!!");
            return new ModelAndView("redirect:/admin/product", modelMap);
        }
        productDAO.save(product);
        common.saveFile(image, "product");
        modelMap.addAttribute("message", "Update success!! Product name: " + product.getName());
        return new ModelAndView("redirect:/admin/product", modelMap);
    }

    @GetMapping("/admin/product/create")
    public String getCreate() {
        return "redirect:/admin/product";
    }

    @PostMapping("/admin/product/create")
    public ModelAndView create(ModelMap modelMap, @RequestParam("image") MultipartFile image,
            @ModelAttribute("product") ProductForm form) throws IOException {

        // copy properties and set image url, create date
        Product product = new Product();
        BeanUtils.copyProperties(form, product);
        product.setCreatedate(LocalDate.now());
        if (image != null && !image.getOriginalFilename().equals("")) {
            product.setImage(image.getOriginalFilename());
        } else {
            product.setImage("default.jpg");
        }
        System.out.println(form.toString());
        System.out.println(product.toString());

        // check if category id not existed then show error message
        if (!categoryDAO.existsCategoryById(product.getCategoryid().getId())) {
            modelMap.addAttribute("message", "CategoryId not exist!!");
            return new ModelAndView("redirect:/admin/product", modelMap);
        }
        productDAO.save(product);
        common.saveFile(image, "product");
        modelMap.addAttribute("message", "Create success!! Product name: " + product.getName());
        return new ModelAndView("redirect:/admin/product", modelMap);
    }

    @GetMapping("/admin/product/export-excel")
    public void exportToExcel(HttpServletResponse response) throws IOException {
        response.setContentType("appplication/octet-stream");
        // set ngày giờ thời gian hiện tại trước khi xuất ra excel
        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd_HH:mm:ss");
        String currentDateTime = dateFormatter.format(new Date());

        // set các thông số header, filename cho file excel
        String headerKey = "Content-Disposition";
        String headerValue = "attachment; filename=products_" + currentDateTime + ".xlsx";
        response.setHeader(headerKey, headerValue);
        List<Product> listProd = productDAO.findAll();
        ExcelExporter<Product> excelExporter = new ExcelExporter<Product>(listProd, "products");
        excelExporter.export(response);
    }
}
