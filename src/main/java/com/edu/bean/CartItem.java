package com.edu.bean;

public class CartItem {
    private Integer id;
    private String name;
    private double price;
    private String image;
    private int qty = 1;

    public CartItem() {
    }

    public CartItem(Integer id, String name, double price, String image, int qty) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.image = image;
        this.qty = qty;
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

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getQty() {
        return this.qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", name='" + getName() + "'" +
                ", price='" + getPrice() + "'" +
                ", image='" + getImage() + "'" +
                ", qty='" + getQty() + "'" +
                "}";
    }

}
