<%@page import="com.pharmacystore.pojo.User"%>
<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="java.util.List"%>
<%@page import="com.pharmacystore.dao.UserDao"%>
<%@page import="com.pharmacystore.daoimpl.UserDaoImpl"%>
<%
	String uid = (String) session.getAttribute("USER");
	
	User u = new User();
	u.setUserid(uid);
	UserDao udao = new UserDaoImpl();
	
	List<Order> lst = udao.displaymyconfirmedorder(u);
	
	application.setAttribute("CONFIRMORDERLIST", lst);
	response.sendRedirect("confirmedorders.jsp");
%>