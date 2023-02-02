<%-- 
    Document   : Patient_Edit
    Created on : 28 Apr, 2020, 7:19:16 PM
    Author     : MLDon_PC
--%>



<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.swing.JOptionPane"%>
<%@include file="Connection.jsp" %>
<html>
    <head>
        <title> Patient Edit </title>
        
         <link rel="stylesheet" href="css/blurt.min.css">
         <script src="js/blurt.min.js"></script>
        <script src="js/popup.js"></script>
        <link rel="stylesheet" href="css/dialog.css">
<script src="js/dialog.js"></script>

            </head>
    <body>
        
        <%  
            
            String o_disease=(String)session.getAttribute("disease");
            String o_email=(String)session.getAttribute("o_email");
            String o_name=(String)session.getAttribute("o_name");
            
            String name=request.getParameter("name");
            String dob=request.getParameter("birthday");            
            String email=request.getParameter("email");
            String phone=request.getParameter("phone");
            String age=request.getParameter("age");            
            String guardian_name=request.getParameter("Guardian_name");            
            String address=request.getParameter("address");
            
            
            
            
            try {
                
                
                    PreparedStatement ps=connection.prepareStatement("UPDATE patient SET name=?,email=?,age=?,dob=?,phonenumber=?,guardianname=?,address=? WHERE email=?");
                    ps.setString(1, name);
                    ps.setString(2,email);                    
                    ps.setString(3,age);
                    ps.setString(4,dob);                    
                    ps.setString(5,phone);                    
                    ps.setString(6,guardian_name);
                    ps.setString(7,address);  
                    ps.setString(8, o_email);
                    ps.executeUpdate();
                    

                    
                    PreparedStatement ps3=connection.prepareStatement("UPDATE appointment SET patientname=?,patientemail=? WHERE patientemail=?");
                    ps3.setString(1,name);
                    ps3.setString(2,email);
                    ps3.setString(3,o_email);
                    ps3.executeUpdate();
                
                
                    if(o_disease.equals("Cardiovascular"))
                    {
                    PreparedStatement ps1=connection.prepareStatement("UPDATE cardio SET name=?,email=?,age=? WHERE email=? ");
                    ps1.setString(1,name);
                    ps1.setString(2,email);
                    ps1.setString(3,age);
                    ps1.setString(4, o_email);
                    ps1.executeUpdate();
                    
                    }
                    
                    
                    if(o_disease.equals("Diabetics"))
                    {
                    PreparedStatement ps2=connection.prepareStatement("UPDATE diabetics SET name=?,email=?,age=? WHERE email=?");
                    ps2.setString(1,name);
                    ps2.setString(2,email);
                    ps2.setString(3,age);
                    ps2.setString(4,o_email);                    
                    ps2.executeUpdate();
                    
                    }
                    JOptionPane.showMessageDialog(null, "new Name set as "+name+"\n Email set as "+email);
                response.sendRedirect("Patient_Edit_Page.jsp");
                                    
        %>
                        
        <%
            
            }catch(Exception e){
                out.print(e);
            }
            
        %>
    </body>
</html>
