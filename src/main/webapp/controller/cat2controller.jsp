<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%
	ProductDao pdao = new ProductDaoImpl();
	List<Product> lst2 = pdao.displayProductsCategoryWise(10);
	application.setAttribute("PRO2LIST", lst2);
	response.sendRedirect("category2.jsp");
%>