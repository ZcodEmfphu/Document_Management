package com.boot.music.repositories;

import java.util.List;
import com.boot.music.entity.Document;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentRepo extends JpaRepository<Document, Integer> {

	List<Document> findByStatusID(int statusID);
}