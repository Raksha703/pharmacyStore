
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import = "java.util.logging.Logger" %>

<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%		
	int prodid = Integer.parseInt(request.getParameter("productid"));
	
   	ProductDao pdaoImpl = new ProductDaoImpl();
   	Product pr = pdaoImpl.searchProduct(prodid);
   	
   	String uid = (String) session.getAttribute("USER");
   	int quantity = Integer.parseInt(request.getParameter("quantity"));
   	String address = request.getParameter("address");
   	Date date = Date.valueOf(LocalDate.now());
    //setting delivery date as  5 days after the ordered date
  	Date rdate = Date.valueOf(LocalDate.now().plusDays(5));
  	
   	int price = pr.getPrice();   	
   	int totalquantity = pr.getQuantity();   	
   	int updatedq = totalquantity-quantity;	
	int billamount = (quantity)*(price);
	
	OrderDao odaoImpl = new OrderDAOImpl();
	//inserting in orderdetails
	
	%>
	
	<jsp:useBean class="com.pharmacystore.pojo.Order" id="o" scope="page" ></jsp:useBean>
	
	<jsp:setProperty property="customerid" value="uid" name="o"/>
	<jsp:setProperty property="productid" value="prodid" name="o"/>
	<jsp:setProperty property="orderedunits" value="quantity" name="o"/>
	<jsp:setProperty property="address" value="address" name="o"/>
	<jsp:setProperty property="ordereddate" value="date" name="o"/>
	<jsp:setProperty property="requesteddate" value="true" name="o"/>
	<jsp:setProperty property="accepted" value="true" name="o"/>
	<jsp:setProperty property="cancelled" value="false" name="o"/>
	<jsp:setProperty property="confirmed" value="true" name="o"/>
	<jsp:setProperty property="billamount" value="billamount" name="o"/>
	
	
	<%/*
	Order o = new Order();
	
	o.setCustomerid(uid);
	o.setAccepted(true);
	o.setOrdereddate(date);
	o.setProductid(prodid);
	o.setAddress(address);
	o.setOrderedunits(quantity);
	o.setRequesteddate(rdate);
	o.setBillamount(billamount);
	o.setCancelled(false);
	o.setConfirmed(true);*/
	
	if(quantity<totalquantity){
		if(odaoImpl.placeOrder(o)){		
			pdaoImpl.updateQuantityAfterOrder(prodid,updatedq);
			out.print("success");
		}
		else
		{
			out.print("failure");	
		}
	}
	else{
		out.print("lessquantity");
	}
	%>