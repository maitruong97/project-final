package com.mycompany.spring_mvc_project_final.repository;

import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;

@Repository
public interface ProductRepository extends CrudRepository<ProductEntity,Integer> {
//    @Query( value = "select p.product_name,c.category_name from products p join categories c on p.categoryId = c.id where p.product_name like CONCAT('%',:product_name,'%') OR c.category_name like CONCAT('%',:category_name,'%');",nativeQuery = true)

//    @Query(value = "select * FROM products p ORDER BY p.product_name DESC;", nativeQuery = true)
//    List<ProductEntity> findByProductNameContainingOrCategoryNameContaining(@Param("product_name") String productName,@Param("category_name") String categoryName);
    List<ProductEntity> findByProductNameContaining( String productName);


    @Query (value = "select p.* from products p inner join categories c on p.categoryId = c.id where p.product_name like concat('%',:product_name,'%') or c.category_name like concat('%',:category_name,'%')", nativeQuery = true)
//    List<ProductEntity> findByProductNameOrCategoryContaining(String productName,String categoryName);
        List<ProductEntity> findByProductNameContainingOrCategoryNameContaining(@Param("product_name") String productName,@Param("category_name") String categoryName);


}
