package com.boot.music.controller;

import com.boot.music.entity.Document;
import com.boot.music.entity.User;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.UserRepo;
import com.boot.music.request.DocumentRequest;
import com.boot.music.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Controller
public class DocumentController {

    @Autowired
    private DocumentService documentService;
    @Autowired
    private DocumentRepo documentRepo;
    private UserRepo userRepo;


    @GetMapping("/documents")
    public String getAllDocuments(Model model) {
        List<Document> documents = documentService.getAllDocuments();
        model.addAttribute("documents", documents);
        return "documents";
    }

    @GetMapping("/approve/{id}")
    public String approveDocument(@PathVariable int id) {
        Document document = documentRepo.findById(id).orElse(null);
        if (document != null) {
            document.setStatus((short) 1); // Đặt trạng thái thành "Đang chờ duyệt"
            documentRepo.save(document);
        }
        return "redirect:/documents";
    }

    @GetMapping("/decline/{id}")
    public String declineDocument(@PathVariable int id) {
        Document document = documentRepo.findById(id).orElse(null);
        if (document != null) {
            document.setStatus((short) 4); // Đặt trạng thái thành "Từ chối duyệt"
            documentRepo.save(document);
        }
        return "redirect:/documents";
    }





}


