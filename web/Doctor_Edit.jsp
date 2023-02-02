<%-- 
    Document   : Doctor_Edit
    Created on : 28 Apr, 2020, 9:32:26 PM
    Author     : MLDon_PC
--%>

<%@page import="java.util.Calendar"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@include file="Connection.jsp" %>

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
    String o_email=(String)session.getAttribute("email");
    String o_name=(String)session.getAttribute("name");   
    String disease=(String)session.getAttribute("Specalization");


            String doctor_name=request.getParameter("doctor_name");
            String doctor_dob=request.getParameter("birthday");
            int doctor_age=cal(doctor_dob);
            String doctor_email=request.getParameter("doctor_email");
            String doctor_phone=request.getParameter("doctor_phone");            
            String doctor_hosp_address=request.getParameter("h_address");
            

            try {
                    
                    PreparedStatement ps=connection.prepareStatement("UPDATE doctor SET doctorname=?,email=?,age=?,phonenumber=?,address=?, dob=? WHERE email=?");
                    ps.setString(1,doctor_name);
                    ps.setString(2,doctor_email);
                    ps.setInt(3,doctor_age);                    
                    ps.setString(4,doctor_phone);                    
                    ps.setString(5,doctor_hosp_address);
                    ps.setString(6,doctor_dob);
                    ps.setString(7, o_email);
                    ps.executeUpdate();
                    
                    
                    
                    
                    PreparedStatement ps3=connection.prepareStatement("UPDATE appointment SET doctorname=?,doctoremail=? WHERE doctoremail=?");
                    ps3.setString(1,doctor_name);
                    ps3.setString(2,doctor_email);
                    ps3.setString(3,o_email);
                    ps3.executeUpdate();
                    
                    
                
                    if(disease.equals("Cardiovascular"))
                    {
                    
                    PreparedStatement ps1=connection.prepareStatement("UPDATE cardio SET doctorname=? WHERE doctorname=? ");
                    ps1.setString(1,doctor_name);
                    ps1.setString(2,o_name);
                    ps1.executeUpdate();
                    
                    }
                    
                    
                    if(disease.equals("Diabetics"))
                    {
                    PreparedStatement ps2=connection.prepareStatement("UPDATE diabetics SET doctorname=? WHERE doctorname=?");
                    ps2.setString(1,doctor_name);
                    ps2.setString(2,o_name);                    
                    ps2.executeUpdate();
                    
                    }
                     JOptionPane.showMessageDialog(null,"Doctor Change Success \n Name set to "+doctor_name+"\n Email set to "+doctor_email);
                    

                
                    PreparedStatement ps4=connection.prepareStatement("UPDATE patient SET doctor=? WHERE doctor=?");
                    ps4.setString(1,doctor_name);
                    ps4.setString(2,o_name);
                    ps4.executeUpdate();
                
                    session.setAttribute("email",doctor_email);
                    session.setAttribute("name",doctor_name);
                    session.setAttribute("Specalization",disease );
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null,e);
                }finally {
                JOptionPane.showMessageDialog(null,"For security purpose please Login again..!!");
                response.sendRedirect("Doctor_Login_Page.jsp");
            }

%>