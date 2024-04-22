package com.boot.music.repositories;
import org.springframework.data.jpa.repository.JpaRepository;

import com.boot.music.entity.Status;

public interface StatusRepo extends JpaRepository<Status, Integer>{

}
