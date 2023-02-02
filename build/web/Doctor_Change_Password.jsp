<%-- 
    Document   : Doctor_Password_Change
    Created on : 28 Apr, 2020, 10:49:29 PM
    Author     : MLDon_PC
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@include file="Connection.jsp" %>
<%
    String email=(String)session.getAttribute("email");
    String old_pass=request.getParameter("o_pass");
    
    
    try {
        PreparedStatement ps=connection.prepareStatement("select password from doctor where email=?");
        ps.setString(1,email);
        ResultSet rs=ps.executeQuery();
        String Old_Password=null;
        while(rs.next()){
            Old_Password=rs.getString("password");
        }
        
        if(old_pass.equals(Old_Password)) {
            String New_Password=request.getParameter("n_pass");
            String Confirm_Password=request.getParameter("nc_pass");
            if(New_Password.equals(Confirm_Password)){
                    PreparedStatement ps1=connection.prepareStatement("UPDATE doctor SET password=? WHERE email=?");
                    ps1.setString(1,New_Password);
                    ps1.setString(2,email);
                    ps1.executeUpdate();
                
                JOptionPane.showMessageDialog(null,"Password Changed Sucessfully\nFor security purpose please Login again..!!");                
            }
            else
                JOptionPane.showMessageDialog(null,"Comfirm Password Wrong");               
        }
        else
            JOptionPane.showMessageDialog(null,"Old Password Wrong");
            
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null,"Exception : "+e);            
        }
        finally {
            response.sendRedirect("Doctor_Login_Page.jsp");
        }
%>