package com.boot.music.entity;

import java.util.ArrayList;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import jakarta.validation.constraints.Email;

//notice that you need to select @ from jakarta, not from javax
@Entity
@PrimaryKeyJoinColumn(name = "account_Id")
public class User {
	//auto-created ID
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	/*
	 * in DB this attribute will be in col name [Name], if don't have
	 *
	 * @Column, default is fullname col
	 */
	@Column(name = "name")
	private String name;

	/*
	 * check weather the email follow regexp
	 *
	 * @Email(regexp = "/^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$/")
	 */
	@Column(unique = true)
	private String email;
	/*
	 * you need to check if phone is in correct format, but for simplicity's sake,
	 * check for it in front end
	 */
	private String phone;
	@Column(name = "password")
	private String password;

	private int role;
	@Column(name = "access_level")
	private int accessLevel;

	/*
	 * 1 user has many documents created by it mappedBy tells hibernate that search
	 * for Doc bean in User
	 */
	@OneToMany(mappedBy = "user",cascade = CascadeType.MERGE)
	private List<Document> documentList;
	//blank constructor is needed
	public User() {}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	public int getAccessLevel() {
		return accessLevel;
	}
	public void setAccessLevel(int accessLevel) {
		this.accessLevel = accessLevel;
	}
	public List<Document> getDocumentList() {
		return documentList;
	}
	public void setDocumentList(List<Document> documentList) {
		this.documentList = documentList;
	}
	public User(String name,  String email, String phone,
				String password, int role, int accessLevel) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.password = password;
		this.role = role;
		this.accessLevel = accessLevel;
		documentList=new ArrayList<Document>();

	}



}
