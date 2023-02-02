<%-- 
    Document   : Doctor_Appointment_Regular
    Created on : 27 Apr, 2020, 5:56:08 PM
    Author     : MLDon_PC
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Appointment Regular</title>
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
            <li><a href="Doctor_Home_Page.jsp"><i class="fa fa-address-book"></i>Profile</a></li>
            <li><a href="Doctor_Patient_Details.jsp"><i class="fa fa-user"></i>Patient Details</a></li>
            <li class="active"><a href="#"><i class="fa fa-envelope"></i>Appointments</a>
                <div class="Sub-Menu-1">
                    <ul>
                        <li><a href="Doctor_Appointment_Emergency.jsp"><i class="fa fa-heartbeat"></i>Emergency</a></li>
                        <li><a href="Doctor_Appointment_Regular.jsp"><i class="fa fa-plus-square"></i>Regular</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="#"><i class="fa fa-wrench"></i></i>Change Details</a>
                <div class="Sub-Menu-1">
                    <ul>
                        <li><a href="Doctor_Edit_Page.jsp"><i class="fa fa-user-circle"></i>My Details</a></li>
                        <li><a href="Doctor_Change_Password_Page.jsp"><i class="fa fa-key"></i>Password</a></li>
                    </ul>
                </div>
            </li>
            <li><a href="index.html"><i class="fa fa-sign-out"></i>Logout &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
        </ul>
    </div>
        
        <%
            String d_name=(String)session.getAttribute("name");
            String d_email=(String)session.getAttribute("email");
            session.setAttribute("d_email",d_email);
            String spec=(String)session.getAttribute("Specalization");
            session.setAttribute("Specalization",spec);
    try
    {
     PreparedStatement ps1=connection.prepareStatement("select * from appointment where doctoremail=? and patienthealthstatus=?");
     //JOptionPane.showMessageDialog(null, d_email);
     ps1.setString(1,d_email);
     ps1.setString(2,"NORMAL");
     ResultSet rs=ps1.executeQuery();
     %>
     <h1 style="text-align: center;">Patient Appointments</h1><br>
      <table>
        <tr>
            <th>Patient Name</th>
            <th>Patient Disease</th>
            <th>Appointment Date</th>
            <th>Appointment Time</th>
            <th>Appointment Status</th>
            <th>Full Details</th>
            <th>Accept</th>
            
            
        </tr>
     <%
     while(rs.next())
     {
         String dp_name=rs.getString(1);
         String dp_email=rs.getString(2);
         
         String dp_ap_date=rs.getString(7);
         String dp_ap_time=rs.getString(8);
         String dp_ap_st=rs.getString(10);
         String dp_dise=rs.getString(12);
        
                  
         %>
         
        <tr>
            
               <tr style="font-size:large;font-family: serif">
  

                                    <TD style=" text-align: center"><%=dp_name%></a></TD>
                                    <TD style=" text-align: center"><%=dp_dise%></a></TD>                                    
                                    <TD style=" text-align: center"><%=dp_ap_date%></a></TD>
                                    <TD style=" text-align: center"><%=dp_ap_time%></a></TD>
                                    <TD style=" text-align: center"><%=dp_ap_st%></a></TD>
                                    <TD style=" text-align: center"><a href="Doctor_Appointment_Regular_View.jsp?pemail=<%=dp_email%>">View Details</a></TD>
                                    <TD style=" text-align: center"><a href="Doctor_Appointment_Regular_Accept.jsp?pemail=<%=dp_email%>&aptime=<%=dp_ap_time%>&apdate=<%=dp_ap_date%>">Accept</a></TD>                                 
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


