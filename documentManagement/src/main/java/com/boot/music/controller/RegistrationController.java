package com.boot.music.controller;

import com.boot.music.entity.User;
import com.boot.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/register")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String showRegistrationForm() {
        return "create-account";
    }

    @PostMapping
    public String registerUser(@ModelAttribute("user") User user,   RedirectAttributes redirectAttributes) {
        try {
            userService.registerUser(user);
            redirectAttributes.addFlashAttribute("error", "Tạo tài khoản thành công");
            return "redirect:/createAccount";
        } catch (RuntimeException e) {

            redirectAttributes.addFlashAttribute("error", "Email đã được sử dụng");
            return "redirect:/createAccount";
        }
    }
}


