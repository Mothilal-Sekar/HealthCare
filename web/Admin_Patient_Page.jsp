<%-- 
    Document   : Admin_Patient_Page
    Created on : 31 Mar, 2020, 2:40:06 PM
    Author     : T C Balachanderan
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Patient Details</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
                               table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}
th{
    text-align: center;
    border: 1px solid #dddddd;
  padding: 8px;
}


tr:nth-child(even) {
  background-color: #dddddd;
}
.clickme {
    background-color: #EEEEEE;
    padding: 8px 20px;
    text-decoration:none;
    font-weight:bold;
    border-radius:5px;
    color: #10a2ff;
    cursor:pointer;
}
body {
  font-family: Arial;
}

* {
  box-sizing: border-box;
}

form.example input[type=text] {
  padding: 10px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 80%;
  background: #f1f1f1;
}

form.example button {
  float: left;
  width: 20%;
  padding: 10px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none;
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

form.example::after {
  content: "";
  clear: both;
  display: table;
}

   .navbar-brand { position: relative; z-index: 2; }

.navbar-nav.navbar-right .btn { position: relative; z-index: 2; padding: 4px 20px; margin: 10px auto; }

.navbar .navbar-collapse { position: relative; }
.navbar .navbar-collapse .navbar-right > li:last-child { padding-left: 22px; }

.navbar .nav-collapse { position: absolute; z-index: 1; top: 0; left: 0; right: 0; bottom: 0; margin: 0; padding-right: 120px; padding-left: 80px; width: 100%; }
.navbar.navbar-default .nav-collapse { background-color: #f8f8f8; }
.navbar.navbar-inverse .nav-collapse { background-color: #222; }
.navbar .nav-collapse .navbar-form { border-width: 0; box-shadow: none; }
.nav-collapse>li { float: right; }

.btn.btn-circle { border-radius: 50px; }
.btn.btn-outline { background-color: transparent; }

@media screen and (max-width: 767px) {
    .navbar .navbar-collapse .navbar-right > li:last-child { padding-left: 15px; padding-right: 15px; } 
    
    .navbar .nav-collapse { margin: 7.5px auto; padding: 0; }
    .navbar .nav-collapse .navbar-form { margin: 0; }
    .nav-collapse>li { float: none; }
}
        </style>
    </head>
    <body>
        
        <div class="Menu-Bar">
            <ul>
				<li><a href="Admin_Home.jsp"><i class="fa fa-home"></i>Home</a></li>
				<li class="active"><a href="Admin_Patient_Page.jsp"><i class="fa fa-user"></i>Patient</a></li>
				<li><a href="Admin_Doctor_Page.jsp"><i class="fa fa-user-md" aria-hidden="true"></i>Doctor</a></li>
                                <li><a href="Admin_Patient_Emergency_Page.jsp"><i class="fa fa-heartbeat" aria-hidden="true"></i>Emergency</a></li>
				<li><a href="Admin_Login_Page.jsp"><i class="fa fa-sign-out" aria-hidden="true"></i></i>Logout</a></li>
            </ul>
		</div>
        
        <%
    try
    {
     PreparedStatement ps1=connection.prepareStatement("select name,email,location,disease,age,gender,dob,phonenumber,diseasedescription,guardianname,status from patient ");
     ResultSet rs=ps1.executeQuery();
     %>
     <br>
     <h1 style="text-align: center;">PATIENT DETAILS</h1>
     <br>
      <table>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Location</th>
            <th>Disease</th>
            <th>Age</th>
            <th>Gender</th>
            <th>DOB</th>
            <th>Phone</th>
            <th>Description</th>
            <th>Guardian</th>
            <th>Health Status</th>
            
        </tr>
     <%
     while(rs.next())
     {
         String a=rs.getString(1);
         String b=rs.getString(2);
         String c=rs.getString(3);
         String d=rs.getString(4);
         String e=rs.getString(5);
         String f=rs.getString(6);
         String g=rs.getString(7);
         String h=rs.getString(8);
         String i=rs.getString(9);
         String j=rs.getString(10);
         String k=rs.getString(11);
         
         %>
         
        <tr>
            
               <tr style="font-size:large;font-family: serif">
  

                                    <TD style=" text-align: center"><%=a%></a></TD>                                    
                                    <TD style=" text-align: center"><%=b%></a></TD>
                                    <TD style=" text-align: center"><%=c%></a></TD>
                                    <TD style=" text-align: center"><%=d%></a></TD>
                                    <TD style=" text-align: center"><%=e%></a></TD>
                                    <TD style=" text-align: center"><%=f%></a></TD>
                                    <TD style=" text-align: center"><%=g%></a></TD>
                                    <TD style=" text-align: center"><%=h%></a></TD>
                                    <TD style=" text-align: center"><%=i%></a></TD>
                                    <TD style=" text-align: center"><%=j%></a></TD>
                                    <TD style=" text-align: center"><%=k%></a></TD>
                                   
                                    
                                    
                                </tr>
                                
         <%
     }
     
    }catch(Exception ex)
    {
        out.print(ex);
    }

%>   
    </body>
</html>
