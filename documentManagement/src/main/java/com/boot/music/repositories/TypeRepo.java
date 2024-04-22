package com.boot.music.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boot.music.entity.Type;

public interface TypeRepo extends JpaRepository<Type, Long> {

}
