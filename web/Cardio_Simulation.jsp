<%-- 
    Document   : Cardio_Simulation
    Created on : 26 Apr, 2020, 2:59:50 PM
    Author     : T C Balachanderan
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            String email=(String)session.getAttribute("email");
            Random r=new Random();
            
            
            //Variable declaration for simulation
            String BP=null;
            int systolic=0;
            int Diastolic=0;
            int Choles_Value=0;
            String Cholesterol=null;
            int Glucose_Value=0;
            String Glucose;
            int i=1;
            int pulse=0;
            float bodytemp=0;
            
            out.println("<h1>Simulating Medial Data's</h1>");
            while(i<=10) {
            //Simulation of Blood pressure
            systolic=r.nextInt(190-70)+70;  //Random generation between 70 - 190
            Diastolic=r.nextInt(100-40)+40; //Random generation between 40 - 100
            if( (systolic>=70) && (Diastolic>=40) ) {
                BP="LOW";
                if( (systolic>=90) && (Diastolic>=60) ) {
                    BP="IDEAL";
                    if( (systolic>=120) && (Diastolic>=80) ) {
                        BP="PREHIGH";
                        if( (systolic>=140) && (Diastolic>=90) ) {
                            BP="HIGH";
                        }
                    }
                }
            }
            
            
            //Simulation of Cholesterol
            Choles_Value = r.nextInt(300);
            if(Choles_Value<200)
                Cholesterol="NORMAL";
            else if(Choles_Value<=239)
                Cholesterol="BORDER";
            else
                Cholesterol="HIGH";
            

            //Simulation of Glucose
            Glucose_Value = r.nextInt(120-20)+20;
            if(Glucose_Value<70)
                Glucose="LOW";
            else if(Glucose_Value<=99)
                Glucose="NORMAL";
            else
                Glucose="HIGH";
            
            if( BP.equals("HIGH") || Cholesterol.equals("HIGH") ) {
                if(r.nextBoolean()) {
                    bodytemp=(float) ((r.nextInt(1105-1050)+1050)/10.0);
                    pulse =(r.nextInt(90-83)+83);
                }else {
                    bodytemp=(float) ((r.nextInt(900-850)+850)/10.0);
                    pulse =(r.nextInt(60-55)+55);
                }
            }
            else {
                bodytemp=(float) ((r.nextInt(1040-960)+960)/10.0);      //96-104
                pulse =(r.nextInt(75-66)+66);
            }
            
            try {
                PreparedStatement ps=connection.prepareStatement("UPDATE cardio SET systolic=?, diastolic=?, bp=?, cholesterol=?, cholesterolvalue=?, glucose=?, glucosevalue=?, bodytemp=?, pulse=? WHERE email=?");
                ps.setInt(1,systolic);
                ps.setInt(2,Diastolic);
                ps.setString(3,BP);
                ps.setString(4,Cholesterol);
                ps.setInt(5,Choles_Value);
                ps.setString(6,Glucose);
                ps.setInt(7,Glucose_Value);
                ps.setFloat(8,bodytemp);
                ps.setInt(9,pulse);
                ps.setString(10,email);
                ps.executeUpdate();
            }catch(Exception e) {
                System.out.println(e);
                JOptionPane.showMessageDialog(null,e);
            }
      
            out.println("<h2>"+i+" Data Updated in cloud...........<br><br>");
            i++;
            Thread.sleep(10*1000);
            }
            JOptionPane.showMessageDialog(null,"ALL Data are Updated IN Cloud");
            response.sendRedirect("Admin_Home.jsp");
        %>    
           
    </body>
</html>
