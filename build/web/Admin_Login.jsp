<%-- 
    Document   : Admin_Login
    Created on : 28 Mar, 2020, 8:54:43 AM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login</title>
    </head>
    <body>  
        
        <%
            String aa=request.getParameter("admin_id");
            String bb=request.getParameter("password");
            if(aa.equals("admin") && bb.equals("admin")) {
                JOptionPane.showMessageDialog(null,"ADMIN \n Login Sucess!!!");
                response.sendRedirect("Admin_Home.jsp");
            }
            else if(aa.equals("ambulance@chennai") && bb.equals("driver@chennai")) {
                String ch="Chennai";
                    session.setAttribute("location",ch);
                JOptionPane.showMessageDialog(null,"CHENNAI AMBULANCE \n Login Sucess!!!");                    
                response.sendRedirect("Ambulance.jsp");
            }
            else if(aa.equals("ambulance@coimbatore") && bb.equals("driver@coimbatore")) {
                String co="Coimbatore";
                    session.setAttribute("location",co);
                JOptionPane.showMessageDialog(null,"COIMBATORE AMBULANCE \n Login Sucess!!!");
                response.sendRedirect("Ambulance.jsp");
            }
            else if(aa.equals("ambulance@madurai") && bb.equals("driver@madurai")) {
                String ma="Madurai";
                    session.setAttribute("location",ma);
                JOptionPane.showMessageDialog(null,"MADURAI AMBULANCE \n Login Sucess!!!");
                response.sendRedirect("Ambulance.jsp");
            }
            else if(aa.equals("ambulance@trichi") && bb.equals("driver@trichi")) {
                String tr="Trichi";
                    session.setAttribute("location",tr);
                JOptionPane.showMessageDialog(null,"TRICHI AMBULANCE \n Login Sucess!!!");
                response.sendRedirect("Ambulance.jsp");
            }
            else if(aa.equals("ambulance@vellore") && bb.equals("driver@vellore")) {
                String vl="Vellore";
                    session.setAttribute("location",vl);
                JOptionPane.showMessageDialog(null,"VELLORE AMBULANCE \n Login Sucess!!!");
                response.sendRedirect("Ambulance.jsp");
            }
            else {
                JOptionPane.showMessageDialog(null,"wrong user or password");
                response.sendRedirect("Admin_Login_Page.jsp");
            }
        %>
    
    </body>
</html>
