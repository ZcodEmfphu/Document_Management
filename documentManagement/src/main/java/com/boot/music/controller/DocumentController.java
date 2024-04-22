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
    private UserRepo userRepo;


    @GetMapping("/documents")
    public String getAllDocuments(Model model) {
        List<Document> documents = documentService.getAllDocuments();
        model.addAttribute("documents", documents);
        return "documents";
    }

    @Autowired
    private DocumentRepo documentRepo;

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

    @PostMapping("/updateDocumentStatus")
    public String updateDocumentStatus(@RequestParam int documentId, @RequestParam int status, RedirectAttributes redirectAttributes) {
        // Gọi phương thức service để cập nhật trạng thái của tài liệu
        documentService.updateDocumentStatus(documentId, status);
        // Thêm thông báo hoặc dữ liệu cần thiết vào redirectAttributes nếu cần
        redirectAttributes.addFlashAttribute("message", "Cập nhật trạng thái tài liệu thành công!");
        // Chuyển hướng người dùng đến trang /documents
        return "redirect:/documents";
    }

//    @PostMapping("/createDoc")
//    public String createDoc(@ModelAttribute("doc") DocumentRequest request, Model model) {
//        //Lấy người đăng nhập hiện tại (session ???) >> Get lại ng dùng trong CSDL
//        User creator = userRepo.getTopByOrderByIdDesc(); //Giờ chưa có hệ thống đăng nhập nên tạm ntn
//
//        //Tạo tài liệu
//        Document doc = documentService.createDocument(request, creator);
//        if (doc == null) { //Nếu Tài liệu không trả về > báo lỗi > về trang tài liệu
//            model.addAttribute("error", "Tạo tài liệu thất bại!");
//            return "redirect:createDoc";
//        } else {
//            model.addAttribute("message", "Tạo tài liệu thành công!");
//            return "redirect:reports"; //Trang xem tài liệu chi tiết?
//        }
//    }

    @GetMapping("/{id}")
    public String details(@RequestParam("id") int id, Model model) {
        Document doc = documentService.getDocumentById(id);
        if (doc == null) { //Nếu Tài liệu ko tồn tại > báo lỗi > về trang tài liệu
            model.addAttribute("error", "Tài liệu " + id + " không tồn tại!");
            return "redirect:/documents";
        } else {
            model.addAttribute("doc", doc);
            return "redirect:/documents";
        }
    }

    @PostMapping("/addDocument")
    public String addDocument(@RequestParam("title") String title,
                              @RequestParam("summary") String summary,
                              @RequestParam("dateStart") Date dateStart,
                              @RequestParam("dateEnd") Date dateEnd) {
        Document document = new Document();
        document.setTitle(title);
        document.setSumary(summary);
        document.setDateStart(dateStart);
        document.setDateEnd(dateEnd);


        documentRepo.save(document);

        return "redirect:/documents"; // Điều hướng đến trang thành công sau khi thêm tài liệu
    }
}


