package com.chaApp.models;

public class Utilisateur {
 private String nom;
 private String prenom;
 private String email;
 private String photo;
public Utilisateur(String nom, String prenom, String email, String photo) {
	this.nom = nom;
	this.prenom = prenom;
	this.email = email;
	this.photo = photo;
}
public String getNom() {
	return nom;
}
public void setNom(String nom) {
	this.nom = nom;
}
public String getPrenom() {
	return prenom;
}
public void setPrenom(String prenom) {
	this.prenom = prenom;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getPhoto() {
	return photo;
}
public void setPhoto(String photo) {
	this.photo = photo;
}
}
