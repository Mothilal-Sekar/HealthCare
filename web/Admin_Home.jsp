<%-- 
    Document   : Admin_Home
    Created on : 31 Mar, 2020, 2:33:28 PM
    Author     : T C Balachanderan
--%>

<!DOCTYPE html>
<html>
	<head>

		<!-- Required meta tags-->
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    	<meta charset="UTF-8">
    	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    	<meta name="description" content="Colorlib Templates">
    	<meta name="author" content="Colorlib">
    	<meta name="keywords" content="Colorlib Templates">

    	<!-- Title Page-->
        <title>Admin Home Page</title>

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
				<li class="active"><a href="Admin_Home.jsp"><i class="fa fa-home"></i>Home</a></li>
				<li><a href="Admin_Patient_Page.jsp"><i class="fa fa-user"></i>Patient</a></li>
				<li><a href="Admin_Doctor_Page.jsp"><i class="fa fa-user-md" aria-hidden="true"></i>Doctor</a></li>
                                <li><a href="Admin_Patient_Emergency_Page.jsp"><i class="fa fa-heartbeat" aria-hidden="true"></i>Emergency</a></li>
				<li><a href="index.html"><i class="fa fa-sign-out" aria-hidden="true"></i>Logout</a></li>
            </ul>
		</div>



		<div class="page-wrapper bg-gra-02 p-t-130 p-b-100 font-poppins">
        	<div class="wrapper wrapper--w680">
            		<div class="card card-4">
                		<div class="card-body">
                    		<h2 class="title">Initiating IOT Devices</h2>
                    		<form method="POST" action="Admin_Patient_Login_IOT_Page.jsp">
                    		<h4>
                    			Clicking the proceed button you agree that providing IOT devices to the patient for monitoring and managing him/her healthcare.<br><br>
                    		</h4>
                            <button class="btn btn--radius-2 btn--blue" type="submit">Proceed</button>                        
                    		</form>
                            </div>
                	</div>
            	</div>
        	

    	<br><br><br><br>
        	<div class="wrapper wrapper--w680">
            		<div class="card card-4">
                		<div class="card-body">
                    		<h2 class="title">Start Tracking</h2>
                    		<form method="POST" action="Admin_Track_Page.jsp">
                    			<h4>
                    				Clicking the proceed button you agree that tracking the bio-medical data of patients.
                    				<br><br>
                    			</h4>
                            <button class="btn btn--radius-2 btn--blue" type="submit">Proceed</button>
                        </div>
                    		</form>
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