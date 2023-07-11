<%@page import="com.pharmacystore.pojo.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.ProductDao"%>
<%@page import="com.pharmacystore.daoimpl.ProductDaoImpl"%>
<%
	ProductDao daoImpl = new ProductDaoImpl();
	List<Product> lst = daoImpl.getAllProducts();
	application.setAttribute("PROLIST", lst);
	response.sendRedirect("viewallproductsadmin.jsp");
%>