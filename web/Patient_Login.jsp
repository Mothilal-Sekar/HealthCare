<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient Login</title>
    </head>
    <body>
        <%
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            try {
                PreparedStatement ps1=connection.prepareStatement("select * from patient where email=? and password=?");
                ps1.setString(1,email);
                ps1.setString(2,password);
                ResultSet rs=ps1.executeQuery();
                if(rs.next()) {
            
                    String em=rs.getString("email");
                    session.setAttribute("email",em);
             
                    String loc=rs.getString("location");
                    session.setAttribute("location",loc);
                    
                    String dise=rs.getString("disease");
                    session.setAttribute("disease",dise);
                   
                    JOptionPane.showMessageDialog(null,"Login Sucess");
                    response.sendRedirect("Patient_Home_Page.jsp");
                }
                else {
                    JOptionPane.showMessageDialog(null,"Wrong Email or Password");
                    response.sendRedirect("Patient_Login_Page.jsp");
                }
                    
            }catch(Exception e)
            {
                out.print(e);
            }

        %>
    </body>
</html>
