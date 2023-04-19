package com.chaApp.models;

import java.util.LinkedHashMap;

import javax.crypto.SecretKey;

public class MessageJson {
   int recepteurId;
   String content;
   String type;
   String nom_rec;
   String prenom_rec;
   String photo_rec;
   int emet;
   String date;
  public  String key;
  public String Msg;
public MessageJson(String key,int id, String message,String type, int emet,String date, String nom_rec,String prenom_rec,String photo_rec) {
	this.key=key;
	this.recepteurId = id;
	this.content = message;
	this.type=type;
	this.nom_rec=nom_rec;
	this.prenom_rec=prenom_rec;
	this.photo_rec=photo_rec;
	this.emet=emet;
	this.date=date;
}
public MessageJson(String message,String key) {

	this.Msg = message;
	this.key=key;
	
}
public MessageJson() {
	// TODO Auto-generated constructor stub
}
}
