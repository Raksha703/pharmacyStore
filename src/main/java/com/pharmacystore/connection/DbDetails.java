package com.pharmacystore.connection;

public interface DbDetails {
	String CONSTR = "jdbc:mysql://localhost:3306/pharmacystoredb?allowPublicKeyRetrieval=true&useSSL=false";
	String USERNAME = "root";
	String PASSWORD = "12345";
	String DBDRIVER = "com.mysql.cj.jdbc.Driver";
}
