<%-- 
    Document   : Doctor_Password_Change_Page
    Created on : 28 Apr, 2020, 10:49:01 PM
    Author     : MLDon_PC
--%>

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
    <title>Doctor Change Password</title>

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
            <li><a href="Doctor_Home_Page.jsp"><i class="fa fa-address-book"></i>Profile</a></li>
            <li><a href="Doctor_Patient_Details.jsp"><i class="fa fa-user"></i>Patient Details</a></li>
            <li><a href="#"><i class="fa fa-envelope"></i>Appointments</a>
                <div class="Sub-Menu-1">
                    <ul>
                        <li><a href="Doctor_Appointment_Emergency.jsp"><i class="fa fa-heartbeat"></i>Emergency</a></li>
                        <li><a href="Doctor_Appointment_Regular.jsp"><i class="fa fa-plus-square"></i>Regular</a></li>
                    </ul>
                </div>
            </li>
            <li class="active"><a href="#"><i class="fa fa-wrench"></i></i>Change Details</a>
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
    String name=(String)session.getAttribute("name");
    String Specalization=(String)session.getAttribute("Specalization");
    session.setAttribute("email", email);
    session.setAttribute("name", name);
    session.setAttribute("Specalization", Specalization);
   
   
   try {
        PreparedStatement ps=connection.prepareStatement("select password from doctor where email=?");
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
            String o_pass=rs.getString("password");
            session.setAttribute("o_pass", o_pass);
        }

       } catch (Exception e) {
       }
                        
%>
    
    
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Change Password</h2>
                    <form method="POST" action="Doctor_Change_Password.jsp">
                        
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enter Old Password</label>
                                    <input class="input--style-4" type="password" id="pas" name="o_pass" required="" maxlength="20" minlength="8">
                                </div>
                            </div>
                        </div>   
                        <div class="row row-space">    
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Enter New Password</label>
                                    <input class="input--style-4" type="password" id="npas" name="n_pass" required="" maxlength="20" minlength="8">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Confirm New Password</label>
                                    <input class="input--style-4" type="password" id="cpas" name="nc_pass" required="" maxlength="20" minlength="8">
                                </div>
                            </div>
                        </div>
                        
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Change Password</button>
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
<!-- end document-->