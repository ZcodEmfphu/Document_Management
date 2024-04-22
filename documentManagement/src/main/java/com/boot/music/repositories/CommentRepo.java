package com.boot.music.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boot.music.entity.Comment;

public interface CommentRepo extends JpaRepository<Comment, Long>{

}
