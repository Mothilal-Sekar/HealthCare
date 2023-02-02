<%-- 
    Document   : Cardio_Patient
    Created on : 25 Apr, 2020, 8:41:17 PM
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
                <li><a href="Patient_Home_Page.jsp"><i class="fa fa-address-book"></i>Profile</a></li>
                <li class="active"><a href="Cardio_Patient.jsp"><i class="fa fa-address-card"></i>Report</a></li>
                <li><a href="Patient_Appoint_Doctor_Page.jsp"><i class="fa fa-plus-square"></i>Appointment</a></li>
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
            <li><a href="index.html"><i class="fa fa-sign-out"></i>Logout &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></li>
            </ul>
        </div>
    
    
    
<%
    String c_email=(String)session.getAttribute("email");
    String c_name=null;
    String c_age=null;
    String c_doctorname=null;
    String c_location=(String)session.getAttribute("location");
    String c_disease=(String)session.getAttribute("disease");
    float c_bodytemp=0;
    int c_pulse=0;
    int c_systolic=0;
    int c_diastolic=0;
    String c_bp=null;
    String c_cholestrol=null;
    int c_cholestrolvalue=0;    
    String c_glucose=null;
    int c_glucosevalue=0;
    
    System.out.print("Email : "+c_email);
    try {
        PreparedStatement ps=connection.prepareStatement("SELECT * FROM cardio WHERE email=?");
        ps.setString(1,c_email);
        
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
             c_name=rs.getString("name");
             c_age= rs.getString("age");
             
             c_doctorname=rs.getString("doctorname");
             c_bodytemp=(float)rs.getFloat("bodytemp");
             c_pulse=rs.getInt("pulse");
             c_systolic=rs.getInt("systolic");
             c_diastolic=rs.getInt("diastolic");
             c_bp=rs.getString("bp");
             c_cholestrol=rs.getString("cholesterol");
             c_cholestrolvalue=rs.getInt("cholesterolvalue");
             c_glucose=rs.getString("glucose");
             c_glucosevalue=rs.getInt("glucosevalue");     
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
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">name</label>
                                    <label class="input--style-4"><%=c_name%></label>
                                   
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <label class="input--style-4"><%=c_email%></label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Age</label>
                                    <label class="input--style-4"><%=c_age%></label>
                                   
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Disease</label>
                                    <label class="input--style-4"><%=c_disease%></label>
                                    
                                </div>
                            </div>
                        </div>

                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Location</label>
                                    <label class="input--style-4"><%=c_location%></label>
                                   
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Doctor Name</label>
                                    <label class="input--style-4"><%=c_doctorname%></label>
                                    
                                </div>
                            </div>
                        </div>
                                    
                       
                        <div class="input-group">
                            <label class="label">Pulse</label>
                            <label class="input--style-4"><%=c_pulse%></label>
                        </div>
                            
                        <div class="row row-space">
                            <div class="col-2"> 
                        <div class="input-group">
                            <label class="label">Body Temperature</label>
                            <label class="input--style-4"><%=c_bodytemp%></label>
                        </div>
                                    
                       <div class="input-group">
                            <label class="label">BP</label>
                            <label class="input--style-4"><%=c_bp%></label>
                        </div>
                        </div> 
                        </div> 
           
                                    
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Systolic</label>
                                    <label class="input--style-4"><%=c_systolic%></label>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Diastolic</label>
                                    <label class="input--style-4"><%=c_diastolic%></label>
                                    
                                </div>
                            </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Cholestrol</label>
                                    <label class="input--style-4"><%=c_cholestrol%></label>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Cholestrol Value</label>
                                    <label class="input--style-4"><%=c_cholestrolvalue%></label>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Glucose</label>
                                    <label class="input--style-4"><%=c_glucose%></label>
                                    
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Glucose Value</label>
                                    <label class="input--style-4"><%=c_glucosevalue%></label>
                                    
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

</body>

</html>
<!-- end document-->