package com.boot.music.controller;

import com.boot.music.entity.Document;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.UserRepo;
import com.boot.music.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

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

    @PostMapping("/createDocument")
    public String createDocument(@RequestParam("title") String title,
                                 @RequestParam("summary") String summary) {
        try {
            Document document = new Document(title, summary, null, null, null);
            documentService.createDocument(document);
            return "redirect:/";
        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/";
        }
    }


}


