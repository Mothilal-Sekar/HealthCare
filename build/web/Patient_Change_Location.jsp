<%-- 
    Document   : Patient_Location_Change
    Created on : 31 Mar, 2020, 3:13:20 PM
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
        <title>Patient Location Change</title>
    </head>
    <body>
        
        <%
    String email=(String)session.getAttribute("email");
    String n_location=request.getParameter("new_location");
    String disease=(String)session.getAttribute("disease");
    
    System.out.print("Email : "+email);
    try {
        PreparedStatement ps=connection.prepareStatement("UPDATE patient SET location=? WHERE email=?");
        ps.setString(1, n_location);
        ps.setString(2,email);
        ps.executeUpdate();
        
        
        
        
        if(disease.equals("Cardiovascular"))
                    {
                    PreparedStatement ps3=connection.prepareStatement("UPDATE cardio SET location=? WHERE email=?");
                    ps3.setString(1,n_location);
                    ps3.setString(2,email);
                    ps3.executeUpdate();
                    
                    }
                    
                    
                    if(disease.equals("Diabetics"))
                    {
                    PreparedStatement ps4=connection.prepareStatement("UPDATE diabetics SET location=? WHERE email=?");
                    ps4.setString(1,n_location);
                    ps4.setString(2,email);
                    ps4.executeUpdate();
                    
                    }
                    session.setAttribute("location",n_location);
                    JOptionPane.showMessageDialog(null, "Location Changed");
        response.sendRedirect("Patient_Change_Location_Page.jsp");
        
    }catch(Exception e)
    {
        out.print(e);    
    }      
        
%>
        
    </body>
</html>
