<%-- 
    Document   : Doctor_Login
    Created on : 28 Mar, 2020, 7:46:50 AM
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
        <title>Doctor Login</title>
    </head>
    <body>
        
        <%
            String d_email=request.getParameter("email");
            String d_password=request.getParameter("password");
            try {
                PreparedStatement ps1=connection.prepareStatement("select * from doctor where email=? and password=?");
                ps1.setString(1,d_email);
                ps1.setString(2,d_password);
                ResultSet rs=ps1.executeQuery();
                if(rs.next()) {
                    session.setAttribute("email",d_email);                    
                    JOptionPane.showMessageDialog(null,"Login Success");
                    response.sendRedirect("Doctor_Home_Page.jsp");
                }
                else {
                    JOptionPane.showMessageDialog(null,"Wrong password or username");
                    response.sendRedirect("Doctor_Login_Page.jsp");
                }
                    
            }catch(Exception e) {
                out.print(e);
            }

        %>
        
    </body>
</html>
