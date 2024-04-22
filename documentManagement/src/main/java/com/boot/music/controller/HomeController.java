package com.boot.music.controller;

import java.util.List;

import com.boot.music.entity.Document;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.service.DocumentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import jakarta.servlet.http.HttpSession;

@Validated
@Controller
@RequestMapping("/")
public class HomeController {
	private final DocumentService documentService;

	public HomeController(DocumentService documentService) {
		this.documentService = documentService;
	}


	//	@Autowired
//	private AccountRepo accRepo;
//		EntityManagerFactory emf= Persistence.createEntityManagerFactory("music");
//		EntityManager e=emf.createEntityManager();
	//equivalent to http://localhost:8080/home, return page index.jsp
	@GetMapping("/home")
	public ModelAndView home(ModelAndView model , HttpSession session) {
		model= new ModelAndView("index");
		model.addObject("demo", "1 object hoặc giá trị cần truyền sang jsp");
		return model;
		}
//	@GetMapping("/acc")
//	public ModelAndView account(ModelAndView model , HttpSession session) {
//		model= new ModelAndView("accounts");
//
//		return model;
//		}
@Autowired
private DocumentRepo documentRepo;

//	@GetMapping("/documents")
//	public String documents(Model model) {
//		List<Document> documents = documentRepo.findAll();
//		model.addAttribute("documents", documents);
//		return "documents";
//	}
	@GetMapping("/login")
	public ModelAndView login(ModelAndView model , HttpSession session) {
		model= new ModelAndView("loginAdmin");

		return model;
		}
	@GetMapping("/createAccount")
	public ModelAndView createAccount(ModelAndView model , HttpSession session) {
		model= new ModelAndView("create-account");

		return model;
		}
	@GetMapping("/createDoc")
	public ModelAndView createDoc(ModelAndView model , HttpSession session) {
		model= new ModelAndView("create-document");

		return model;
		}
	@GetMapping("/report")
	public ModelAndView report(ModelAndView model , HttpSession session) {
		model= new ModelAndView("report");

		return model;
		}
	@GetMapping("/statistics")
	public ModelAndView statistic(ModelAndView model , HttpSession session) {
		model= new ModelAndView("statistics");

		return model;
		}

	@PostMapping("/updateDocument")
	@ResponseBody
	public String updateDocument(@RequestParam("id") int id,
								 @RequestParam("title") String title,
								 @RequestParam("summary") String summary) {
		try {
			// Cập nhật tiêu đề và tóm tắt của tài liệu
			documentService.updateDocument(id, title, summary);
			return "Cập nhật tiêu đề và tóm tắt thành công!";
		} catch (Exception e) {
			return "Đã xảy ra lỗi khi cập nhật tiêu đề và tóm tắt: " + e.getMessage();
		}
	}
	}
