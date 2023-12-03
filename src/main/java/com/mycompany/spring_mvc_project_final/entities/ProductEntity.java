package com.mycompany.spring_mvc_project_final.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name="products")
public class ProductEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    @Column(name = "product_name")
    private String productName;
    @Column(name = "product_description")
    private String productDescription;
    @Column(name = "price")
    private Double price;
    @Lob
    private byte[] photo;
    @ManyToOne //book (many) trỏ tới => category (one)
    @JoinColumn(name = "categoryId")
// book join với category thông qua categotyId (trường khóa ngoại map vs khóa chính của category)
    private CategoryEntity category; // đối tượng liên kết giữa book và category
    @OneToMany(mappedBy = "products", fetch = FetchType.EAGER)
    private List<OrderDetailsEntity> orderDetails;

//    public ProductEntity(int id, String name, String productDescription, Double price, String photo) {
//        this.id = id;
//        this.name = name;
//        this.productDescription = productDescription;
//        this.price = price;
//        this.photo = photo.getBytes();
//
//    }

    public ProductEntity() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductDescription() {
        return productDescription;
    }

    public void setProductDescription(String productDescription) {
        this.productDescription = productDescription;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public List<OrderDetailsEntity> getOrderDetails() {
        return orderDetails;
    }

    public void setOrderDetails(List<OrderDetailsEntity> orderDetails) {
        this.orderDetails = orderDetails;
    }
}