<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.lang.String"%>
<%@include file="Connection.jsp" %>


<html>
    <head>
        <title> Patient Register </title>
        
         <link rel="stylesheet" href="css/blurt.min.css">
         <script src="js/blurt.min.js"></script>
        <script src="js/popup.js"></script>
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
        
        <%!
            int cal(String s){
            Calendar c = Calendar.getInstance();
            int current_year = c.get(Calendar.YEAR);
            int current_month = c.get(Calendar.MONTH) + 1;
            int current_date = c.get(Calendar.DATE);
            String[] spilt=s.split("/");
            int date=Integer.parseInt(spilt[0]);
            int month=Integer.parseInt(spilt[1]);
            int year=Integer.parseInt(spilt[2]);
            if(date<=current_date) {
                if(month<=current_month)
                    return current_year-year;
                else
                    return current_year-year-1;
            }
            else
                return current_year-year-1;
        }
        %>


        <%  
            String password="";
            String pwd="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
            Random r=new Random();
            int length=8;
            char[] newPass=new char[length];
            for(int i=0;i<length;i++)
                newPass[i]=pwd.charAt(r.nextInt(pwd.length()));
            for(int i=0;i<newPass.length;i++)
                password += newPass[i];
            String name=request.getParameter("name");
            String dob=request.getParameter("birthday");
            String gender=request.getParameter("gender");
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            int age=cal(dob);
            String location=request.getParameter("location");
            String guardian_name=request.getParameter("Guardian_name");
            String disease=request.getParameter("Disease");
            String description=request.getParameter("Disease_Description");
            String address=request.getParameter("address");
            String doctor=null;
            
            
            
            try {
                PreparedStatement p=connection.prepareStatement("select * from patient where email=?");
                p.setString(1,email);
                ResultSet rs=p.executeQuery();
                
    
                if(rs.next())
                {
                    JOptionPane.showMessageDialog(null,"Account already exist" );
                    response.sendRedirect("Patient_Registration_Page.jsp");
                }
                else
                {
                   
                    PreparedStatement ps=connection.prepareStatement("insert into patient(name,email,location,password,disease,age,gender,dob,phonenumber,diseasedescription,guardianname,status,address) values(?,?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1,name);
                    ps.setString(2,email);
                    ps.setString(3,location);
                    ps.setString(4,password);
                    ps.setString(5,disease);
                    ps.setInt(6,age);
                    ps.setString(7,gender);
                    ps.setString(8,dob);
                    ps.setString(9,phone);
                    ps.setString(10,description);
                    ps.setString(11,guardian_name);
                    ps.setString(12,"NORMAL");
                    ps.setString(13,address);
                    ps.executeUpdate();
            
                    String status="NORMAL";
                    if(disease.equals("Cardiovascular"))
                    {
                    PreparedStatement ps1=connection.prepareStatement("insert into cardio(name,email,age,disease,location,status) values(?,?,?,?,?,?)");
                    ps1.setString(1,name);
                    ps1.setString(2,email);
                    ps1.setInt(3,age);
                    ps1.setString(4,disease);
                    ps1.setString(5,location);
                    ps1.setString(6,status);
                    ps1.executeUpdate();
                    }
                    
                    if(disease.equals("Diabetics"))
                    {
                    PreparedStatement ps2=connection.prepareStatement("insert into diabetics(name,email,age,disease,location,status) values(?,?,?,?,?,?)");
                    ps2.setString(1,name);
                    ps2.setString(2,email);
                    ps2.setInt(3,age);
                    ps2.setString(4,disease);
                    ps2.setString(5,location);
                    ps2.setString(6,status);
                    ps2.executeUpdate();
                    }
               
                    JOptionPane.showMessageDialog(null,"Your Password : "+password );
                    JOptionPane.showMessageDialog(null,"Account Sucessfully Created");
                    response.sendRedirect("Patient_Login_Page.jsp");
                }
            }catch(Exception e){
                out.print(e);
                JOptionPane.showMessageDialog(null,e);
            }
        %>
    </body>
</html>