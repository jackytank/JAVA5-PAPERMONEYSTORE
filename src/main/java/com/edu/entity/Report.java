package com.edu.entity;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.*;

@Entity
@Table(name = "Reports")
public class Report implements Serializable {

    @Id
    @Column(name = "category", nullable = false, length = 50)
    private String id;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "category", nullable = false)
    private Category categories;

    @Column(name = "\"sum\"", nullable = false)
    private Double sum;

    @Column(name = "\"count\"", nullable = false)
    private Long count;


    public Report() {
    }

    public Report(Category categories, Double sum, Long count) {
        this.categories = categories;
        this.sum = sum;
        this.count = count;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Category getCategories() {
        return this.categories;
    }

    public void setCategories(Category categories) {
        this.categories = categories;
    }

    public Double getSum() {
        return this.sum;
    }

    public void setSum(Double sum) {
        this.sum = sum;
    }

    public Long getCount() {
        return this.count;
    }

    public void setCount(Long count) {
        this.count = count;
    }

    public Report id(String id) {
        setId(id);
        return this;
    }

    public Report categories(Category categories) {
        setCategories(categories);
        return this;
    }

    public Report sum(Double sum) {
        setSum(sum);
        return this;
    }

    public Report count(Long count) {
        setCount(count);
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Report)) {
            return false;
        }
        Report report = (Report) o;
        return Objects.equals(id, report.id) && Objects.equals(categories, report.categories) && Objects.equals(sum, report.sum) && Objects.equals(count, report.count);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, categories, sum, count);
    }

    @Override
    public String toString() {
        return "{" +
            " id='" + getId() + "'" +
            ", categories='" + getCategories() + "'" +
            ", sum='" + getSum() + "'" +
            ", count='" + getCount() + "'" +
            "}";
    }
   

}
