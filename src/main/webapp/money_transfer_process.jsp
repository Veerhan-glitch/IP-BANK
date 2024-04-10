<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.time.format.DateTimeFormatter, java.time.LocalDateTime, javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Money Transfer Process</title>
</head>
<body>
<%
    String jdbcUrl = "jdbc:mysql://localhost:3306/bank";
    String dbUsername = "root"; 
    String dbPassword = "Prav@bvn1"; 

    String fromAccount = request.getParameter("fromAccount");
    String toAccount = request.getParameter("toAccount");
    double amount = Double.parseDouble(request.getParameter("amount"));

    String type = "Sent to Account: " + toAccount;
    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    String time = dtf.format(now);
try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

        // Get the balance of the user
        String getUserBalanceQuery = "SELECT balance FROM users WHERE account_number=?";
        PreparedStatement getUserBalanceStmt = connection.prepareStatement(getUserBalanceQuery);
        getUserBalanceStmt.setString(1, fromAccount);
        ResultSet userBalanceResultSet = getUserBalanceStmt.executeQuery();
        double userBalance = 0;
        if (userBalanceResultSet.next()) {
            userBalance = userBalanceResultSet.getDouble("balance");
        }
        getUserBalanceStmt.close();

        if (userBalance >= amount) {
            // Update user's balance after money transfer
            String updateUserBalanceQuery = "UPDATE users SET balance=balance-? WHERE account_number=?";
            PreparedStatement updateUserBalanceStmt = connection.prepareStatement(updateUserBalanceQuery);
            updateUserBalanceStmt.setDouble(1, amount);
            updateUserBalanceStmt.setString(2, fromAccount);
            int updateUserBalanceResult = updateUserBalanceStmt.executeUpdate();
            updateUserBalanceStmt.close();

            // Update recipient's balance after money transfer
            String updateRecipientBalanceQuery = "UPDATE users SET balance=balance+? WHERE account_number=?";
            PreparedStatement updateRecipientBalanceStmt = connection.prepareStatement(updateRecipientBalanceQuery);
            updateRecipientBalanceStmt.setDouble(1, amount);
            updateRecipientBalanceStmt.setString(2, toAccount);
            int updateRecipientBalanceResult = updateRecipientBalanceStmt.executeUpdate();
            updateRecipientBalanceStmt.close();
        } else {
            // Redirect to an error page or display an error message
            response.sendRedirect("./money_transfer.jsp");
        }

        String insertQuery = "INSERT INTO transactions (account_number, type, amount, time) " +  "VALUES ( ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery);
        preparedStatement.setString(1, fromAccount);
        preparedStatement.setString(2, type);
        preparedStatement.setDouble(3, amount);
        preparedStatement.setString(4, time);
        preparedStatement.executeUpdate();


        preparedStatement.close();

        response.sendRedirect("./user_dashboard.jsp");


        connection.close();

    }catch (Exception e) {
        e.printStackTrace();
        // Redirect to an error page or display an error message
        response.sendRedirect("./money_transfer.jsp");
    }
%>
</body>
</html>
