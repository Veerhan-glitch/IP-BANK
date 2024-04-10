<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>My Account Details</title>
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
            } 
            else {
                pinElement.type = "password";
                toggleButton.textContent = "Show";
            }
        }
    </script>
</head>
<body>

    <div class="user-header">
        <a href="./user_dashboard.jsp"><img src="./img/logo-no-background v-2.png"></a>
        <h1>User Dashboard</h1>
    </div>
    
    <jsp:include page="side_bar.html" />
    
    <div class="content">
        <h2>My Account Details</h2>
        <% 
            try {
                String jdbcUrl = "jdbc:mysql://localhost:3306/bank";
                String dbUsername = "root";
                String dbPassword = "Prav@bvn1";
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword);

                //String accountNumber = "123456789"; // Replace with the user's account number

                String query = "SELECT * FROM users WHERE account_number = ?";
                PreparedStatement preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, accountNumber);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    String name = resultSet.getString("name");
                    //String accountNumber = resultSet.getString("account_number");
                    String fatherName = resultSet.getString("father_name");
                    String dob = resultSet.getString("dob");
                    String gender = resultSet.getString("gender");
                    String email = resultSet.getString("email");
                    String mobile = resultSet.getString("mobile");
                    String address = resultSet.getString("address");
                    String nationality = resultSet.getString("nationality");
                    String pan = resultSet.getString("pan");
                    String aadhaar= resultSet.getString("aadhaar");
                    String pin = resultSet.getString("pin");
                    String balance = resultSet.getString("balance");
                    // Retrieve more fields as needed

                    out.println("<p><strong>Account Number:</strong> " + accountNumber + "</p>");
                    out.println("<p><strong>Name:</strong> " + name + "</p>");
                    out.println("<p><strong>Father's Name:</strong> " + fatherName + "</p>");
                    out.println("<p><strong>Date of Birth:</strong> " + dob + "</p>");
                    out.println("<p><strong>Gnder:</strong> " + gender + "</p>");
                    out.println("<p><strong>Email:</strong> " + email + "</p>");
                    out.println("<p><strong>Mobile:</strong> " + mobile + "</p>");
                    out.println("<p><strong>Address:</strong> " + address + "</p>");
                    out.println("<p><strong>Nationality:</strong> " + nationality + "</p>");
                    out.println("<p><strong>PAN Number:</strong> " + pan + "</p>");
                    out.println("<p><strong>Aadhaar Number:</strong> " + aadhaar + "</p>");
                    out.println("<p><strong>PIN:</strong> <input type='password' id='pin' value='" + pin + "' readonly><button id='toggleButton' onclick='togglePinVisibility()'>Show</button></p>");
                    out.println("<p><strong>Balance:</strong> " + balance + "</p>");
                    // Display more fields as needed
                } else {
                    out.println("<p>No account details found.</p>");
                }

                resultSet.close();
                preparedStatement.close();
                connection.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>An error occurred. Please try again later.</p>");
            }
        %>
    </div>
    
    <jsp:include page="footer.html"/>
    </body>
    </html>
    