<%-- 
    Document   : Patient_Doctor_Change
    Created on : 31 Mar, 2020, 11:05:35 AM
    Author     : T C Balachanderan
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

<%
    String email=(String)session.getAttribute("email");
    String disease=(String)session.getAttribute("disease");
    String doctor=request.getParameter("doctor");
    try{
    PreparedStatement ps=connection.prepareStatement("update patient set doctor=? where email=?");
    ps.setString(1,doctor);
    ps.setString(2,email);
    ps.executeUpdate();
    
    
                    if(disease.equals("Cardiovascular"))
                    {
                    PreparedStatement ps3=connection.prepareStatement("update cardio set doctorname=? where email=?");
                    ps3.setString(1,doctor);
                    ps3.setString(2,email);
                    ps3.executeUpdate();
                    
                    }
                    
                    
                    if(disease.equals("Diabetics"))
                    {
                    PreparedStatement ps4=connection.prepareStatement("update diabetics set doctorname=? where email=?");
                    ps4.setString(1,doctor);
                    ps4.setString(2,email);
                    ps4.executeUpdate();
                    
                    }
    
                    JOptionPane.showMessageDialog(null,"Doctor Selected sucessfully");
                    response.sendRedirect("Patient_Change_Doctor_Page.jsp");
    }
    catch(Exception e){
        JOptionPane.showMessageDialog(null,e);
    }
%>
