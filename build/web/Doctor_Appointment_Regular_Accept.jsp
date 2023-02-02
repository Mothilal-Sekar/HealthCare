<%-- 
    Document   : Doctor_Appointment_Regular_Accept
    Created on : 30 Apr, 2020, 3:51:13 PM
    Author     : MLDon_PC
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

        <% String p_email=request.getParameter("pemail");
            String ap_date=request.getParameter("apdate");
            String ap_time=request.getParameter("aptime");
            String d_email=(String)session.getAttribute("d_email");

try {
    PreparedStatement ps=connection.prepareStatement("select * from appointment where doctoremail=? and appointmentdate=? and appointmenttime=? and appointmentstatus=?");
    ps.setString(1,d_email);
    ps.setString(2,ap_date);
    ps.setString(3,ap_time);
    ps.setString(4,"Accepted");
    ResultSet rs=ps.executeQuery();
    
    if(rs.next())
    {
    JOptionPane.showMessageDialog(null, "Already Appoint this Slot \n for Another Patient");
    response.sendRedirect("Doctor_Appointment_Regular.jsp"); 
    }
    else
    {
    PreparedStatement ps1=connection.prepareStatement("UPDATE appointment SET appointmentstatus=? WHERE patientemail=? and appointmentdate=? and appointmenttime=?");
    ps1.setString(1,"Accepted");
    ps1.setString(2, p_email);
    ps1.setString(3, ap_date);
    ps1.setString(4, ap_time);
    ps1.executeUpdate();       
        
    JOptionPane.showMessageDialog(null, "Regular Appointment \n Accepted");
    response.sendRedirect("Doctor_Appointment_Regular.jsp"); 
    }
    
    } catch (Exception e) {
    out.print(e);
    }
            
        
        
        %>
        
        
   