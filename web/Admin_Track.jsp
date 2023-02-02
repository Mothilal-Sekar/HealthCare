<%-- 
    Document   : Admin_Track
    Created on : 26 Apr, 2020, 8:04:50 PM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>


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
                    JOptionPane.showMessageDialog(null,"Data Tracking Started");
                    session.setAttribute("email",email);
                    response.sendRedirect("Cardio_Track.jsp");
                }
                else if(disease.equals("Diabetics")) {
                    JOptionPane.showMessageDialog(null,"Data Tracking Started");
                    session.setAttribute("email",email);
                    response.sendRedirect("Diabetics_Track.jsp");
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