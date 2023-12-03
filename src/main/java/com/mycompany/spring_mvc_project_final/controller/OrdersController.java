package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.OrdersEntity;
import com.mycompany.spring_mvc_project_final.repository.OrdersRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/user")
public class OrdersController {
    @Autowired
    OrdersRepository ordersRepository;

    @RequestMapping(value="/myOrders", method = RequestMethod.GET)
    public String showAllOrder(Model model) {
        List<OrdersEntity> ordersEntityList = (List<OrdersEntity>) ordersRepository.findAll();
        model.addAttribute("orderList", ordersEntityList);
        return "user/orderList";
    }
    @RequestMapping(value = "/orderDetails/{id}", method = RequestMethod.GET)
    public String showOrdersDetail(Model model, @PathVariable int id) {
        OrdersEntity ordersEntity = ordersRepository.findById(id).get();
        model.addAttribute("orderDetails", ordersEntity.getOrderDetails());
        return "user/orderDetails";
    }
    @RequestMapping(value = "/success")
    public String showSuccess(Model model){
        return "user/success";
    }
}
