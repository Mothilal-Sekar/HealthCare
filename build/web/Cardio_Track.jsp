<%-- 
    Document   : Cardio_Track
    Created on : 26 Apr, 2020, 8:18:12 PM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@include file="Connection.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cardio Tracking</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        
        <%
            String email=(String)session.getAttribute("email");
            int pulse=0;
            float bodytemp=0;
            try {
                PreparedStatement ps=connection.prepareStatement("SELECT * FROM cardio WHERE email=?");
                ps.setString(1,email);
                ResultSet rs=ps.executeQuery();
                while(rs.next()) {
                    pulse=rs.getInt("pulse");
                    bodytemp=(float) rs.getFloat("bodytemp");
                }
                if( (pulse>=83 || pulse<=60) || (bodytemp<=90.0 || bodytemp>=105.0) ) {
			System.out.print("Status : Emergency");
                        String table[]=new String[2];   table[0]="cardio";  table[1]="patient";
                        for(int i=0;i<2;i++) {                            
                            PreparedStatement ps1=connection.prepareStatement("UPDATE "+table[i]+" SET status=? WHERE email=?");
                            ps1.setString(1,"EMERGENCY");
                            ps1.setString(2,email);
                            ps1.executeUpdate();
                        }
                        JOptionPane.showMessageDialog(null,"Emergency");
                        Thread.sleep(10*1000);
                        session.setAttribute("email",email);
                        response.sendRedirect("Cardio_Track.jsp");
                    }
                    else {
                        System.out.print("Status : NORMAL");
                        String table[]=new String[2];   table[0]="cardio";  table[1]="patient";
                        for(int i=0;i<2;i++) {
                            PreparedStatement ps2=connection.prepareStatement("UPDATE "+table[i]+" SET status=? WHERE email=?");
                            ps2.setString(1,"NORMAL");
                            ps2.setString(2,email);
                            ps2.executeUpdate();
                        }
                        Thread.sleep(10*1000);
                        session.setAttribute("email",email);
                        response.sendRedirect("Cardio_Track.jsp");
                    }
            }catch(Exception e) {
                System.out.println("Exception in Cardio Track : "+e);
                out.println(e);
            }
        %>
        
        
    </body>
</html>
