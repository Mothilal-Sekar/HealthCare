<%-- 
    Document   : Patient_Appoint_Doctor
    Created on : 27 Apr, 2020, 9:27:40 PM
    Author     : MLDon_PC
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

<% 
String p_email=(String)session.getAttribute("p_email");
String p_name=(String)session.getAttribute("p_name");
String p_status=(String)session.getAttribute("p_status");
String p_disease=(String)session.getAttribute("disease");
String d_name=(String)session.getAttribute("d_name");
String d_email=(String)session.getAttribute("d_email");
String d_phone=(String)session.getAttribute("d_phone");
String d_age=(String)session.getAttribute("d_age");
String d_address=(String)session.getAttribute("d_address");
String a_date=request.getParameter("a_date");
String a_time=request.getParameter("a_time");
try {
    PreparedStatement ps1=connection.prepareStatement("select * from appointment where doctoremail=? and appointmentdate=? and appointmenttime=?");
    ps1.setString(1,d_email);
    ps1.setString(2,a_date);
    ps1.setString(3,a_time);
    ResultSet rs=ps1.executeQuery();
    
if(rs.next())
{
JOptionPane.showMessageDialog(null, "Doctor is Not Free \n At That Time");
response.sendRedirect("Patient_Home_Page.jsp");
}
else if(d_name.equals("null") || d_name.equals(""))
{
JOptionPane.showMessageDialog(null, "Choose Doctor First");
response.sendRedirect("Patient_Home_Page.jsp");
}
else
{ 
try {
    PreparedStatement ps=connection.prepareStatement("insert into appointment values(?,?,?,?,?,?,?,?,?,?,?,?)");
    ps.setString(1,p_name);
    ps.setString(2,p_email);
    ps.setString(3, d_name);
    ps.setString(4, d_email);
    ps.setString(5, d_phone);
    ps.setString(6, d_age);
    ps.setString(7, a_date);
    ps.setString(8, a_time);
    ps.setString(9, d_address);
    ps.setString(10, "Waiting");
    ps.setString(11, "NORMAL");
    ps.setString(12,p_disease);
    ps.executeUpdate();
    PreparedStatement ps2=connection.prepareStatement("UPDATE patient SET status=?,appointment=? WHERE email=?");
    ps2.setString(1, "NORMAL");
    ps2.setString(2, "");
    ps2.setString(3, p_email);
    ps2.executeUpdate();
    
    JOptionPane.showMessageDialog(null, "Regular Appointment \n Accepted");
    response.sendRedirect("Patient_Home_Page.jsp"); 
    } catch (Exception e) {
    }
}
} catch (Exception e) {
    }
%>
