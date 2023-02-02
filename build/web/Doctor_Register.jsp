<%-- 
    Document   : Doctor_Register
    Created on : 27 Mar, 2020, 6:53:14 PM
    Author     : T C Balachanderan
--%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Random"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.naming.spi.DirStateFactory.Result"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.lang.String"%>
<%@include file="Connection.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Doctor Register</title>
    </head>
    <body>
        
        <%!
            int cal(String s){
            Calendar c = Calendar.getInstance();
            int current_year = c.get(Calendar.YEAR);
            int current_month = c.get(Calendar.MONTH) + 1;
            int current_date = c.get(Calendar.DATE);
            String[] spilt=s.split("/");
            int date=Integer.parseInt(spilt[0]);
            int month=Integer.parseInt(spilt[1]);
            int year=Integer.parseInt(spilt[2]);
            if(date<=current_date) {
                if(month<=current_month)
                    return current_year-year;
                else
                    return current_year-year-1;
            }
            else
                return current_year-year-1;
        }
        %>
        
        <%
            String doctor_password="";
            String pwd="ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&*";
            Random r=new Random();
            int length=8;
            char[] newPass=new char[length];
            for(int i=0;i<length;i++)
                newPass[i]=pwd.charAt(r.nextInt(pwd.length()));
            for(int i=0;i<newPass.length;i++)
                doctor_password += newPass[i];
            String doctor_name=request.getParameter("doctor_name");
            String doctor_dob=request.getParameter("birthday");
            int doctor_age=cal(doctor_dob);
            String doctor_gender=request.getParameter("doctor_gender");
            String doctor_email=request.getParameter("doctor_email");
            String doctor_phone=request.getParameter("doctor_phone");
            String doctor_location=request.getParameter("doctor_location");
            String Specialization=request.getParameter("Specialization");
            String doctor_hosp_address=request.getParameter("h_address");

            try{
                PreparedStatement psl=connection.prepareStatement("select * from doctor where email=?");
                psl.setString(1,doctor_email);
                ResultSet rs=psl.executeQuery();
    
                 if(rs.next())
                {
                    JOptionPane.showMessageDialog(null,"Email Already Exist");
                    response.sendRedirect("Doctor_Registration_Page.jsp");
                }
                else
                {
                    PreparedStatement ps=connection.prepareStatement("insert into doctor values(?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1,doctor_name);
                    ps.setString(2,doctor_email);
                    ps.setInt(3,doctor_age);
                    ps.setString(4,doctor_gender);
                    ps.setString(5,doctor_phone);
                    ps.setString(6,doctor_password);
                    ps.setString(7,Specialization);
                    ps.setString(8,doctor_location);
                    ps.setString(9,doctor_hosp_address);
                    ps.setString(10,doctor_dob);

                    int a=ps.executeUpdate();
                     JOptionPane.showMessageDialog(null,"Registration Success!!!\nYour Password : "+doctor_password);
                    response.sendRedirect("Doctor_Login_Page.jsp");

                }
            }catch(Exception e) {
                out.print(e);
            }

        %>
        
    </body>
</html>
