package com.mycompany.spring_mvc_project_final.controller;

import com.mycompany.spring_mvc_project_final.entities.AccountEntity;
import com.mycompany.spring_mvc_project_final.entities.CategoryEntity;
import com.mycompany.spring_mvc_project_final.entities.ProductEntity;
import com.mycompany.spring_mvc_project_final.entities.RoleEntity;
import com.mycompany.spring_mvc_project_final.enums.Role;
import com.mycompany.spring_mvc_project_final.enums.UserStatus;
import com.mycompany.spring_mvc_project_final.repository.AccountRepository;
import com.mycompany.spring_mvc_project_final.repository.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

@Controller
public class UserController {
    @Autowired
    private AccountRepository accountRepository;
    @Autowired
    private RoleRepository roleRepository;
    @RequestMapping(value = "/register",method = GET)
    public String showRegistrationForm(HttpServletRequest request, Model model) {
//        Set<RoleEntity> userRoles = new HashSet<>();
//        RoleEntity role =new RoleEntity();
//        role.setRole(Role.ROLE_USER);
//        userRoles.add(role);
//        AccountEntity user = new AccountEntity();
//        user.setUserRoles(userRoles);
//        user.setStatus(UserStatus.ACTIVE);
        model.addAttribute("user",new AccountEntity());
        setRoleDropDownList(model);
        return "user/registration";
    }
    @RequestMapping(value = "/accountInfo")
    public String showAccountInfo(Model model){
        List<AccountEntity> accountList = (List<AccountEntity>) accountRepository.findAll();
        model.addAttribute("accountList", accountList);

        return "accountList";
    }
    @RequestMapping(value = "/register", method = POST)
    public String saveUser(AccountEntity account) {
        Set<RoleEntity> userRoles = new HashSet<>();
        RoleEntity role =new RoleEntity();
        role.setId(2);
        userRoles.add(role);
        //AccountEntity user = new AccountEntity();
        account.setUserRoles(userRoles);
        account.setPassword(encrytePassword(account.getPassword()));
        account.setStatus(UserStatus.ACTIVE);
        accountRepository.save(account);
        return "redirect:/accountInfo";
    }
    private void setRoleDropDownList(Model model) {
        List<RoleEntity> roleList = (List<RoleEntity>) roleRepository.findAll();
        if (!roleList.isEmpty()) {
            Map<Integer, Role> roleMap = new LinkedHashMap<>();
            for (RoleEntity roleEntity : roleList
            ) {
                roleMap.put(roleEntity.getId(), Role.ROLE_USER);

            }
            model.addAttribute("roleList", roleMap);
        }
    }
    public static String encrytePassword(String password) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        return encoder.encode(password);
    }
}
