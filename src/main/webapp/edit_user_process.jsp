<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update User Process</title>
     <% String accountNumber = request.getParameter("accountNumber"); %>
</head>
<body>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; 
    String dbUsername = "root"; 
    String dbPassword = "Prav@bvn1"; 

    try {
        // Retriving values
        String name = request.getParameter("name");
        String fatherName = request.getParameter("fatherName");
        String gender = request.getParameter("gender");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String nationality = request.getParameter("nationality");
        String pan = request.getParameter("pan");
        String aadhaar = request.getParameter("aadhaar");
        String pin = request.getParameter("pin");
        String balance = request.getParameter("balance");
        
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        String updateQuery = "UPDATE users SET name=?, father_name=?, gender=?, email=?, mobile=?, nationality=?, pan=?, aadhaar=?, pin=?, balance=? WHERE account_number=?";
        PreparedStatement preparedStatement = connection.prepareStatement(updateQuery);
        
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, fatherName);
        preparedStatement.setString(3, gender);
        preparedStatement.setString(4, email);
        preparedStatement.setString(5, mobile);
        preparedStatement.setString(6, nationality);
        preparedStatement.setString(7, pan);
        preparedStatement.setString(8, aadhaar);
        preparedStatement.setString(9, pin);
        preparedStatement.setString(10, balance);
        preparedStatement.setString(11, accountNumber);
        
        int rowsAffected = preparedStatement.executeUpdate();

        if (rowsAffected > 0) {
           response.sendRedirect("./view_users.jsp");
        } else {
           response.sendRedirect("./edit_user.jsp?accountNumber=" + accountNumber);
        }

        preparedStatement.close();
        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        response.sendRedirect("./edit_user.jsp?accountNumber=" + accountNumber );
    }
%>
</body>
</html>
