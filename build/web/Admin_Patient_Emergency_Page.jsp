<%-- 
    Document   : Admin_Patient_Emergency_Page
    Created on : 27 Apr, 2020, 4:18:03 PM
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
    <title>Admin Emergency Page</title>

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
		<li><a href="Admin_Home.jsp"><i class="fa fa-home"></i>Home</a></li>
		<li><a href="Admin_Patient_Page.jsp"><i class="fa fa-user"></i>Patient</a></li>
		<li><a href="Admin_Doctor_Page.jsp"><i class="fa fa-user-md" aria-hidden="true"></i>Doctor</a></li>
                <li class="active"><a href="Admin_Patient_Emergency_Page.jsp"><i class="fa fa-heartbeat" aria-hidden="true"></i>Emergency</a></li>
		<li><a href="index.html"><i class="fa fa-sign-out"></i>Logout</a></li>
            </ul>
	</div>
    
    <%
    try
    {
     PreparedStatement ps1=connection.prepareStatement("select name,email from patient where status=?");
     ps1.setString(1, "EMERGENCY");
     
     %>

    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
     <h1 style="text-align: center; color: white;">EMERGENCY PATIENT's DETAILS</h1><br><br>
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Emergency Patients</h2>
                    <form method="POST" action="Emergency.jsp">
                        <div class="input-group">
                            <label class="label">choose Patient</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <div class="select-dropdown">
                                <select name="pemail">
                                    <option disabled="disabled" selected="selected">Choose patient</option>
                                    
                                    <%
                                        ResultSet rs=ps1.executeQuery();
                                        while(rs.next()) {
                                            String pe_name=rs.getString("name");
                                            String pe_email=rs.getString("email");
                                    %>
                                    <option name="pemail" value="<%=pe_email%>"><%=pe_name+" , "+pe_email%></option> 
                                <%
                                        
                                    }
    } catch(Exception ex) {out.print(ex);}
    %>
                                </select>
                                </div>
                            </div>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Update</button>
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
