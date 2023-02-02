<%-- 
    Document   : Admin_Track_Page
    Created on : 26 Apr, 2020, 8:18:55 PM
    Author     : T C Balachanderan
--%>

<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

<html lang="en">
    <head>
        <!-- Required meta tags-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Colorlib Templates">
    <meta name="author" content="Colorlib">
    <meta name="keywords" content="Colorlib Templates">

    <!-- Title Page-->
    <title>Data Tracking</title>

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
                <li><a href="Admin_Home.jsp"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i>BACK</a></li>
            </ul>
        </div>
        
        
        <%
            try {
                PreparedStatement ps=connection.prepareStatement("SELECT email FROM patient");
                String email=null;
        %>
        
        
        <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Choose Patient for Tracking</h2>
                    <form method="POST" action="Admin_Track.jsp">
                        <div class="input-group">
                            <label class="label">Patient Email</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <div class="select-dropdown">
                                <select name="email">
                                    <option disabled="disabled" selected="selected">Choose email</option>
                                    
                                    <%
                                        ResultSet rs=ps.executeQuery();
                                        while(rs.next()) {
                                            email=rs.getString("email");
                                    %>
                                    
                                    <option name="email" value="<%=email%>"><%=email%></option> 
                                    
                                    <%
                                        session.setAttribute("email",email);
                                    }
                                    } catch(Exception ex) {
                                        out.print(ex);
                                    }
                                    %>
                                    
                                </select>
                                </div>  
                            </div>
                                    <br><br><br>
                            <label class="label">Admin Password</label>
                            <input class="input--style-4" type="password" name="a_password" required="">
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Start Tracking</button>
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
