<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
	<%
		if(!session.isNew() || session.getAttribute("USER") != null){
			session.setAttribute("USER", null);
			session.invalidate();
			
			response.sendRedirect("index.jsp?msg=logoutSuccess");
		}
		else {
			response.sendRedirect("userlogin.jsp?msg=loginFirst");
		}
	%>
</div>

</body>
</html>