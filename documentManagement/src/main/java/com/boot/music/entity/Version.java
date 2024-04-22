package com.boot.music.entity;

import java.sql.Clob;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
@Entity
public class Version {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name = "Date_Start")
	private Date dateStart;
	@DateTimeFormat(pattern = "dd-MM-yyyy")
	@Column(name = "Date_End")
	private Date dateEnd;
	@ManyToOne(fetch = FetchType.EAGER)
	private Document document;

	private byte status_ID;
	//lob means Large OBject, "c" in clob is Character, b in blob is binary
	//@Lob
	private String content;


	private String comment;
	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getComment() {
		return comment;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getDateStart() {
		return dateStart;
	}
	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}
	public Date getDateEnd() {
		return dateEnd;
	}
	public void setDateEnd(Date dateEnd) {
		this.dateEnd = dateEnd;
	}
	public Document getDocument() {
		return document;
	}
	public void setDocument(Document document) {
		this.document = document;
	}
	public byte getStatus_ID() {
		return status_ID;
	}
	public void setStatus_ID(byte status_ID) {
		this.status_ID = status_ID;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Long getId() {
		return id;
	}
	public Version(String name, Date dateStart, Date dateEnd, Document document, String content) {
		super();
		this.name = name;
		this.dateStart = dateStart;
		this.dateEnd = dateEnd;
		this.document = document;
		this.status_ID=1;
		this.content = content;
	}
	public Version() {
		super();
	}


}
