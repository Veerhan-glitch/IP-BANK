<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Delete User</title>
</head>
<body>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; 
    String dbUsername = "root"; 
    String dbPassword = "Prav@bvn1";
    String accountNumberToDelete = request.getParameter("accountNumber");

    Connection connection = null;
    PreparedStatement deleteUserStatement = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        String deleteUserQuery = "DELETE FROM users WHERE account_number = ?";
        deleteUserStatement = connection.prepareStatement(deleteUserQuery);
        deleteUserStatement.setString(1, accountNumberToDelete);

        int rowsDeleted = deleteUserStatement.executeUpdate();

        if (rowsDeleted > 0) {
            out.println("<h2>User record deleted successfully!</h2>");
            response.sendRedirect("./view_users.jsp");

        } else {
            out.println("<h2>Failed to delete user record.</h2>");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<h2>Error occurred while deleting user record.</h2>");
    } finally {
        
        if (deleteUserStatement != null) {
            deleteUserStatement.close();
        }
        if (connection != null) {
            connection.close();
        }
    }
%>
</body>
</html>
