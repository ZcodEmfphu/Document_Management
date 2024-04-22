package com.boot.music.controller;

import com.boot.music.entity.User;
import com.boot.music.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping("/acc")
    public String showAllUsers(Model model) {
        List<User> users = userService.getAllUsers();
        model.addAttribute("users", users);
        return "accounts";
    }

    @PostMapping("/upgradeUser")
    public String upgradeUser(@RequestParam("userId") int userId, Model model) {
        // Thực hiện cập nhật vai trò của người dùng có userId tương ứng
        User user = userService.getUserById(userId);
        if (user != null) {
            user.setRole(1); // Cập nhật vai trò thành 1
            userService.saveUser(user);
        }
        return "redirect:/users"; // Chuyển hướng về trang danh sách người dùng
    }

    @PostMapping("/disableAccount")
    public String disableAccount(@RequestParam("userId") int userId) {
        // Lấy thông tin người dùng từ cơ sở dữ liệu
        User user = userService.getUserById(userId);

        // Cập nhật accessLevel thành 0
        user.setAccessLevel(0);

        // Lưu thay đổi vào cơ sở dữ liệu
        userService.saveUser(user);

        // Chuyển hướng về trang danh sách người dùng
        return "redirect:/acc";
    }

    @PostMapping("/upgradeToEditor")
    public String upgradeToEditor(@RequestParam("userId") int userId) {
        // Lấy thông tin người dùng từ cơ sở dữ liệu
        User user = userService.getUserById(userId);

        // Cập nhật role thành 2 (Biên tập viên)
        user.setRole(2);

        // Lưu thay đổi vào cơ sở dữ liệu
        userService.saveUser(user);

        // Chuyển hướng về trang danh sách người dùng
        return "redirect:/users";
    }

    @PostMapping("/enableAccount")
    public String enableAccount(@RequestParam("userId") int userId) {
        // Lấy thông tin người dùng từ cơ sở dữ liệu
        User user = userService.getUserById(userId);

        // Cập nhật accessLevel thành 3
        user.setAccessLevel(3);

        // Lưu thay đổi vào cơ sở dữ liệu
        userService.saveUser(user);

        // Chuyển hướng về trang danh sách người dùng
        return "redirect:/acc";
    }

    @PostMapping("/updateAccessLevel")
    public String updateAccessLevel(@RequestParam("userId") int userId, @RequestParam("accessLevel") int accessLevel) {
        User user = userService.getUserById(userId);
        if (user != null) {
            user.setAccessLevel(accessLevel);
            userService.saveUser(user);
        }
        return "redirect:/users"; // Điều hướng lại về trang danh sách người dùng sau khi cập nhật
    }

    @PostMapping("/saveUser")
    public String saveUser(User user) {
        // Tìm người dùng hiện tại trong cơ sở dữ liệu
        User existingUser = userService.findById(user.getId());

        // Cập nhật thông tin mới (không bao gồm mật khẩu)
        existingUser.setName(user.getName());
        existingUser.setEmail(user.getEmail());
        existingUser.setRole(user.getRole());
        existingUser.setAccessLevel(user.getAccessLevel());

        // Lưu thông tin người dùng đã chỉnh sửa vào cơ sở dữ liệu
        userService.saveUser(existingUser);

        return "redirect:/acc"; // Chuyển hướng về trang danh sách tài khoản sau khi lưu thành công
    }

    @PostMapping("/update")
    @ResponseBody
    public User updateUser(@RequestBody User updatedUser) {
        // Kiểm tra xem user có tồn tại không
        User existingUser = userService.findById(updatedUser.getId());
        if (existingUser != null) {
            // Cập nhật thông tin user
            if (updatedUser.getName() != null) {
                existingUser.setName(updatedUser.getName());
            }
            if (updatedUser.getEmail() != null) {
                existingUser.setEmail(updatedUser.getEmail());
            }

                existingUser.setRole(updatedUser.getRole());


                existingUser.setAccessLevel(updatedUser.getAccessLevel());

            // Trả về thông tin user đã được cập nhật
            return existingUser;
        } else {
            // Trả về null nếu không tìm thấy user
            return null;
        }
    }
}


