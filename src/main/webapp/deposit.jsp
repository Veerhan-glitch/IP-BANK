<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.List, java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <title>Money Transfer</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
    
    <%
        String accountNumber = (String) session.getAttribute("accountNumber");
        double userBalance = 0;
        
        if (accountNumber == null) {
            // User is not logged in, handle accordingly
            response.sendRedirect("./login.jsp");
        } 
        else {
            String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; // Update with your database URL
            String dbUsername = "root"; // Update with your database username
            String dbPassword = "Prav@bvn1"; // Update with your database password

            Connection connection = null;
            PreparedStatement preparedStatement = null;
            ResultSet resultSet = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                // Get the current user's balance
                String getUserBalanceQuery = "SELECT balance FROM users WHERE account_number = ?";
                preparedStatement = connection.prepareStatement(getUserBalanceQuery);
                preparedStatement.setString(1, accountNumber);
                resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    userBalance = resultSet.getDouble("balance");
                }

            } catch (Exception e) {
                e.printStackTrace();
            }  finally {
                // Close resources safely using try-with-resources
                try {
                    if (resultSet != null) {
                        resultSet.close();
                    }
                    if (preparedStatement != null) {
                        preparedStatement.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
        }
    %>
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Deposit</h1>
    </div>

    <jsp:include page="side_bar.html" />

    <div class="user-content money-transfer-content">
        <form action="./deposit_process.jsp" method="post">
            <div class="form-field">
                <label for="Account">Your Account:</label>
                <input type="text" id="Account" name="Account" value="<%= accountNumber %>" readonly>
            </div>
            
            <div class="form-field">
                <label for="userBalance">Your Current Balance:</label>
                <input type="text" id="userBalance" name="userBalance" value="<%= userBalance %>" readonly>
            </div>
            
            <div class="form-field">
                <label for="amount">Amount:</label>
                <input type="number" id="amount" name="amount" step="0.01" required>
            </div>
            
            <button type="submit">Deposit</button>
        </form>
    </div>

    <jsp:include page="footer.html" />
</body>
</html>
