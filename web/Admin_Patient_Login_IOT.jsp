<%-- 
    Document   : Admin_Patient_Login_IOT
    Created on : 26 Apr, 2020, 2:28:00 PM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Login for IOT</title>
    </head>
    <body>
        
        <%
           String Admin_pass=request.getParameter("a_password");
            String email=request.getParameter("email");
            String disease=null;
    try {
        PreparedStatement ps=connection.prepareStatement("SELECT disease FROM patient WHERE email=?");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        
        if(rs.next()) {
            disease=rs.getString("disease");
            if(Admin_pass.equals("admin@123")) {
                if(disease.equals("Cardiovascular")) {
                    JOptionPane.showMessageDialog(null,"IOT Simulation Started...!!!");
                    session.setAttribute("email",email);
                    response.sendRedirect("Cardio_Simulation.jsp");
                }
                else if(disease.equals("Diabetics")) {
                    JOptionPane.showMessageDialog(null,"IOT Simulation Started...!!!");
                    session.setAttribute("email",email);
                    session.setAttribute("value",0);
                    response.sendRedirect("Diabetics_Simulation.jsp");
                }
                else {
                    JOptionPane.showMessageDialog(null,"No IOT Simulation for "+disease);
                    response.sendRedirect("Admin_Patient_Login_IOT_Page.jsp");
                }
            }
            else {
                JOptionPane.showMessageDialog(null,"Password Wrong");
                response.sendRedirect("Admin_Track_Page.jsp");
            }
        }
        else {
            JOptionPane.showMessageDialog(null,"Select Mail ID");
        }
    }
    catch(Exception e) {
        System.out.println(e);
        out.print(e);
    }     
         %>
        
    </body>
</html>
