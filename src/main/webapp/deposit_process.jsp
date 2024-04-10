<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Deposit Process</title>
</head>
<body>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/bank";
    String dbUsername = "root"; 
    String dbPassword = "Prav@bvn1"; 

    String type = "Deposit";
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    String time = dtf.format(now);

    String Account = request.getParameter("Account");
    double amount = Double.parseDouble(request.getParameter("amount"));

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Get the balance of the user
        String getUserBalanceQuery = "SELECT balance FROM users WHERE account_number=?";
        PreparedStatement getUserBalanceStmt = connection.prepareStatement(getUserBalanceQuery);
        getUserBalanceStmt.setString(1, Account);
        ResultSet userBalanceResultSet = getUserBalanceStmt.executeQuery();
        double userBalance = 0;
        if (userBalanceResultSet.next()) {
            userBalance = userBalanceResultSet.getDouble("balance");
        }
        getUserBalanceStmt.close();


        // Update user's balance after money transfer
        String updateUserBalanceQuery = "UPDATE users SET balance=balance+? WHERE account_number=?";
        PreparedStatement updateUserBalanceStmt = connection.prepareStatement(updateUserBalanceQuery);
        updateUserBalanceStmt.setDouble(1, amount);
        updateUserBalanceStmt.setString(2, Account);
        int updateUserBalanceResult = updateUserBalanceStmt.executeUpdate();
        updateUserBalanceStmt.close();

        String insertQuery = "INSERT INTO transactions (account_number, type, amount, time) " +  "VALUES ( ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, Account);
        preparedStatement.setString(2, type);
        preparedStatement.setDouble(3, amount);
        preparedStatement.setString(4, time);
        preparedStatement.executeUpdate();


        preparedStatement.close();

        response.sendRedirect("./user_dashboard.jsp");


        connection.close();
    } catch (Exception e) {
        e.printStackTrace();
        // Redirect to an error page or display an error message
        response.sendRedirect("./deposit.jsp?error=error_occurred");
    }
%>
</body>
</html>
