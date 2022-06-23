package com.edu.entity;

import java.time.LocalDate;
import java.util.Date;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name = "Orders")
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "address")
    private String address;

    @Column(name = "createdate")
    private LocalDate createdate = LocalDate.now();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "username")
    private Account username;

    public Order() {
    }

    public Order(Integer id, String address, LocalDate createdate, Account username) {
        this.id = id;
        this.address = address;
        this.createdate = createdate;
        this.username = username;
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDate getCreatedate() {
        return this.createdate;
    }

    public void setCreatedate(LocalDate createdate) {
        this.createdate = createdate;
    }

    public Account getUsername() {
        return this.username;
    }

    public void setUsername(Account username) {
        this.username = username;
    }

    public Order id(Integer id) {
        setId(id);
        return this;
    }

    public Order address(String address) {
        setAddress(address);
        return this;
    }

    public Order createdate(LocalDate createdate) {
        setCreatedate(createdate);
        return this;
    }

    public Order username(Account username) {
        setUsername(username);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Order)) {
            return false;
        }
        Order order = (Order) o;
        return Objects.equals(id, order.id) && Objects.equals(address, order.address)
                && Objects.equals(createdate, order.createdate) && Objects.equals(username, order.username);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, address, createdate, username);
    }

    @Override
    public String toString() {
        return "{" +
                " id='" + getId() + "'" +
                ", address='" + getAddress() + "'" +
                ", createdate='" + getCreatedate() + "'" +
                ", username='" + getUsername() + "'" +
                "}";
    }

}