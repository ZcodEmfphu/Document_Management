package com.boot.music.service;

import com.boot.music.entity.Document;
import com.boot.music.entity.User;
import com.boot.music.repositories.DocumentRepo;
import com.boot.music.repositories.UserRepo;
import com.boot.music.request.DocumentRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

@Service
public class DocumentService {

    @Autowired
    private DocumentRepo documentRepository;
    private UserRepo userRepo;
    public List<Document> getAllDocuments() {
        return documentRepository.findAll();
    }
    public void updateDocument(int id, String title, String summary) {
        Optional<Document> documentOptional = documentRepository.findById(id);
        if (documentOptional.isPresent()) {
            Document document = documentOptional.get();
            document.setTitle(title);
            document.setSumary(summary);
            documentRepository.save(document);
        } else {
            throw new IllegalArgumentException("Không tìm thấy tài liệu với ID " + id);
        }
    }
    public void updateDocumentStatus(int documentId, int newStatus) {
        Optional<Document> optionalDocument = documentRepository.findById(documentId);
        if (optionalDocument.isPresent()) {
            Document document = optionalDocument.get();
            document.setStatus( newStatus);
            documentRepository.save(document);
        } else {
            throw new RuntimeException("Không tìm thấy tài liệu với ID: " + documentId);
        }
    }



    public Document getDocumentById(int id) {
        return documentRepository.findById(id).orElseThrow(() ->
                new RuntimeException("Không tìm thấy tài liệu với ID: " + id));
    }


    public void createDocument(Document document) {
        documentRepository.save(document);
    }
}

