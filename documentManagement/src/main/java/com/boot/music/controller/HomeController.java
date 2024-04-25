package com.boot.music.controller;


import com.boot.music.repositories.DocumentRepo;
import com.boot.music.service.DocumentService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Date;

@Validated
@Controller
@RequestMapping("/")
public class HomeController {
	private final DocumentService documentService;
	public HomeController(DocumentService documentService) {
		this.documentService = documentService;
	}


	@GetMapping("/home")
	public ModelAndView home(ModelAndView model, HttpSession session) {
		model = new ModelAndView("index");
		model.addObject("demo", "1 object hoặc giá trị cần truyền sang jsp");
		return model;
	}

	@Autowired
	private DocumentRepo documentRepo;

	@GetMapping("/login")
	public ModelAndView login(ModelAndView model, HttpSession session) {
		model = new ModelAndView("loginAdmin");
		return model;
	}

	@GetMapping("/createDocumentPage")
	public ModelAndView createDoc(ModelAndView model, HttpSession session) {
		model = new ModelAndView("create-document");
		return model;
	}


	@GetMapping("/report")
	public ModelAndView report(ModelAndView model, HttpSession session) {
		model = new ModelAndView("report");

		return model;
	}

	@GetMapping("/statistics")
	public ModelAndView statistic(ModelAndView model, HttpSession session) {
		model = new ModelAndView("statistics");

		return model;
	}




	@PostMapping("/updateDocument")
	@ResponseBody
	public String updateDocument(@RequestParam("id") int id,
								 @RequestParam("title") String title,
								 @RequestParam("summary") String summary) {
		try {
			documentService.updateDocument(id, title, summary);
			return "Cập nhật tiêu đề và tóm tắt thành công!";
		} catch (Exception e) {
			return "Đã xảy ra lỗi khi cập nhật tiêu đề và tóm tắt: " + e.getMessage();
		}
	}
}
