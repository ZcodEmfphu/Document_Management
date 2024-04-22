package com.boot.music.service;

import com.boot.music.entity.User;
import com.boot.music.repositories.UserRepo;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserRepo userRepository;

    public User findById(int id) {
        return userRepository.findById(id).orElse(null);
    }
    public User registerUser(User user) {
//        Kiểm tra xem email có tồn tại chưa
        if (userRepository.findByEmail(user.getEmail()) != null) {

            throw new RuntimeException("Email đã được dùng để đăng ký");
        }
        // Mã hóa mật khẩu trước khi lưu vào cơ sở dữ liệu
        String encodedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());

        user.setPassword(encodedPassword);
        return userRepository.save(user);
    }

    public User login(String email, String password) {
        User user = userRepository.findByEmail(email);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user;
        }
        return null; // Đăng nhập thất bại
    }

    public List<User> getAllUsers() {
        return (List<User>) userRepository.findAll();
    }

    public User getUserById(int userId) {
        return userRepository.findById(userId).orElse(null);
    }

    public void saveUser(User user) {
        userRepository.save(user);
    }






}

