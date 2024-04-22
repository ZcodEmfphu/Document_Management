package com.boot.music.entity;

import java.io.Serializable;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.UniqueConstraint;

@Entity
public class Status implements Serializable{
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private Long id;
@Column(unique = true)
private String name;
public Long getId() {
	return id;
}

public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}

public Status(String name) {
	super();
	this.name = name;
}

public Status() {
	super();
}


}
