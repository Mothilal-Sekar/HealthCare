<%-- 
    Document   : Patient_Password_Change
    Created on : 28 Apr, 2020, 11:49:12 PM
    Author     : MLDon_PC
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.PreparedStatement" %>
<%@include file="Connection.jsp" %>

<%
    String email=(String)session.getAttribute("email"); 
    String disease=(String)session.getAttribute("disease");
    String Old_Password=request.getParameter("o_pass");
        try {
        PreparedStatement ps=connection.prepareStatement("select password from patient where email=?");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        String old_pass=null;
        while(rs.next()){
            old_pass=rs.getString("password");
        }
          session.setAttribute("email", email);
            session.setAttribute("dissease", disease);
        if(old_pass.equals(Old_Password))
        {
            String New_Password=request.getParameter("n_pass");
            String Confirm_Password=request.getParameter("nc_pass");
            if(New_Password.equals(Confirm_Password)){
                
                    PreparedStatement ps1=connection.prepareStatement("UPDATE patient SET password=? WHERE email=?");
                    ps1.setString(1,New_Password);
                    ps1.setString(2,email);
                    ps1.executeUpdate();
                
                JOptionPane.showMessageDialog(null,"Password Changed Sucessfully\nFor security purpose please Login again..!!");
                response.sendRedirect("Patient_Login_Page.jsp");
            }
            else
                JOptionPane.showMessageDialog(null,"Comfirm Password Wrong");
                response.sendRedirect("Patient_Change_Password_Page.jsp");
        }
        else
            JOptionPane.showMessageDialog(null,"Old Password Wrong");
            response.sendRedirect("Patient_Change_Password_Page.jsp");
        } catch (Exception e) {
           
        }
        %>