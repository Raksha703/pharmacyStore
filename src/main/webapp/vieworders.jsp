<%@page import="com.pharmacystore.daoimpl.OrderDAOImpl"%>
<%@page import="com.pharmacystore.dao.OrderDao"%>
<%@page import="com.pharmacystore.daoimpl.AdminDaoImpl"%>
<%@page import="com.pharmacystore.dao.AdminDao"%>
<%@page import="com.pharmacystore.pojo.Order"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix = "c" %>	

<!DOCTYPE html>
<html>
<head>

<!-- alert -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<meta charset="ISO-8859-1">
   <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>View Orders</title>
</head>
<style>
#nav{
background-color:#1977cc;
color:white;
}

</style>

<body>
<%
	if(!session.isNew() || session.getAttribute("ADMIN") != null)
	{
	%>
		
			<nav class="navbar navbar-default" id="nav">
				<div class="container-fluid">
					<div class="navbar-header">
					<a href="adminhome.jsp" class="navbar-brand" id="nav"> ADMIN HOME </a>
				</div>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="logoutadmin.jsp"><span class="glyphicon glyphicon-log-out" id="nav"></span> Logout</a></li>
				</ul>
				</div>
			</nav>
			<div class="container">

				<c:if test="${param.msg == 'orderUpdateFail'}">
					<c:set var="message" value="Order confirmation failed !!!"/>
				</c:if>
				
				<c:if test="${not empty message}">
					<script>
						if ("${message}" !== "") {
					    	swal({
					    	    title: 'Message From Server',
					            text: '${message.trim()}',
					            icon: 'error'
						    });
						}
					</script>
				</c:if>
			
		 	<div class="table-wrapper">
            	<div class="table-title">
                	<div class="row">
                    	<div class="col-sm-6">
                        	<h2> Products For You</h2><br>
                    	</div>
                	</div>
            	</div>
            <table class="table table-striped table-hover table-bordered">
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th> Customer Id</th>
                        <th>Product iD</th>
                        <th>Ordered Units</th>
                        <th> Address</th>
                        <th>Order Date</th>
                        <th>Requested Date</th>
                        <th> Accepted</th>
                        <th> Cancelled</th>
                        <th> Confirmed</th>
                        <th> Bill Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${applicationScope.ALLORDERLIST}"
	        					var="allorder">
                    <tr>

                        <td>${allorder.orderid}</td>
                        <td>${allorder.customerid}</td>
                        <td>${allorder.productid}</td>
                        <td>${allorder.orderedunits}</td>
                        <td>${allorder.address}</td>
                        <td>${allorder.ordereddate}</td>
                        <td>${allorder.requesteddate}</td>
                        <td>${allorder.accepted}</td>
                        <td>${allorder.cancelled}</td>
                        <td>${allorder.confirmed}</td>
                        <td>${allorder.billamount}</td>
                        
                        <td>
                            <form action="updatestatus.jsp" method="post">
                            <input type="hidden" name="orderid" value="${allorder.orderid}"/>
                            <input class = "btn btn-danger" type="submit" value="Confirm the Order"/>
                            </form>
                        </td>
                                             
                   </tr>
				</c:forEach>
                </tbody>
            </table>
        </div>
         </div>
		<div class="clearfix">
                <ul class="pagination">
                    <li class="page-item disabled"><a href="#">Previous</a></li>
                    <li class="page-item active"><a href="#" class="page-link">1</a></li>
                    <li class="page-item"><a href="#" class="page-link">2</a></li>
                    <li class="page-item "><a href="#" class="page-link">3</a></li>
                    <li class="page-item"><a href="#" class="page-link">4</a></li>
                    <li class="page-item"><a href="#" class="page-link">Next</a></li>
                </ul>
            </div>
		<%
				
			}
			else{
		%>
			<p style=color:red> You need to login first !!! </p>
			<jsp:include page="adminlogin.jsp"></jsp:include>
		<%				
			}
		%>
       
        

</body>
</html>