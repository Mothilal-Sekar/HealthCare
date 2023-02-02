<%-- 
    Document   : Connection
    Created on : 14 May, 2020, 5:51:53 PM
    Author     : MLDon_PC
--%>

<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%!
	Connection connection=null;
	Statement statement=null;
%>
<%
	try {              
		Class.forName("com.mysql.cj.jdbc.Driver");		
		

                //WEB HOST CONNECTION
   
                /*String URL="jdbc:mysql://db4free.net:3306/phoenixhealth";
		String USER="phoenixcare";
		String PASS="root@mpdg";*/
                
                
                //LOCAL HOST CONNECTION
                
                String URL="jdbc:mysql://localhost:3306/healthcare";
		String USER="root";
		String PASS="root";
                
                
		connection=DriverManager.getConnection(URL,USER,PASS);
		statement=connection.createStatement();
	}
	catch(Exception e){
		JOptionPane.showMessageDialog(null,e);
	}
%>