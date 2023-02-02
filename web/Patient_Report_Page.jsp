<%-- 
    Document   : Patient_Report_Page
    Created on : 29 Mar, 2020, 8:16:24 AM
    Author     : T C Balachanderan
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
    <title>Patient Report</title>

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
                <li><a href="Patient_Home_Page.jsp"><i class="fa fa-home"></i>Profile</a></li>
                <li class="active"><a href="Patient_Report_Page.jsp"><i class="fa fa-user"></i>Report</a></li>
                <li><a href="#"><i class="fa fa-user"></i>Request</a>
					<div class="Sub-Menu-1">
						<ul>
							<li><a href="Patient_Change_Location.jsp"><i class="fa fa-user-plus"></i>Change Location</a></li>
                                                        <li><a href="Patient_Change_Doctor_Page.jsp"><i class="fa fa-user-secret"></i>Change Doctor</a></li>
                                                        <li><a href="Patient_Appoint_Doctor_Page.jsp"><i class="fa fa-user-secret"></i>Appoint this Doctor</a></li>
                                                        <li><a href="Patient_Password_Change_Page.jsp"><i class="fa fa-user-secret"></i>Change Password</a></li>
						</ul>
					</div>
				</li>
                <li><a href="index.html"><i class="fa fa-users"></i>Logout</a></li>
            </ul>
        </div>
    
    
    
<%
    String email=(String)session.getAttribute("email");
    String name=null;
    String age=null;
    String location=null;
    String disease=null;
    String cpt=null;
    String rbp=null;
    String cholestrol=null;
    String peak=null;
    String risk=null;
    String d_name=null;
    System.out.print("Email : "+email);
    try {
        PreparedStatement ps=connection.prepareStatement("SELECT * FROM pd WHERE email=?");
        ps.setString(1,email);
        
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
             name=rs.getString("name");
             age= rs.getString("age");
             location=rs.getString("location");
             disease=rs.getString("disease");
             cpt=rs.getString("CPT");
             rbp=rs.getString("RBP");
             cholestrol=rs.getString("choles");
             peak=rs.getString("upsloping");
             risk=rs.getString("riskpercent");
             d_name=rs.getString("doctorname");
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
                    <h2 class="title">Report Details</h2>
                    <form method="POST" action="#">
                        <div class="input-group">
                            <label class="label">Name</label>
                            <label class="input--style-4"><%=name%></label>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <label class="input--style-4"><%=email%></label>
                                   
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Age</label>
                                    <label class="input--style-4"><%=age%></label>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="input-group">
                            <label class="label">Disease</label>
                            <label class="input--style-4"><%=disease%></label>
                        </div>
                        
                        <div class="input-group">
                            <label class="label">Doctor</label>
                            <label class="input--style-4"><%=d_name%></label>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">CPT</label>
                                    <label class="input--style-4"><%=cpt%></label>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">RBP</label>
                                    <label class="input--style-4"><%=rbp%></label>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Cholestrol</label>
                                    <label class="input--style-4"><%=cholestrol%></label>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Peak</label>
                                    <label class="input--style-4"><%=peak%></label>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="label">Risk Percentage</label>
                            <label class="input--style-4"><%=risk%> %</label>
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

</body>

</html>
<!-- end document-->