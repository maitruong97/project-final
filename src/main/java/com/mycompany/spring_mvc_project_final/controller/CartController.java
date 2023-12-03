package com.mycompany.spring_mvc_project_final.controller;


import com.mycompany.spring_mvc_project_final.entities.*;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import com.mycompany.spring_mvc_project_final.repository.OrderDetailsRepository;
import com.mycompany.spring_mvc_project_final.repository.OrdersRepository;
import com.mycompany.spring_mvc_project_final.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;

@Controller
//@RequestMapping("/user")
public class CartController {
    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    @Autowired
    private OrdersRepository ordersRepository;
    @RequestMapping(value = "/myCart", method = RequestMethod.GET)
    public String showCartList(Model model, HttpSession session) {
        // Get session
        List<CartEntity> cartList = (List<CartEntity>) session.getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
            model.addAttribute("cartList", cartList);
        }
        return "user/cart";
    }

    @RequestMapping(value = "/addToCart/{id}", method = RequestMethod.GET)
    public String addToCart(Model model, @PathVariable int id, HttpServletRequest request) {

        // Get data from session
        List<CartEntity> cartList = (List<CartEntity>) request.getSession().getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
            request.getSession().setAttribute("cartList", cartList);
        }

        List<CartEntity> resultList = cartList;
        Optional<ProductEntity> optionalEntity = productRepository.findById(id);

        ProductEntity product = new ProductEntity();
        product.setProductName(optionalEntity.get().getProductName());
        product.setId(optionalEntity.get().getId());
        product.setPrice(optionalEntity.get().getPrice());
        product.setProductDescription(optionalEntity.get().getProductDescription());

        CartEntity item = new CartEntity();
        item.setProduct(product);

        // count quantity
        CartEntity cartTemp = cartList.stream()
                .filter(p -> id == (p.getProduct().getId()))
                .findAny()
                .orElse(null);

        if(cartTemp!=null){
            cartList.get(cartList.indexOf(cartTemp)).setQuantity(cartTemp.getQuantity() + 1);
        }
        else {
            item.setQuantity(1);
            cartList.add(item);
        }

        request.getSession().setAttribute("cartList", cartList);
        request.getSession().setAttribute("myCartTotal", totalPrice(cartList));
        request.getSession().setAttribute("myCartNum", cartList.size());
        model.addAttribute("cartList", resultList);
        return "redirect:/cart";
    }


//    @RequestMapping(value = "add/{productId}.html", method = RequestMethod.GET)
//    public String viewAdd(ModelMap mm, HttpSession session, @PathVariable("productId") Integer productId) {
//        HashMap<Integer, CartEntity> cartItems = (HashMap<Integer, CartEntity>) session.getAttribute("myCartItems");
//        if (cartItems == null) {
//            cartItems = new HashMap<>();
//        }
//        ProductEntity product = productRepository.findById(productId).get();
//        if (product != null) {
//            if (cartItems.containsKey(productId)) {
//                CartEntity item = cartItems.get(productId);
//                item.setProduct(product);
//                item.setQuantity(item.getQuantity() + 1);
//                cartItems.put(productId, item);
//            } else {
//                CartEntity item = new CartEntity();
//                item.setProduct(product);
//                item.setQuantity(1);
//                cartItems.put(productId, item);
//            }
//        }
//        session.setAttribute("myCartItems", cartItems);
//        session.setAttribute("myCartTotal", totalPrice(cartItems));
//        session.setAttribute("myCartNum", cartItems.size());
//        return "user/cart";
//    }

    public double totalPrice(List<CartEntity> cartList) {
        int count = 0;
        for (CartEntity list : cartList) {
            count += list.getProduct().getPrice() * list.getQuantity();
        }
        return count;
    }

    @RequestMapping(value = "/removeItem/{id}", method = RequestMethod.GET)
    public String removeItem(Model model, @PathVariable int id, HttpServletRequest request) {
        // Get data from session
        List<CartEntity> cartList = (List<CartEntity>) request.getSession().getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
            request.getSession().setAttribute("cartList", cartList);
        }

        // Find item in list
        CartEntity item = cartList.stream()
                .filter(p -> id == (p.getProduct().getId()))
                .findAny()
                .orElse(null);

        // remove
        cartList.remove(item);

        // add to session
        request.getSession().setAttribute("cartList", cartList);
        model.addAttribute("cartList", cartList);
        return "user/cart";
    }
    @RequestMapping(value = "/checkOut", method = RequestMethod.GET)
    public String showCheckOutPage(Model model,HttpServletRequest request,HttpSession session) {
        List<CartEntity> cartList = (List<CartEntity>) request.getSession().getAttribute("cartList");
        model.addAttribute("cartList", cartList);

        model.addAttribute("orders", new OrdersEntity());
        return "user/checkout";
    }

    @Transactional(rollbackFor = Exception.class)
    @RequestMapping(value = "/checkOut", method = RequestMethod.POST)
    public String saveOrder(@ModelAttribute("orders") OrdersEntity orders, Model model, HttpServletRequest request, HttpSession session) {
        //         Check chua login
//         Return ve page login
        String userName = (String) request.getSession().getAttribute("username");
        session.removeAttribute("uriPreLogin");
        if (null == userName || userName.isEmpty()) {
            String uriPreLogin = request.getRequestURI();
            session.setAttribute("uriPreLogin", uriPreLogin);
            return "login";
        }
//        else if(null != userName || !userName.isEmpty()){
//            session.removeAttribute("uriPreLogin");
//            request.getSession().getAttribute("username");
//            return"user/checkout";
//        }
                List<CartEntity> cartList = (List<CartEntity>) request.getSession().getAttribute("cartList");
                OrdersEntity ordersEntity = new OrdersEntity();
                ordersEntity.setOrderDate(LocalDate.now());
                ordersEntity.setCustomerAddress(orders.getCustomerAddress());
                ordersEntity.setCustomerName(orders.getCustomerName());
                ordersRepository.save(ordersEntity);

                for (CartEntity cart : cartList) {
                    OrderDetailsEntity orderDetailsEntity = new OrderDetailsEntity();
                    orderDetailsEntity.setOrders(ordersEntity);
                    orderDetailsEntity.setProduct(cart.getProduct());
                    orderDetailsEntity.setQuantity(cart.getQuantity());
                    orderDetailsRepository.save(orderDetailsEntity);
                }
                request.getSession().removeAttribute("cartList");
        String email = "maitruong02976@gmail.com";
        sendEmail(email,"Order Successful", "You have placed your order successfully!!!" +
                "Review your order details here ");
            return "redirect:/user/success";
        }
//    public ModelAndView testSendMail(ModelAndView model) throws IOException {
//        // Send mail
//        System.out.println("Send Mail ==>");
//        String email = "maitruong02976@gmail.com";
//        sendEmail(email,"Subject", "Hello all");
//        model.addObject("msg",email);
//        return new ModelAndView("user/email");
//    }
    public void sendEmail(String recipient, String subject, String body) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(recipient);
            helper.setSubject(subject);
            helper.setText(body, true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }

    public int exists(int id, List<CartEntity> cartList) {
        for (int i = 0; i < cartList.size(); i++) {
            if (cartList.get(i).getProduct().getId() != 0) {
                return i;
            }
        }
        return -1;
    }

}