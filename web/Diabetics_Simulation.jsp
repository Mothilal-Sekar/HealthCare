<%-- 
    Document   : Diabetics_Simulation
    Created on : 28 Apr, 2020, 9:06:50 AM
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
        <title>Diabetics Simulation</title>
    </head>
    <body>
        <h1 style="align:center;">Diabetics Simulation</h1><br><br><br>
        
        <%
            String email=(String)session.getAttribute("email");
            int value=(int)session.getAttribute("value");
            Random r=new Random();
            
            String BP=null;
            int systolic=0;
            int Diastolic=0;
            String A1c=null;
            int A1c_value=0;
            String OGT=null;
            int OGT_value=0;
            String FPG=null;
            int FPG_value=0;
            int i=1;
            int pulse=0;
            float bodytemp=0;
            
            //Simulation of Blood pressure
            while(i<=10) {
            systolic=r.nextInt(190-70)+70;  //Random generation between 70 - 190
            Diastolic=r.nextInt(140-40)+40; //Random generation between 40 - 100
            if(systolic<120 && Diastolic<80)
                BP="NORMAL";
            else if(systolic<=129 && Diastolic<80)
                BP="IDEAL";
            else if(systolic<=139 || Diastolic<=89) {
                BP="HIGH STAGE 1";
                if(systolic>139 && systolic<=180)
                    BP="HIGH STAGE 2";
                else if(systolic>180)
                    BP="HIGH";
                if(Diastolic>89 && Diastolic<=120)
                    BP="HIGH STAGE 2";
                else if(Diastolic>120)
                    BP="HIGH";
            }
            else if(systolic<180 || Diastolic<120) {
                BP="HIGH STAGE 2";
                if(systolic>=180)
                    BP="HIGH";
                if(Diastolic>=120)
                    BP="HIGH";
            }
            else
                BP="HIGH";
            

            //Simulation of A1c
            A1c_value=r.nextInt(100);
            if(A1c_value<56)
                A1c="HEALTHY";
            else if(A1c_value<=64)
                A1c="PREDIABETICS";
            else
                A1c="T2DIADETICS";
            

            //Simulation of OGT     unit ---> mg/dl
            OGT_value=r.nextInt(220-70)+70;
            if(OGT_value<=139)
                OGT="HEALTHY";
            else if(OGT_value<=199)
                OGT="PREDIABETICS";
            else
                OGT="T2DIABETICS";
            

            //Simulation of FPG    unit ---> mg/dl
            FPG_value=r.nextInt(150-50)+50;
            if(FPG_value<=99)
                FPG="HEALTHY";
            else if(FPG_value<=126)
                FPG="PREDIABETICS";
            else
                FPG="T2DIABETICS";
            
            
            
            if((A1c.equals("T2DIABETICS") && FPG.equals("T2DIABETICS")) || BP.equals("HIGH") ) {
                if(r.nextBoolean()) {
                    bodytemp=(float) ((r.nextInt(1105-1050)+1050)/10.0);
                    pulse =(r.nextInt(90-83)+83);
                }else {
                    bodytemp=(float) ((r.nextInt(900-850)+850)/10.0);
                    pulse =(r.nextInt(60-55)+55);
                }
            }
            else{
                bodytemp=(float) ((r.nextInt(1040-960)+960)/10.0);      //96-104
                pulse =(r.nextInt(75-66)+66);
            }
            
            try {
                PreparedStatement ps=connection.prepareStatement("UPDATE diabetics SET systolic=?, diastolic=?, bp=?, A1c=?, A1cstatus=?, OGT=?, OGTstatus=?, FPG=?, FPGstatus=?, bodytemp=?, pulse=? WHERE email=?");
                ps.setInt(1,systolic);
                ps.setInt(2,Diastolic);
                ps.setString(3,BP);
                ps.setInt(4,A1c_value);
                ps.setString(5,A1c);
                ps.setInt(6,OGT_value);
                ps.setString(7,OGT);
                ps.setInt(8,FPG_value);
                ps.setString(9,FPG);
                ps.setFloat(10,bodytemp);
                ps.setInt(11,pulse);
                ps.setString(12,email);
                ps.executeUpdate();
            }catch(Exception e) {
                System.out.println("Exception : "+e);
                out.println("Exception : "+e);
                JOptionPane.showMessageDialog(null,"Exception : "+e);
            }
            
            value++;
            Thread.sleep(10*1000);
            session.setAttribute("email",email);
            session.setAttribute("value",value);
            }
            JOptionPane.showMessageDialog(null,value+" set of Sensed Data Uploaded in Cloud");
            response.sendRedirect("Diabetics_Simulation.jsp");
        %>
        
    </body>
</html>
