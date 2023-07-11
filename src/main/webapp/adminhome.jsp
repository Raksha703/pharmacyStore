<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" 
prefix = "c" %>	
    
    <%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setDateHeader("Expires", 0);
    %>

<!DOCTYPE html>
<html>
<head>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


 <title>ADMIN HOME </title>
    <!-- bootstrap.min css -->
    <link rel="stylesheet" href="Homepage/adminhome/plugins/bootstrap/css/bootstrap.css">
    <!-- Icofont Css -->
    <link rel="stylesheet" href="Homepage/adminhome/plugins/fontawesome/css/all.css">
    <!-- animate.css -->
    <link rel="stylesheet" href="Homepage/adminhome/plugins/animate-css/animate.css">
    <!-- Icofont -->
    <link rel="stylesheet" href="Homepage/adminhome/plugins/icofont/icofont.css">
    <!-- Main Stylesheet -->
    <link rel="stylesheet" href="Homepage/adminhome/css/style.css">    
    
</head>
<style>
#container {
    background-color: rgba(0, 0, 0, 0.8);
    color: white;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 150px;
    padding: 0;
    margin: 0;
}
#container #navbar-brand {
    margin: 10px;
}

</style>
<body>
<%
			if(!session.isNew() || session.getAttribute("ADMIN") != null)
			{
		%>		
		
				<c:set var = "message" value=""/>

				<c:if test="${param.msg == 'categoryAddSuccess'}">
					<c:set var="message" value="Category added successful !!!"/>
				</c:if>
				
				<c:if test="${param.msg == 'addProductSuccess'}">
					<c:set var="message" value="Product added successful !!!"/>
				</c:if>
				
				<c:if test="${param.msg == 'deleteCatSuccess'}">
					<c:set var="message" value="Category deleted successful !!!"/>
				</c:if>
				
				<c:if test="${param.msg == 'statusUpdateSuccess'}">
					<c:set var="message" value="Status updated successful !!!"/>
				</c:if>
								
				
				<c:if test="${not empty message}">
					<script>
						if ("${message}" !== "") {
					    	swal({
					    	    title: 'Message From Server',
					            text: '${message.trim()}',
					            icon: 'success'
						    });
						}
					</script>
				</c:if>
				
		<nav class="navbar navbar-expand-lg fixed-top trans-navigation">
        <div class="container">
            <a class="navbar-brand" href="adminhome.jsp">		
                <h3 style="color:white">ADMIN HOME</h3>
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#mainNav" aria-controls="mainNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon">
                    <i class="fa fa-bars"></i>
                </span>
              </button>

            <div class="collapse navbar-collapse justify-content-end" id="mainNav">
                <ul class="navbar-nav ">
                	<li class="nav-item">
                        <a class="nav-link smoth-scroll" href="addcategoryform">Add Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link smoth-scroll" href="deletecatcontroller">Delete Category</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link smoth-scroll" href="vieworderscontroller">View Unconfirmed Orders</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link smoth-scroll" href="additemtoproduct">Add Products</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link smoth-scroll" href="viewallproadmincontroller">View Available Products</a>
                    </li>
                    
					<ul class="navbar-nav-right">
						<li><a class="nav-link smoth-scroll" href="logoutadmin.jsp"><span
						class="glyphicon glyphicon-log-out"></span> Logout</a></li>
					</ul>

                </ul>
            </div>
        </div>
    </nav>
   

<!--MAIN BANNER AREA START -->
<div class="banner-area banner-3">
    <div class="overlay dark-overlay"></div>
    <div class="d-table">
        <div class="d-table-cell">
            <div class="container">
            
               <%/*
					String msg = request.getParameter("msg");
					String message = "";
				
					if(msg!=null && msg.equals("categoryAddSuccess")){
						message = "Category added successful !!!";
					}
						
					else if(msg!=null && msg.equals("addProductSuccess")){
						message = "Product added successful !!!";
					}
					
					else if(msg!=null && msg.equals("deleteCatSuccess")){
						message = "Category deleted successful !!!";
					}
					
					else if(msg!=null && msg.equals("statusUpdateSuccess")){
						message = "Status updated successful !!!";
					}*/
					
				%>
				
				            
            
                <div class="row">
                    <div class="col-lg-8 m-auto text-center col-sm-12 col-md-12">
                        <div class="banner-content content-padding">
                            <h5 class="subtitle">...</h5>
                         <h1 class="banner-title">Admin operations are done through this page.</h1>
                            

                            <a href="#" class="btn btn-white btn-circled">Get started</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--MAIN HEADER AREA END -->
<!--  ABOUT AREA START  -->
   




<!--  FOOTER AREA START  -->
<section id="footer" class="section-padding">
    <div class="container">
        
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer-copy">
                  2021  ©  All Rights Reserved.
                </div>
            </div>
        </div>
    </div>
</section>
<!--  FOOTER AREA END  -->

   

    <!-- 
    Essential Scripts
    =====================================-->

    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.29.2/sweetalert2.all.min.js"></script>    
<script src="resources/sweetalert2.all.js" type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Main jQuery -->
    <script src="Homepage/adminhome/plugins/jquery/jquery.min.js"></script>
    <!-- Bootstrap 4.3.1 -->
    <script src="Homepage/adminhome/plugins/bootstrap/js/popper.min.js"></script>
    <script src="Homepage/adminhome/plugins/bootstrap/js/bootstrap.min.js"></script>
   <!-- Woow animtaion -->
    <script src="Homepage/adminhome/plugins/counterup/wow.min.js"></script>
    <script src="Homepage/adminhome/plugins/counterup/jquery.easing.1.3.js"></script>
     <!-- Counterup -->
    <script src="Homepage/adminhome/plugins/counterup/jquery.waypoints.js"></script>
    <script src="Homepage/adminhome/plugins/counterup/jquery.counterup.min.js"></script>

    <!-- Google Map -->
    <script src="Homepage/adminhome/plugins/google-map/gmap3.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>   
    <!-- Contact Form -->
    <script src="Homepage/adminhome/plugins/jquery/contact.js"></script>
    <script src="Homepage/adminhome/js/custom.js"></script>
			
	<% 
	}else
	{
		%>
			<p style="color:red">You need to login first</p>
			<jsp:include page="adminlogin.jsp"></jsp:include>
		<% 
	}
	%>
</body>
</html>