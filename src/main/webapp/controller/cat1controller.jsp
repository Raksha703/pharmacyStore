<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%
	ProductDao pdao = new ProductDaoImpl();
	List<Product> lst1 = pdao.displayProductsCategoryWise(10);
	application.setAttribute("PRO1LIST", lst1);
	response.sendRedirect("category1.jsp");
%>