package com.edu.model;

import java.time.LocalDate;
import java.util.Objects;

import org.springframework.web.multipart.MultipartFile;

import com.edu.entity.Category;

public class ProductForm {
    private Integer id;

    private String name;

    private Double price;

    private MultipartFile image;

    private String imageUrl;

    private Boolean available = false;

    private LocalDate createdate;

    private Category categoryid;

    public ProductForm() {
    }

    public ProductForm(Integer id, String name, Double price, MultipartFile image, String imageUrl, Boolean available,
            LocalDate createdate, Category categoryid) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.imageUrl = imageUrl;
        this.available = available;
        this.createdate = createdate;
        this.categoryid = categoryid;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getPrice() {
        return this.price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public MultipartFile getImage() {
        return this.image;
    }

    public void setImage(MultipartFile image) {
        this.image = image;
    }

    public String getImageUrl() {
        return this.imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Boolean isAvailable() {
        return this.available;
    }

    public Boolean getAvailable() {
        return this.available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public LocalDate getCreatedate() {
        return this.createdate;
    }

    public void setCreatedate(LocalDate createdate) {
        this.createdate = createdate;
    }

    public Category getCategoryid() {
        return this.categoryid;
    }

    public void setCategoryid(Category categoryid) {
        this.categoryid = categoryid;
    }

    public ProductForm id(Integer id) {
        setId(id);
        return this;
    }

    public ProductForm name(String name) {
        setName(name);
        return this;
    }

    public ProductForm price(Double price) {
        setPrice(price);
        return this;
    }

    public ProductForm image(MultipartFile image) {
        setImage(image);
        return this;
    }

    public ProductForm imageUrl(String imageUrl) {
        setImageUrl(imageUrl);
        return this;
    }

    public ProductForm available(Boolean available) {
        setAvailable(available);
        return this;
    }

    public ProductForm createdate(LocalDate createdate) {
        setCreatedate(createdate);
        return this;
    }

    public ProductForm categoryid(Category categoryid) {
        setCategoryid(categoryid);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof ProductForm)) {
            return false;
        }
        ProductForm productForm = (ProductForm) o;
        return Objects.equals(id, productForm.id) && Objects.equals(name, productForm.name)
                && Objects.equals(price, productForm.price) && Objects.equals(image, productForm.image)
                && Objects.equals(imageUrl, productForm.imageUrl) && Objects.equals(available, productForm.available)
                && Objects.equals(createdate, productForm.createdate)
                && Objects.equals(categoryid, productForm.categoryid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, name, price, image, imageUrl, available, createdate, categoryid);
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", name='" + getName() + "'" +
                ", price='" + getPrice() + "'" +
                ", image='" + getImage() + "'" +
                ", imageUrl='" + getImageUrl() + "'" +
                ", available='" + isAvailable() + "'" +
                ", createdate='" + getCreatedate() + "'" +
                ", categoryid='" + getCategoryid() + "'" +
                "}";
    }

}