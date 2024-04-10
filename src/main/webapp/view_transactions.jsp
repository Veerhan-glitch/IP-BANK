<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Transaction</title>
    <link rel="stylesheet" type="text/css" href="./CSS/view_users.css">
    <!-- Include other necessary resources (CSS, JavaScript) -->
</head>
<body>
    <div class="header">
        <a href="./admin_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Admin Dashboard - Transaction History</h1>
    </div>
    
    <jsp:include page="admin_sidebar.html" />

    
    <div class="content">
        <h2 align="center">Transaction History</h2>
        <table class="users-table">
            <tr>
                <th>time</th>
                <th>Account</th>
                <th>type</th>
                <th>amount</th>
            </tr>
            
            <% 
                
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank"; 
                String dbUsername = "root"; 
                String dbPassword = "Prav@bvn1"; 
                
                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);
                    
                    
                    String sql = "SELECT * FROM transactions";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    
                    
                    while (resultSet.next()) {
                        String time = resultSet.getString("time");
                        String Account = resultSet.getString("account_number");
                        String type = resultSet.getString("type");
                        String amount = resultSet.getString("amount");
                        
                        out.println("<tr>");
                        out.println("<td>" + time + "</td>");
                        out.println("<td>" + Account + "</td>");
                        out.println("<td>" + type + "</td>");
                        out.println("<td>  ₹" + amount + "</td>");
                        out.println("</tr>");
                    }
                    
                    //Close resources
                    resultSet.close();
                    preparedStatement.close();
                    connection.close();
                } catch (Exception e) {
                    out.println("An error occurred: " + e.getMessage());
                }
            %>
            
        </table>
    </div>
    
    <jsp:include page="footer.html" />

</body>
</html>
