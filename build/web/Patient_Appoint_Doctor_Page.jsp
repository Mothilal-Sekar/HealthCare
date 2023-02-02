<%-- 
    Document   : Patient_Appoint_Doctor_Page
    Created on : 28 Apr, 2020, 10:53:55 AM
    Author     : MLDon_PC
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags-->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">
    

    <!-- Title Page-->
    <title>Patient Appoint Doctor</title>
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
<style>
  table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 97%;
  margin-left: 20px;
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
        <%
            String disease=(String)session.getAttribute("disease");
            String p_doctor=(String)session.getAttribute("p_doctor");
            String p_email=(String)session.getAttribute("email");
            String p_name=(String)session.getAttribute("p_name");
            String p_status=(String)session.getAttribute("p_status");
            String p_disease=(String)session.getAttribute("disease");
        %>
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
                                <li  class="active"><a href="Patient_Appoint_Doctor_Page.jsp"><i class="fa fa-plus-square"></i>Appointment</a></li>
                                <li><a href="#"><i class="fa fa-wrench"></i>Change</a>
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
            <br><br>
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Doctor Appointment</h2>
                    <form method="POST" action="Patient_Appoint_Doctor.jsp"> 
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Doctor Name</label>
                                    <label class="input--style-4"><%=p_doctor%></label><br>
                                    If you need<a href="Patient_Change_Doctor_Page.jsp"> Change Doctor</a>
                                    
                                </div>
                            </div>
                        </div>
                                    
                        <div class="row row-space">
                                <div class="input-group">
                                    <label class="label">choose Date</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="a_date" required="">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                                
                                <div class="input-group">
                                    <label class="label">Choose Time</label>
                                    <div class="rs-select2 js-select-simple select--no-search">
                                <div class="select-dropdown">
                                    <select name="a_time" required="">
                                        <option disabled="disabled" selected="selected" value="">Choose a Appointment Time</option>
                                        <option>10:00 - 11:00 AM</option>
                                        <option>11:00 - 12:00 AM</option>
                                        <option>01:00 - 02:00 PM</option>
                                        <option>02:00 - 03:00 PM</option>
                                        <option>03:00 - 04:00 PM</option>
                                </select>
                                </div>
                            </div>
                            </div>
                            </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
  
          
    <%
            
    try
    {
     PreparedStatement ps1=connection.prepareStatement("select email,address,phonenumber,age from doctor where doctorname=?");
     ps1.setString(1,p_doctor );
     ResultSet rs=ps1.executeQuery();
     while(rs.next())
     {
     String d_email=rs.getString("email");
     String d_address=rs.getString("address");
     String d_phone=rs.getString("phonenumber");
     String d_age=rs.getString("age");
     
     session.setAttribute("p_name", p_name);
     session.setAttribute("p_email", p_email);
     session.setAttribute("p_status", p_status);
     session.setAttribute("d_name", p_doctor);
     session.setAttribute("disease", p_disease);
     session.setAttribute("d_email", d_email);
     session.setAttribute("d_address", d_address);
     session.setAttribute("d_phone",d_phone);
     session.setAttribute("d_age",d_age);
     }
%>

                        
                        
                        

    <%
     PreparedStatement ps2=connection.prepareStatement("select * from appointment where patientemail=?");
     ps2.setString(1, p_email);
     ResultSet rs2=ps2.executeQuery();
     %>
     <br><br>
     <h1 style="text-align: center; color: white;"><%=p_name%> Appointment History</h1><br>
      <table>
        <tr>   
            <th style="color: white;">Doctor Name</th>
            <th style="color: white;">Doctor Email</th>
            <th style="color: white;">Doctor Phone</th>
            <th style="color: white;">Doctor Age</th>
            <th style="color: white;">Appointment Date</th>
            <th style="color: white;">Appointment Time</th>
            <th style="color: white;">Hospital Address</th>
            <th style="color: white;">Appointment Status</th>  
        </tr>
     <%
     while(rs2.next())
     {
         
         String pa_d_name=rs2.getString(3);
         String pa_d_email=rs2.getString(4);
         String pa_d_phone=rs2.getString(5);
         String pa_d_age=rs2.getString(6);
         String pa_ap_time=rs2.getString(7);
         String pa_ap_date=rs2.getString(8);
         String pa_hos=rs2.getString(9);
         String pa_ap_st=rs2.getString(10);
         
                  
         %>
            <tr style="font-size:large;font-family: serif">                                    
                <TD style=" text-align: center; color: white;"><%=pa_d_name%></a></TD>
                <TD style=" text-align: center; color: white;"><%=pa_d_email%></a></TD> 
                <TD style=" text-align: center; color: white;"><%=pa_d_phone%></a></TD>                                    
                <TD style=" text-align: center; color: white;"><%=pa_d_age%></a></TD>
                <TD style=" text-align: center; color: white;"><%=pa_ap_time%></a></TD>
                <TD style=" text-align: center; color: white;"><%=pa_ap_date%></a></TD>
                <TD style=" text-align: center; color: white;"><%=pa_hos%></a></TD>
                <TD style=" text-align: center; color: white;"><%=pa_ap_st%></a></TD>                   
            </tr>
      
            
         <%
     }
%>
   </table>      
   </div>                          
 <%
    }catch(Exception ex)
    {
        out.print(ex);
    }

%>

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
<!-- end document-->