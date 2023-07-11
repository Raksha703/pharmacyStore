<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%
	ProductDao pdao = new ProductDaoImpl();
	List<Product> lst3 = pdao.displayProductsCategoryWise(10);
	application.setAttribute("PRO3LIST", lst3);
	response.sendRedirect("category3.jsp");
%>