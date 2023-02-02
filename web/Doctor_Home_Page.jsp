<%-- 
    Document   : Doctor_Home_Page
    Created on : 29 Mar, 2020, 12:52:38 PM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

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
    <title>Doctor Home</title>

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
        <ul>
            <li class="active"><a href="Doctor_Home_Page.jsp"><i class="fa fa-address-book"></i>Profile</a></li>
            <li><a href="Doctor_Patient_Details.jsp"><i class="fa fa-user"></i>Patient Details</a></li>
            <li><a href="#"><i class="fa fa-envelope"></i>Appointments</a>
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
    String email=(String)session.getAttribute("email");
    String name=null;
    String gender=null;
    String phone=null;
    String age=null;
    String location=null;
    String Specalization=null;
    System.out.print("Email : "+email);
    try {
        PreparedStatement ps=connection.prepareStatement("SELECT * FROM doctor WHERE email=?");
        ps.setString(1,email);
        
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
             name=rs.getString("doctorname");
             gender=rs.getString("gender");
             phone=rs.getString("phonenumber");
             age= rs.getString("age");
             location=rs.getString("location");
             Specalization=rs.getString("Specalization");
             
             session.setAttribute("email", email);
             session.setAttribute("name", name);
             session.setAttribute("Specalization", Specalization);
        }
    }catch(Exception e)
    {
        out.print(e);    
    }      
        
%>
    
    
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Doctor Dashboard</h2>
                    <form method="POST" action="#">
                        <div class="input-group">
                            <label class="label">Name</label>
                            <label class="input--style-4"><%=name%></label>
                        </div>
                        
                        <div class="input-group">
                            <label class="label">Email</label>
                            <label class="input--style-4"><%=email%></label>
                        </div>
                        
                        <div class="input-group">
                            <label class="label">Specalization</label>
                            <label class="input--style-4"><%=Specalization%></label>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Age</label>
                                    <label class="input--style-4"><%=age%></label>
                                   
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Gender</label>
                                    <label class="input--style-4"><%=gender%></label>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <label class="input--style-4"><%=phone%></label>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Location</label>
                                    <label class="input--style-4"><%=location%></label>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">OK</button>
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

</body><!-- This templates was made by Colorlib (https://colorlib.com) -->

</html>
<!-- end document-->