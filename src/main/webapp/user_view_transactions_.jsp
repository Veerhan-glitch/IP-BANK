<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Transaction history</title>
    <link rel="stylesheet" type="text/css" href="./CSS/styles.css">
    
    <%
    String accountNumber = (String) session.getAttribute("accountNumber");

    if (accountNumber == null) {
        // User is not logged in, handle accordingly
        response.sendRedirect("./login.jsp");
    }
%>

<script>
        function togglePinVisibility() {
            var pinElement = document.getElementById("pin");
            var toggleButton = document.getElementById("toggleButton");

            if (pinElement.type === "password") {
                pinElement.type = "text";
                toggleButton.textContent = "Hide";
            } else {
                pinElement.type = "password";
                toggleButton.textContent = "Show";
            }
        }
    </script>
    
</head>
<body>
    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>Transaction History</h1>
    </div>
    <jsp:include page="side_bar.html" />
    <div class="content">
        <table class="users-table">
            <tr>
                <th>time</th>
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
                    
                    String account_Number = (String) session.getAttribute("accountNumber");
                    
                    String sql = "SELECT * FROM transactions WHERE account_number = ?";
                    PreparedStatement preparedStatement = connection.prepareStatement(sql);
                    preparedStatement.setString(1, account_Number);
                    ResultSet resultSet = preparedStatement.executeQuery();
                    
                    while (resultSet.next()) {
                        String time = resultSet.getString("time");
                        String Account = resultSet.getString("account_number");
                        String type = resultSet.getString("type");
                        String amount = resultSet.getString("amount");
                        
                        out.println("<tr>");
                        out.println("<td>" + time + "</td>");
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
