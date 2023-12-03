package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.repository.CategoryRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
//@RequestMapping("/admin")
public class ProductController {
    @Autowired
    ProductRepository productRepository;
    @Autowired
    CategoryRepository categoryRepository;



    @RequestMapping(value = "/cart", method = RequestMethod.GET)
    public String showProduct(Model model ) {
        List<ProductEntity> productList = (List<ProductEntity>) productRepository.findAll();
        model.addAttribute("productList", productList);
        return "admin/productLIst";
//        return "home";

    }
    @RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
    public String viewProduct(Model model, @PathVariable int id) {
        model.addAttribute("products", productRepository.findById(id));
        return "user/singleProduct";
    }
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String search(@RequestParam("searchInput") String searchInput, Model model) {
        List<ProductEntity> resultList;
        if (searchInput.isEmpty()) {
            resultList = (List<ProductEntity>) productRepository.findAll();
        } else {
            resultList = productRepository.findByProductNameContainingOrCategoryNameContaining(searchInput,searchInput);
        }
        model.addAttribute("productList", resultList);
        return "admin/productLIst";
    }

    @RequestMapping(value = "/admin/addProduct", method = GET)
    public String showNewProduct(Model model) {
        model.addAttribute("products", new ProductEntity());
        model.addAttribute("msg", "Add a new product");
        model.addAttribute("action", "admin/addProduct");
        setCategoryDropDownList(model);
        return "admin/addProduct";
    }

    @RequestMapping(value = "/admin/addProduct", method = POST)
    public String saveProduct(ProductEntity product) {
        productRepository.save(product);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/admin/edit/{id}", method = RequestMethod.GET)
    public String showEditProduct(Model model, @PathVariable int id) {
        model.addAttribute("products", productRepository.findById(id));
        model.addAttribute("msg", "Update product information");
        model.addAttribute("type", "update");
        model.addAttribute("action", "admin/updateProduct");
        setCategoryDropDownList(model);

        return "admin/addProduct";
    }

    //    @RequestMapping(value = "/updateBook", method = RequestMethod.POST)
//    public String updateBook(@ModelAttribute BookEntity book){
//        CategoryEntity categoryEntity = CategoryUtils.getBookCategory(book.getCategory().getId());
//        book.setCategory(categoryEntity);
//        bookRepository.save(book);
//        return "redirect:/";
//    }
    @RequestMapping(value = "/admin/updateProduct", method = RequestMethod.POST,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String updateProduct(@ModelAttribute ProductEntity product, @RequestPart("images") MultipartFile photo) throws IOException {
        product.setPhoto(photo.getBytes());
        productRepository.save(product);
        return "redirect:/cart";
    }

    @RequestMapping(value = "/admin/delete/{id}", method = GET)
    public String deleteProduct(@PathVariable int id) {
        productRepository.deleteById(id);
        return "redirect:/cart";
    }

    private void setCategoryDropDownList(Model model) {
        List<CategoryEntity> cateList = (List<CategoryEntity>) categoryRepository.findAll();
        if (!cateList.isEmpty()) {
            Map<Integer, String> cateMap = new LinkedHashMap<>();
            for (CategoryEntity categoryEntity : cateList
            ) {
                cateMap.put(categoryEntity.getId(), categoryEntity.getCategoryName());

            }
            model.addAttribute("categoryList", cateMap);
        }
    }

    @RequestMapping(value = "/admin/insertImage1", method = RequestMethod.POST,
            consumes = MediaType.MULTIPART_FORM_DATA_VALUE,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public ModelAndView save(@RequestParam("name") String name, @RequestParam("price") Double price,
                             @RequestPart("photo") MultipartFile photo) {
        try {
            ProductEntity p = new ProductEntity();
            p.setProductName(name);
            p.setPrice(price);
            p.setPhoto(photo.getBytes());
            productRepository.save(p);
            return new ModelAndView("redirect:/admin/fetch1");
            //return new ModelAndView("stu", "msg", "Records succesfully inserted into database.");

        } catch (Exception e) {
            return new ModelAndView("admin/index", "msg", "Error: " + e.getMessage());
        }
    }

    @RequestMapping(value = "/admin/fetch1")
    public ModelAndView listProduct(ModelAndView model) throws IOException {

        List<ProductEntity> productList = (List<ProductEntity>) productRepository.findAll();

        model.addObject("productList", productList);
        model.setViewName("admin/addProduct");

        return model;
    }

    @RequestMapping(value = "/getProductPhoto/{id}")
    public void getProductPhoto(HttpServletResponse response, @PathVariable("id") int id) throws Exception {
        response.setContentType("image/jpeg");

        ProductEntity p = productRepository.findById(id).get();
        byte[] ph = p.getPhoto();
        InputStream inputStream = new ByteArrayInputStream(ph);
        IOUtils.copy(inputStream, response.getOutputStream());
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(true);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(sdf, true));

    }

}
