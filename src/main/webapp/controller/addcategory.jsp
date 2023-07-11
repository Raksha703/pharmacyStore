<%@page import="com.pharmacystore.dao.CategoryDao"%>
<%@page import="com.pharmacystore.pojo.Category"%>
<%@page import="com.pharmacystore.daoimpl.CategoryDaoImpl"%>

<jsp:useBean class="com.pharmacystore.pojo.Category" id="category" scope="page" ></jsp:useBean>
<jsp:setProperty property="categoryName" name="category"/>

<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{	
		CategoryDao daoImpl = new CategoryDaoImpl();
		
		if(daoImpl.addCategory(category)){
			response.sendRedirect("adminhome.jsp?msg=categoryAddSuccess");
		}
		else
		{
			response.sendRedirect("addcategoryform.jsp?msg=categoryAddFail");
		}
	}
%>

