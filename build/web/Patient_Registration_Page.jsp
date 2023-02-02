<%-- 
    Document   : Patient_Registration_Page
    Created on : 26 Mar, 2020, 8:24:35 PM
    Author     : T C Balachanderan
--%>

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
    <title>Patient Registration from</title>

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
    
    <link rel="stylesheet" href="css/blurt.min.css">
<script src="js/blurt.min.js"></script>
    <link rel="stylesheet" href="css/dialog.css">
<script src="js/dialog.js"></script>
</head>

<body>
    <div id="dialogoverlay"></div>
<div id="dialogbox">
  <div>
    <div id="dialogboxhead"></div>
    <div id="dialogboxbody"></div>
    <div id="dialogboxfoot"></div>
  </div>
</div>
    
    <div class="Menu-Bar">
			<ul>
				<li><a href="index.html"><i class="fa fa-home"></i>Home</a></li>
				<li class="active"><a href="#"><i class="fa fa-user"></i>Patient</a>
					<div class="Sub-Menu-1">
						<ul>
							<li><a href="Patient_Registration_Page.jsp">Register</a></li>
							<li><a href="Patient_Login_Page.jsp">Login</a></li>
						</ul>
					</div>
				</li>
				<li><a href="#"><i class="fa fa-user-plus"></i>Doctor</a>
					<div class="Sub-Menu-1">
						<ul>
							<li><a href="Doctor_Registration_Page.jsp">Register</a></li>
							<li><a href="Doctor_Login_Page.jsp">Login</a></li>
						</ul>
					</div>
				</li>
				<li><a href="Admin_Login_Page.jsp"><i class="fa fa-user-secret"></i>Admin</a></li>
				<li><a href="About_Us.html"><i class="fa fa-users"></i>About Us</a></li>
			</ul>
		</div>
    
    
    <div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        <div class="wrapper wrapper--w680">
            <div class="card card-4">
                <div class="card-body">
                    <h2 class="title">Patient Registration Form</h2>
                    <form method="POST" action="Patient_Register.jsp">
                        <div class="input-group">
                            <label class="label">Name</label>
                            <input class="input--style-4" type="text" name="name" required="">
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">DOB</label>
                                    <div class="input-group-icon">
                                        <input class="input--style-4 js-datepicker" type="text" name="birthday" required="">
                                        <i class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group" >
                                    <label class="label">Gender</label>
                                    <div class="p-t-10" >
                                        <label class="radio-container m-r-45">Male
                                            <input type="radio" name="gender" value="Male" required="" title="Choose Any GENDER">
                                            <span class="checkmark"></span>
                                        </label>
                                        <label class="radio-container">Female
                                            <input type="radio" name="gender" value="Female">
                                            <span class="checkmark"></span>
                                        </label>
                                        <br><br>
                                        <label class="radio-container">Others
                                            <input type="radio" name="gender" value="Others">
                                            <span class="checkmark"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Email</label>
                                    <input class="input--style-4" type="email" name="email" required="">
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Phone Number</label>
                                    <input class="input--style-4" type="text" name="phone" required="" pattern="{1-9}" minlength="10" maxlength="10" size="10">
                                </div>
                            </div>
                        </div>
                        
                        <div class="row row-space">
                            <div class="col-2">
                                <div class="input-group">
                                    <label class="label">Location</label>
                                    <div class="rs-select2 js-select-simple select--no-search">
                                <div class="select-dropdown">
                                    <select name="location" required="">
                                        <option disabled="disabled" selected="selected" value="">Choose a location</option>
                                        <option>Chennai</option>
                                        <option>Coimbatore</option>
                                        <option>Madurai</option>
                                        <option>Trichi</option>
                                        <option>Vellore</option>
                                </select>
                                </div>
                            </div>
                                </div>
                            </div>
                            <div class="col-2">
                                <div class="input-group">
                            <label class="label">Guardian name</label>
                            <input class="input--style-4" type="text" name="Guardian_name" required="">
                        </div>
                            </div>
                        </div>
                        
                        <div class="input-group">
                            <label class="label">Address</label>
                            <input class="input--style-4" type="text" name="address" required="">
                        </div>
                         
                        
                        <div class="input-group">
                            <label class="label">Disease</label>
                            <div class="rs-select2 js-select-simple select--no-search">
                                <select name="Disease" required="">
                                    <option disabled="disabled" selected="selected"  value="">Choose option</option>
                                    <option value="Cardiovascular">Cardiovascular</option>                                    
                                    <option value="Diabetics">Diabetics</option>
                                    
                                </select>
                                <div class="select-dropdown"></div>
                            </div>
                        </div>
                        <div class="input-group">
                            <label class="label">Disease Description</label>
                            <textarea name="Disease_Description" required="" placeholder="minimum 20 characters" minlength="20"  class="input--style-4"></textarea>
                        </div>
                        <div class="p-t-15">
                            <button class="btn btn--radius-2 btn--blue" type="submit">Submit</button>
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