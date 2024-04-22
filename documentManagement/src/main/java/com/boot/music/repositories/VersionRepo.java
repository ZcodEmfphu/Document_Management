package com.boot.music.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.boot.music.entity.Version;

public interface VersionRepo extends JpaRepository<Version, Long>{

}
