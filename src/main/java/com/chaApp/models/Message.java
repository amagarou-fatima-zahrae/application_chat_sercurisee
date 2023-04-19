package com.chaApp.models;

import java.io.Serializable;

public class Message implements Serializable{
	
	private String typeMsg;
	private String contenu;
	private int id_recepteur;
	private int id_emetteur;
	private String date_envoi;
	
	public Message(String typeMsg, String contenu, int id_recepteur, int id_emetteur, String date_envoi) {
		this.typeMsg = typeMsg;
		this.contenu = contenu;
		this.id_recepteur = id_recepteur;
		this.id_emetteur = id_emetteur;
		this.date_envoi = date_envoi;
	}

	public String getTypeMsg() {
		return typeMsg;
	}

	public void setTypeMsg(String typeMsg) {
		this.typeMsg = typeMsg;
	}

	public String getContenu() {
		return contenu;
	}

	public void setContenu(String contenu) {
		this.contenu = contenu;
	}

	public int getId_recepteur() {
		return id_recepteur;
	}

	public void setId_recepteur(int id_recepteur) {
		this.id_recepteur = id_recepteur;
	}

	public int getId_emetteur() {
		return id_emetteur;
	}

	public void setId_emetteur(int id_emetteur) {
		this.id_emetteur = id_emetteur;
	}

	public String getDate_envoi() {
		return date_envoi;
	}

	public void setDate_envoi(String date_envoi) {
		this.date_envoi = date_envoi;
	}
	
	
     
}
