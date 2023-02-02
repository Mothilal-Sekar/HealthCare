<%-- 
    Document   : Patient_Change_Location
    Created on : 31 Mar, 2020, 3:05:16 PM
    Author     : T C Balachanderan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Change Location</title>

    <!-- Icons font CSS-->
    <link href="vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">
    <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
    <!-- Font special for pages-->
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Vendor CSS-->
    <link href="vendor/select2/select2.min.css" rel="stylesheet" media="all">
    <link href="vendor/datepicker/daterangepicker.css" rel="stylesheet" media="all">

    <!-- Main CSS-->
    <link href="css/main.css" rel="stylesheet" media="all">
    
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    
</head>
    <body>
        
        <div class="Menu-Bar">
            <% String disease=(String)session.getAttribute("disease");%>
            <ul>
				<li><a href="Patient_Home_Page.jsp"><i class="fa fa-address-book"></i>Profile</a></li>				
                                <li>   
                                <%
                                    if(disease.equals("Cardiovascular"))
                                    {
                                    out.print("<a href=Cardio_Patient.jsp>");
                                    }
                                    else if(disease.equals("Diabetics"))
                                    {
                                    out.print("<a href=Diabetices_Patient.jsp>");
                                    }
                                    else
                                    {
                                    out.print("<a href=Patient_Report_Page.jsp>");
                                    }


                                %>
                                <i class="fa fa-address-card"></i>Report</a></li>
                                <li><a href="Patient_Appoint_Doctor_Page.jsp"><i class="fa fa-plus-square"></i>Appointment</a></li>
                                <li class="active"><a href="#"><i class="fa fa-wrench"></i>Change</a>
					<div class="Sub-Menu-1">
						<ul>
                                                    <li><a href="Patient_Change_Location_Page.jsp"><i class="fa fa-map-marker"></i>Location</a></li>
                                                    <li><a href="Patient_Change_Doctor_Page.jsp"><i class="fa fa-user-md"></i>Doctor</a></li>                                                        
                                                    <li><a href="Patient_Change_Details_Page.jsp"><i class="fa fa-user-circle"></i>My Details</a></li>
                                                    <li><a href="Patient_Change_Password_Page.jsp"><i class="fa fa-key"></i>Password</a></li>
                                                        
                                                </ul>
					</div>
				</li>
				<li><a href="index.html"><i class="fa fa-sign-out"></i>Logout</a></li>
			</ul>
        </div>
        
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Choose Location</h2>
                    <form method="POST" action="Patient_Change_Location.jsp">
                        <div class="input-group">
                            <label class="label">Change Location</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <div class="select-dropdown">
                                <select name="new_location">
                                        <option disabled="disabled" selected="selected">Choose new location</option>
                                        <option>Chennai</option>
                                        <option>Coimbatore</option>
                                        <option>Madurai</option>
                                        <option>Trichi</option>
                                        <option>Vellore</option>
                                                                                
                                </select>
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Change</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Jquery JS-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <!-- Vendor JS-->
    <script src="vendor/select2/select2.min.js"></script>
    <script src="vendor/datepicker/moment.min.js"></script>
    <script src="vendor/datepicker/daterangepicker.js"></script>

    <!-- Main JS-->
    <script src="js/global.js"></script>
        
    </body>
</html>
